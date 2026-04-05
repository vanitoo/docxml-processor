using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using ProcessingCommon.Services;

namespace PdfProcessor.Services;

public class ServiceSettings
{
    public int TimeoutMinutes { get; set; } = 60;
}

public class ServiceWorker : IServiceWorker
{
    private readonly ILogger<ServiceWorker> _logger;
    private readonly IBrockerProcessor _brockerProcessor;
    private readonly ServiceSettings _settings;

    public ServiceWorker(
        ILogger<ServiceWorker> logger,
        IBrockerProcessor brockerProcessor)
        : this(logger, brockerProcessor, null)
    {
    }

    public ServiceWorker(
        ILogger<ServiceWorker> logger,
        IBrockerProcessor brockerProcessor,
        IOptions<ServiceSettings>? settings)
    {
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _brockerProcessor = brockerProcessor ?? throw new ArgumentNullException(nameof(brockerProcessor));
        _settings = settings?.Value ?? new ServiceSettings();
    }

    public void StartService()
    {
        _logger.LogInformation("Начало работы сервиса! ({Time})", DateTime.Now);
        _brockerProcessor.StartRecived();
        if (_settings.TimeoutMinutes > 0)
        {
            Thread.Sleep(TimeSpan.FromMinutes(_settings.TimeoutMinutes));
        }
        _logger.LogInformation("Конец работы сервиса! ({Time})", DateTime.Now);
    }
}
