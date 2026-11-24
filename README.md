[![Build and Push Docker Images](https://github.com/vanitoo/docxml-processor/actions/workflows/docker.yml/badge.svg)](https://github.com/vanitoo/docxml-processor/actions/workflows/docker.yml)
[![Unit Tests](https://github.com/vanitoo/docxml-processor/actions/workflows/tests.yml/badge.svg)](https://github.com/vanitoo/docxml-processor/actions/workflows/tests.yml)
[![Code Quality](https://github.com/vanitoo/docxml-processor/actions/workflows/code-quality.yml/badge.svg)](https://github.com/vanitoo/docxml-processor/actions/workflows/code-quality.yml)

# Document XML Processor

Система обработки XML документов с использованием XSLT трансформаций, генерации PDF и REST API для управления процессом обработки.

## Архитектура проекта

Проект состоит из следующих компонентов:

| Компонент | Назначение |
|-----------|------------|
| **DocumentXmlProcessorAPI** | ASP.NET Core Web API для управления процессом обработки документов |
| **XsltProcessor** | Сервис XSLT-трансформаций: преобразование XML → HTML |
| **PdfProcessor** | Сервис генерации PDF из HTML |
| **OldFileWatcher** | Сервис мониторинга файловой системы |
| **ProcessingCommon** | Общие компоненты, интерфейсы и модели |
| **DocumentXmlProcessorContext** | Контекст Entity Framework Core для PostgreSQL |
| **XsltTester** | Утилита для тестирования XSLT-трансформаций |

## Стек технологий

- **.NET 8.0**
- ASP.NET Core Web API
- Entity Framework Core + PostgreSQL
- RabbitMQ (обмен сообщениями)
- Docker + docker-compose
- NLog (логирование)

## Конвейер обработки данных

```
XML-файл → OldFileWatcher (мониторинг) → 
→ XsltProcessor (XSLT: XML → HTML) → 
→ [PdfProcessor (HTML → PDF) + DocumentXmlProcessorAPI (HTML)]
```

## Быстрый старт

### Сборка и запуск

```bash
cd Deploy/xslt_processor_git
bash update.sh
```

API будет доступно на порту **5000**.

### Требования

- .NET 8.0 SDK (для локальной сборки)
- Docker и Docker Compose
- PostgreSQL (хост: 192.168.12.202:5432)
- RabbitMQ (хост: 192.168.12.212)

## CI/CD

### GitHub Actions (основной)

Проект использует GitHub Actions для автоматизированной сборки и публикации Docker-образов.

#### Триггеры запуска

- Пуш в ветку `main` или `master` — тесты, сборка и публикация в GHCR
- Создание тега `v*` (например, `v8.22`) — тесты, публикация версии и GitHub Release
- Pull Request — тесты и сборка без публикации

#### Публикация в registry

Образы публикуются в GitHub Container Registry: `ghcr.io/{owner}/docxml-processor`

Теги:
- `${SERVICE}:${VERSION}` — версионный тег: `YYYY.MM.DD-HHMMSS-RUN_NUMBER-SHA` для push, `8.22` для тега `v8.22`
- `${SERVICE}:latest` — продвигается только после успешных тестов и сборки всех четырёх образов. Продвижение тегов не атомарно; update.sh проверяет совпадение версии и ревизии.

#### Обновление сервисов

```bash
# Логин в GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin

cd Deploy/xslt_processor_git
bash update.sh
# Для просмотра логов: bash update.sh --logs
```

## Тестирование

```bash
# Запуск всех тестов
dotnet test DocumentXmlProcessor.Tests.sln -c Release
```

## Конфигурация

Основные настройки в `appsettings.json`:
- Подключение к PostgreSQL
- Настройки RabbitMQ
- Конфигурация NLog

## Безопасность

Политика безопасности описана в файле [SECURITY.md](SECURITY.md).

## Лицензия

Проект распространяется под лицензией Apache License 2.0 — подробности в файле [LICENSE](LICENSE).

## Руководство для разработчиков

Для эффективной работы с проектом ознакомьтесь с файлами:
- `AGENTS.md` — основные правила и особенности проекта
- `KODA.md` — инструкции для AI-ассистентов



## Защита образов и хранение GHCR

- Четыре основных сервиса запускаются от встроенного пользователя .NET `app` (UID/GID 1654). Cleaner с cron и инфраструктурные контейнеры не изменены.
- Перед обновлением проверьте права на bind mount `Data`. При необходимости администратор может предоставить доступ через ACL: `sudo setfacl -Rm u:1654:rwX Data` и `sudo find Data -type d -exec setfacl -m d:u:1654:rwx {} +`. Не меняйте владельца данных вслепую.
- Trivy проверяет каждый собранный образ до отправки в GHCR. JSON-отчёты доступны в Actions 30 дней. Публикация блокируется при CRITICAL с доступным исправлением; остальные CVE остаются в отчёте.
- GHCR retention: еженедельно удаляются только CI-версии старше 90 дней за пределами 30 последних CI-версий каждого сервиса. `latest`, релизные и прочие пользовательские теги, а также нетегированные манифесты сохраняются. Ручной запуск по умолчанию dry-run; для удаления включите apply. Репозиторий должен иметь admin-доступ к четырём пакетам GHCR. Для длительно используемой версии создайте защищённый пользовательский тег или резервную копию в локальном registry.
