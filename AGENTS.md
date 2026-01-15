# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Build System Notes
- Docker builds require pre-compiled binaries; Dockerfiles copy from obj/Debug/ directories
- docker-compose.yml contains case sensitivity issue: references "DocumentXMLProcessorAPI/" but actual directory is "DocumentXmlProcessorAPI/" (fails on Linux Docker hosts)

## Service Architecture
- Background services (XsltProcessor, PdfProcessor, OldFileWatcher) run for fixed 60-minute duration then exit, not continuously
- Message processing includes automatic retry logic for failed RabbitMQ message sends (up to 2 attempts)
- XSLT processing converts XML to HTML and sends results to both PDF processor and API simultaneously

## File Handling
- XsltProcessor requires xsd/\*\* and xslt/\*\* directories copied to output (configured in .csproj CopyToOutputDirectory=Always)
- Processing pipeline: XML input -> XSLT transformation -> HTML output -> distributed to PDF and API queues

## Development Notes
- No test framework or automated testing configured
- No linting or code style enforcement tools configured
- NLog configured for file and console logging with specific rules for ASP.NET Core and EF Core