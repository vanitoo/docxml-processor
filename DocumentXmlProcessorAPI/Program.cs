using DocumentXmlProcessorAPI.Middleware;
using DocumentXmlProcessorAPI.Services;
using DocumentXmlProcessorContext.Context;
using Microsoft.EntityFrameworkCore;
using NLog;
using NLog.Web;
using ProcessingCommon.Models.Settings;
using ProcessingCommon.Services;

LogManager.Setup().LoadConfigurationFromAppSettings().GetCurrentClassLogger();

var version = File.Exists("./VERSION") ? File.ReadAllText("./VERSION").Trim() : "unknown";
Console.WriteLine($"[STARTUP] DocumentXmlProcessorAPI v{version} starting...");

var builder = WebApplication.CreateBuilder(args);

builder.Logging.ClearProviders();
builder.Host.UseNLog();

builder.Services.AddCors();
builder.Services.AddControllers();
builder.Services.AddDbContext<DocumentProcessorContext>(
    options => options.UseNpgsql(builder.Configuration.GetConnectionString("Default")));
builder.Services.Configure<RabbitSettings>(builder.Configuration.GetSection("Rabbit"));
builder.Services.AddSingleton<IBrockerProcessor, ApiRabbitMqProcessor>();
builder.Services.AddHostedService<ApiHostedService>();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<IProcessingFileService, ProcessingFileService>();

var app = builder.Build();
AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(policy => policy
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());

app.UseMiddleware<ExceptionHandlingMiddleware>();

app.MapControllers();

app.Run();
