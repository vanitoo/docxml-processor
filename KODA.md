# KODA.md — Инструкции для AI-ассистентов

Данный файл содержит контекстные инструкции для эффективной работы с проектом **Document XML Processor**. Все правила и рекомендации основаны на анализе кодовой базы и конфигурационных файлов проекта.

---

## 1. Обзор проекта

### Назначение

Система обработки XML-документов с использованием XSLT-трансформаций, генерации PDF и REST API для управления процессом обработки. Проект реализует конвейер обработки документов: XML → XSLT-трансформация → HTML → PDF.

### Основные компоненты

| Компонент | Назначение |
|-----------|------------|
| **DocumentXmlProcessorAPI** | ASP.NET Core Web API для управления процессом обработки документов |
| **XsltProcessor** | Сервис XSLT-трансформаций: преобразование XML → HTML |
| **PdfProcessor** | Сервис генерации PDF из HTML |
| **OldFileWatcher** | Сервис мониторинга файловой системы |
| **ProcessingCommon** | Общие компоненты, интерфейсы и модели |
| **DocumentXmlProcessorContext** | Контекст Entity Framework Core для PostgreSQL |
| **XsltTester** | Утилита для тестирования XSLT-трансформаций |

### Технологический стек

- **.NET 7.0**
- **ASP.NET Core Web API**
- **Entity Framework Core** + PostgreSQL
- **RabbitMQ** для обмена сообщениями
- **Docker** + docker-compose
- **NLog** для логирования
- **GitHub Actions** для CI/CD

---

## 2. Архитектура системы

### Конвейер обработки данных

```
XML-файл → OldFileWatcher (мониторинг) → 
→ XsltProcessor (XSLT: XML → HTML) → 
→ [PdfProcessor (HTML → PDF) + DocumentXmlProcessorAPI (HTML)]
```

### Особенности архитектуры

- **Время работы сервисов**: Фоновые сервисы (XsltProcessor, PdfProcessor, OldFileWatcher) работают фиксированно 60 минут, затем завершаются. Это непрерывные демоны.
- **Очереди сообщений**: RabbitMQ используется для асинхронного обмена сообщениями между сервисами.
- **Retry-логика**: При отправке сообщений в RabbitMQ реализована автоматическая повторная попытка (до 2 попыток при сбое).
- **Двойная маршрутизация**: Результаты XSLT-трансформации одновременно отправляются в очередь PDF-процессора и API.

---

## 3. Сборка и запуск проекта

### Предварительные требования

- .NET 7.0 SDK
- Docker и Docker Compose
- PostgreSQL (хост: 192.168.12.202:5432)
- RabbitMQ (хост: 192.168.12.212)

### Сборка проекта

#### Вариант 1: GitHub Actions (рекомендуется)

При пуше в `main` или создании тега `v*` автоматически запускается сборка:

```bash
# Создание тега для сборки и публикации
git tag v8.10
git push origin v8.10
```

Образы публикуются в GitHub Container Registry:
- `ghcr.io/{owner}/docxml-processor/{service}:{version}`
- `ghcr.io/{owner}/docxml-processor/{service}:latest`

#### Вариант 2: Скрипт BuildAndPublish.cmd

```cmd
BuildAndPublish.cmd
```

Скрипт выполняет:
1. Чтение версии из файла `VERSION`
2. Сборку Docker-образов для всех сервисов
3. Тегирование образов с версией и latest
4. Публикацию в приватный registry (192.168.12.104:5050)

#### Вариант 3: Docker Compose

```bash
docker-compose build
docker-compose up
```

**Важно**: В проекте есть известная проблема с чувствительностью к регистру — `docker-compose.yml` ссылается на `DocumentXMLProcessorAPI/`, но реальная директория называется `DocumentXmlProcessorAPI/`. Это может вызывать ошибки на Linux Docker хостах.

#### Вариант 3: Ручная сборка через Docker

```bash
docker build -t file_watcher:<VERSION> -f Dockerfile-file_watcher .
docker build -t pdf_processor:<VERSION> -f Dockerfile-pdf_processor .
docker build -t xslt_processor:<VERSION> -f Dockerfile-xslt_processor .
docker build -t api_processor:<VERSION> -f Dockerfile-api_processor .
```

### Запуск

```bash
docker-compose up -d
```

API будет доступно на порту 5000.

### Особенности Docker-сборки

