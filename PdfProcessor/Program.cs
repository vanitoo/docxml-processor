using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using PdfProcessor.Services;
using ProcessingCommon.Models.Settings;
using ProcessingCommon.Services;

IConfigurationRoot configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false)
    .Build();

var services = new ServiceCollection()
    .Configure<RabbitSettings>(configuration.GetSection("Rabbit"))
    .Configure<ServiceSettings>(configuration.GetSection("Service"))
    .AddLogging(builder =>
    {
        builder.AddConsole();
        builder.AddDebug();
    })
    .AddSingleton<IBrockerProcessor, PdfRabbitMqProcessor>()
    .AddSingleton<IServiceWorker, ServiceWorker>()
    .BuildServiceProvider();

services.GetService<IServiceWorker>()!.StartService();
