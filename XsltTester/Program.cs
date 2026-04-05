using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using ProcessingCommon.Services;
using XsltTester.Context;
using XsltTester.Models;
using XsltTester.Services;

IConfigurationRoot configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false)
    .Build();

var services = new ServiceCollection()
    .Configure<TestSettings>(configuration.GetSection("TestRequest"))
    .AddLogging(builder =>
    {
        builder.AddConsole();
        builder.AddDebug();
    })
    .AddDbContext<AstraDbContext>(options => options.UseSqlServer(configuration.GetConnectionString("Default")))
    .AddSingleton<IServiceWorker, ServiceWorker>()
    .BuildServiceProvider();

services.GetService<IServiceWorker>()!.StartService();
