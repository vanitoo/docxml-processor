# Project Debug Rules (Non-Obvious Only)

- Services terminate automatically after 60 minutes of execution (not continuous runtime)
- RabbitMQ message processing includes built-in retry logic for failed transmissions
- Docker container builds require pre-compiled binaries from obj/Debug/ directories
- NLog configuration filters ASP.NET Core and EF Core logs to Info level or below