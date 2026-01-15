# Project Coding Rules (Non-Obvious Only)

- Docker build process requires pre-compilation before containerization (obj/Debug/ binaries copied to images)
- Services implement fixed-duration execution (60 minutes) rather than continuous operation
- Message processing includes custom retry mechanisms for RabbitMQ communication failures
- XSLT transformations require embedded XSD and XSLT file resources in output directory