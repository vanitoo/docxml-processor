using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using ProcessingCommon.Models.Settings;
using ProcessingCommon.Services;
using XsltProcessor.Services;

var version = File.Exists("./VERSION") ? File.ReadAllText("./VERSION").Trim() : "unknown";
Console.WriteLine($"[STARTUP] XsltProcessor v{version} starting...");

IConfigurationRoot configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false)
    .Build();

var services = new ServiceCollection()
    .Configure<RabbitSettings>(configuration.GetSection("Rabbit"))
    .AddLogging(builder =>
    {
        builder.AddConsole();
        builder.AddDebug();
    })
    .AddSingleton<IBrockerProcessor, XsltRabbitMqProcessor>()
    .AddSingleton<IServiceWorker, ServiceWorker>()
    .BuildServiceProvider();

services.GetService<IServiceWorker>()!.StartService();

