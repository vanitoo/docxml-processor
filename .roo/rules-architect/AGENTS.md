# Project Architecture Rules (Non-Obvious Only)

- Background processing services implement time-limited execution (60-minute cycles)
- Message queuing architecture routes single XSLT results to dual consumer destinations
- Docker containerization requires compiled binary artifacts for image construction
- RabbitMQ integration includes custom error handling and message retry mechanisms
- XML processing pipeline depends on embedded schema and transformation resources