- **Multi-stage build**: Dockerfiles используют multi-stage сборку — компиляция происходит внутри контейнера, предварительная компиляция не требуется.
- **Выходные файлы**: Для корректной работы XsltProcessor в выходную директорию должны быть скопированы директории `xsd/**` и `xslt/**` (настроено в `.csproj` как `CopyToOutputDirectory=Always`).

---

## 4. Конфигурация

### Основные настройки (appsettings.json)

```json
{
  "ConnectionStrings": {
    "Default": "Host=192.168.12.202;Port=5432;Database=DocumentXmlProcessor;Username=postgres;Password=..."
  },
  "Rabbit": {
    "Connection": "192.168.12.212",
    "UserName": "provider",
    "UserPassword": "..."
  }
}
```

### Настройки логирования (NLog)

- Файлы логов: `${basedir}/logs/nlog-${shortdate}.log`
- Microsoft.AspNetCore.* — уровень Info и ниже
- Microsoft.EntityFrameworkCore.* — уровень Info и ниже
- Остальные логи — уровень Trace и выше

### Управление версиями

- Версия хранится в файле `VERSION` (текущая версия: 8.9)
- При сборке версия читается из файла и используется для тегирования Docker-образов

---

## 5. CI/CD

### GitHub Actions (основной)

Проект использует GitHub Actions для автоматизированной сборки и публикации Docker-образов. Workflow определён в `.github/workflows/docker.yml` и выполняет:

1. **Checkout** — загрузка кода из репозитория
2. **Get Version** — чтение версии из файла `VERSION`
3. **Build** — сборка для каждого сервиса:
   - file_watcher
   - pdf_processor
   - xslt_processor
   - api_processor
4. **Push** — публикация образов в GitHub Container Registry

#### Триггеры запуска

- Пуш в ветку `main` или `master` — сборка без пуша в registry
- Создание тега `v*` (например, `v8.10`) — сборка с пушем в registry

#### Публикация в registry

Образы публикуются в GitHub Container Registry: `ghcr.io/{owner}/docxml-processor`

Теги:
- `${SERVICE}:${VERSION}` — конкретная версия (например, `ghcr.io/owner/docxml-processor/api_processor:8.9`)
- `${SERVICE}:latest` — latest
- `${SERVICE}:sha-*` — хеш коммита

### Jenkins Pipeline (резервный)

Для обратной совместимости сохранён Jenkins pipeline в `Jenkinsfile`. Публикует в приватный registry `192.168.12.104:5050`.

### Обновление сервисов из GitHub

После успешного выполнения GitHub Actions (при пуше тега) необходимо обновить сервисы:

```bash
# Логин в GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin

# Pull новых образов
docker pull ghcr.io/{owner}/docxml-processor/file_watcher:latest
docker pull ghcr.io/{owner}/docxml-processor/pdf_processor:latest
docker pull ghcr.io/{owner}/docxml-processor/xslt_processor:latest
docker pull ghcr.io/{owner}/docxml-processor/api_processor:latest

# Перезапуск docker-compose
docker-compose up -d
```

#### Обновление с конкретной версией

```bash
# Укажите версию из файла VERSION
VERSION=$(cat VERSION)
docker-compose -f docker-compose.yml pull
docker-compose -f docker-compose.yml up -d

# Или с явным указанием версии
docker pull ghcr.io/{owner}/docxml-processor/api_processor:8.9
```

---

## 6. Правила разработки

### Стиль кодирования

- Используется EditorConfig (`.editorconfig`) для единого стиля кода
- Основа — соглашения Microsoft для C#
- Рекомендуется использовать file-scoped namespaces

### Тестирование

- **Тестовый фреймворк не настроен**
- Автоматическое тестирование не предусмотрено
- XsltTester предоставляет утилиту для ручного тестирования XSLT-трансформаций

### Линтинг

Проект использует следующие инструменты:

- **EditorConfig** (`.editorconfig`) — базовые правила форматирования и стиля
- **Roslynator.Analyzers** — анализ качества кода (подключён через `Directory.Build.props`)
- **Microsoft.CodeAnalysis.NetAnalyzers** — встроенные .NET анализаторы
- **dotnet-format** — проверка форматирования

#### Запуск линтеров локально

```bash
# Установка инструментов
dotnet tool install --global Roslynator.DotNet.Cli --version 4.6.1
dotnet tool install --global dotnet-format --version 7.0.453106

# Анализ кода
roslynator analyze . --severity warning

# Проверка форматирования
dotnet format --verify-no-changes
```

