[![Build and Push Docker Images](https://github.com/vanitoo/document-xml-processor/actions/workflows/docker.yml/badge.svg)](https://github.com/vanitoo/document-xml-processor/actions/workflows/docker.yml)
[![Unit Tests](https://github.com/vanitoo/document-xml-processor/actions/workflows/tests.yml/badge.svg)](https://github.com/vanitoo/document-xml-processor/actions/workflows/tests.yml)
[![Code Quality](https://github.com/vanitoo/document-xml-processor/actions/workflows/code-quality.yml/badge.svg)](https://github.com/vanitoo/document-xml-processor/actions/workflows/code-quality.yml)

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
# Сборка Docker-образов
docker-compose build

# Запуск всех сервисов
docker-compose up -d
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

- Пуш в ветку `main` или `master` — сборка без пуша в registry
- Создание тега `v*` (например, `v8.10`) — сборка с пушем в registry

#### Публикация в registry

Образы публикуются в GitHub Container Registry: `ghcr.io/{owner}/document-xml-processor`

Теги:
- `${SERVICE}:${VERSION}` — конкретная версия (например, `api_processor:8.9`)
- `${SERVICE}:latest` — latest

#### Обновление сервисов

```bash
# Логин в GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin

# Pull новых образов
docker-compose pull

# Перезапуск
docker-compose up -d
```

## Тестирование

```bash
# Запуск всех тестов
dotnet test document-xml-processor.sln
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


