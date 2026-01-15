# Document XML Processor

Система обработки XML документов с использованием XSLT трансформаций, генерации PDF и API для управления процессом.

## Архитектура проекта

Проект состоит из следующих компонентов:

- **DocumentXmlProcessorAPI** - ASP.NET Core API для управления процессом обработки документов
- **XsltProcessor** - Сервис обработки XSLT трансформаций XML → HTML
- **PdfProcessor** - Сервис генерации PDF из HTML
- **OldFileWatcher** - Сервис мониторинга файлов
- **ProcessingCommon** - Общие компоненты и модели
- **DocumentXmlProcessorContext** - Контекст базы данных (Entity Framework)
- **XsltTester** - Утилита для тестирования XSLT трансформаций

## Стек технологий

- .NET 7.0
- ASP.NET Core Web API
- Entity Framework Core + PostgreSQL
- RabbitMQ (обмен сообщениями)
- Docker + docker-compose
- NLog (логирование)

## Руководство для AI-ассистентов

Для эффективной работы с проектом ознакомьтесь с файлами:
- `AGENTS.md` - основные правила и особенности проекта
- `.roo/rules-code/AGENTS.md` - правила кодирования
- `.roo/rules-debug/AGENTS.md` - особенности отладки
- `.roo/rules-architect/AGENTS.md` - архитектурные ограничения
- `.roo/rules-ask/AGENTS.md` - контекст документации

## Инструкция по сборке

### Использование Build.bat

1. Выполните сборку проекта через compound BuildAll в Visual Studio
2. Скопируйте `docker-compose.yml` в папку с собранными проектами
3. Запустите `Build.bat` для сборки и публикации образов

### Ручная сборка

Сборка исходников в изображения:
```bash
docker-compose build
```

Добавление тега изображениям:
```bash
docker tag build-old-file-watcher 192.168.12.104:5050/build-old-file-watcher-latest
docker tag build-pdf-processing 192.168.12.104:5050/build-pdf-processing-latest
docker tag build-xslt-processing 192.168.12.104:5050/build-xslt-processing-latest
docker tag build-document-xml-processor-api 192.168.12.104:5050/build-document-xml-processor-api-latest
```

Заливка изображений в приватный registry:
```bash
docker push 192.168.12.104:5050/build-old-file-watcher-latest
docker push 192.168.12.104:5050/build-pdf-processing-latest
docker push 192.168.12.104:5050/build-xslt-processing-latest
docker push 192.168.12.104:5050/build-document-xml-processor-api-latest
```

## Запуск

```bash
docker-compose up
```

API будет доступен на порту 5000.

## Конфигурация

Основные настройки в `appsettings.json`:
- Подключение к PostgreSQL
- Настройки RabbitMQ
- Конфигурация NLog