#### GitHub Actions

Линтинг запускается автоматически при пуше в `main`/`master` и в PR. Workflow: `.github/workflows/code-quality.yml`

### Работа с зависимостями

- Восстановление пакетов через `nuget.config`
- Зависимости управляются через стандартные `.csproj` файлы
- Глобальные анализаторы подключены через `Directory.Build.props`

---

## 7. Структура проекта

```
/
├── .github/                    # GitHub конфигурация
│   └── workflows/              # GitHub Actions workflows
│       ├── docker.yml          # Сборка и публикация Docker образов
│       └── code-quality.yml    # Проверка качества кода
├── .roo/                       # Правила для AI-ассистентов
│   ├── rules-architect/        # Архитектурные ограничения
│   ├── rules-ask/              # Контекст документации
│   ├── rules-code/             # Правила кодирования
│   └── rules-debug/            # Особенности отладки
├── .history/                   # История версий
├── .editorconfig               # Правила форматирования кода
├── Directory.Build.props       # Глобальные настройки сборки
├── Deploy/                     # Файлы развёртывания
├── DocumentXmlProcessorAPI/    # REST API
│   ├── Controllers/            # API контроллеры
│   ├── Middleware/             # Промежуточное ПО
│   ├── Models/                 # Модели данных
│   ├── Processing/             # Логика обработки
│   ├── Services/               # Бизнес-сервисы
│   └── appsettings.json        # Конфигурация
├── DocumentXmlProcessorContext/# EF Core контекст
├── OldFIleWatcher/             # Сервис мониторинга файлов
├── PdfProcessor/               # Генерация PDF
├── ProcessingCommon/           # Общие компоненты
│   ├── Constants/              # Константы
│   ├── Interfaces/             # Интерфейсы
│   ├── Models/                 # Общие модели
│   └── Services/               # Общие сервисы
├── XsltProcessor/              # XSLT трансформации
│   ├── xsd/                    # XML схемы
│   └── xslt/                   # XSLT шаблоны
├── XsltTester/                 # Утилита тестирования
├── AGENTS.md                   # Основные правила проекта
├── BuildAndPublish.cmd         # Скрипт сборки
├── clean-dotnet.cmd            # Очистка .NET проекта
├── Dockerfile-*                # Docker файлы для каждого сервиса
├── Jenkinsfile                 # Jenkins CI/CD пайплайн
├── KODA.md                     # Инструкции для AI-ассистентов
├── nuget.config                # NuGet конфигурация
├── README.md                   # Документация проекта
└── VERSION                     # Версия проекта
```

---

## 8. Важные замечания для разработки

### Известные проблемы

1. **Регистр в docker-compose.yml**: Файл ссылается на `DocumentXMLProcessorAPI/`, но директория называется `DocumentXmlProcessorAPI/` — может вызывать ошибки на Linux.

2. **Ресурсы XsltProcessor**: Для работы XSLT-процессора требуются файлы схем (xsd) и шаблонов (xslt) в выходной директории.

### Отладка

- Логи хранятся в директории `logs/` каждого сервиса
- NLog настроен на вывод в консоль и файл
- Фоновые сервисы завершаются через 60 минут — это может влиять на отладку длительных процессов

### Безопасность

- В конфигурационных файлах присутствуют пароли и учётные данные (для PostgreSQL и RabbitMQ)
- Секреты не должны быть закоммичены в репозиторий

---

## 9. Полезные команды

### Очистка проекта

```cmd
clean-dotnet.cmd
```

### Сборка через Visual Studio

1. Выполнить сборку через compound BuildAll
2. Скопировать `docker-compose.yml` в папку с собранными проектами
3. Запустить `BuildAndPublish.cmd`

### Проверка версии

```bash
type VERSION
```

---

## 10. Дополнительные источники информации

- `README.md` — основная документация проекта
- `AGENTS.md` — базовые правила для AI-ассистентов
- `.roo/rules-code/AGENTS.md` — правила кодирования
- `.roo/rules-debug/AGENTS.md` — особенности отладки
- `.roo/rules-architect/AGENTS.md` — архитектурные ограничения
- `.roo/rules-ask/AGENTS.md` — контекст документации

---

*Данный файл автоматически сгенерирован на основе анализа структуры проекта и кодовой базы.*
