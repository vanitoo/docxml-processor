# Project Documentation Rules (Non-Obvious Only)

- Services run for predetermined 60-minute intervals rather than indefinite operation
- Docker build process depends on pre-existing compiled binaries in obj/Debug/ folders
- Message routing distributes XSLT processing results to multiple consumer queues simultaneously
- XSD schema files must be embedded in XsltProcessor output for XML validation operations