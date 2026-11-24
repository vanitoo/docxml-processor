# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Build System Notes
- Dockerfiles use multi-stage .NET 8 builds; no precompiled binaries required.
- Linux paths are case-sensitive; preserve actual project directory names.
- CI runs six test projects before building/publishing images.

## Service Architecture
- Background services (XsltProcessor, PdfProcessor, OldFileWatcher) run for fixed 60-minute duration then exit, not continuously
- Message processing includes automatic retry logic for failed RabbitMQ message sends (up to 2 attempts)
- XSLT processing converts XML to HTML and sends results to both PDF processor and API simultaneously

## File Handling
- XsltProcessor requires xsd/\*\* and xslt/\*\* directories copied to output (configured in .csproj CopyToOutputDirectory=Always)
- Processing pipeline: XML input -> XSLT transformation -> HTML output -> distributed to PDF and API queues

## Development Notes
- Automated unit tests are configured in .github/workflows/tests.yml.
- Directory.Build.props enables .NET and Roslynator analyzers.
- NLog configured for file and console logging with specific rules for ASP.NET Core and EF Core