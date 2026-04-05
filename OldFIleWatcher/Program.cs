using DocumentXmlProcessorContext.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using OldFIleWatcher.Models;
using OldFIleWatcher.Services;
using ProcessingCommon.Services;

var version = File.Exists("./VERSION") ? File.ReadAllText("./VERSION").Trim() : "unknown";
Console.WriteLine($"[STARTUP] OldFIleWatcher v{version} starting...");

IConfigurationRoot configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false)
    .Build();

AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

var services = new ServiceCollection()
    .Configure<ApiSettings>(configuration.GetSection("Api"))
    .AddLogging(builder =>
    {
        builder.AddConsole();
        builder.AddDebug();
        builder.AddFilter("Microsoft.EntityFrameworkCore.Database.Command", LogLevel.Warning);
    })
    .AddDbContext<DocumentProcessorContext>(
        options => options.UseNpgsql(configuration.GetConnectionString("Default")))
    .AddSingleton<IServiceWorker, ServiceWorker>()
    .BuildServiceProvider();

services.GetService<IServiceWorker>()!.StartService();
