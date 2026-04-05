using Microsoft.Extensions.Logging;
using ProcessingCommon.Services;

namespace PdfProcessor.Services;

public class ServiceWorker : IServiceWorker
{
    private readonly ILogger<ServiceWorker> _logger;
    private readonly IBrockerProcessor _brockerProcessor;

    public ServiceWorker(ILogger<ServiceWorker> logger, IBrockerProcessor brockerProcessor)
    {
        _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        _brockerProcessor = brockerProcessor ?? throw new ArgumentNullException(nameof(brockerProcessor));
    }

    public void StartService()
    {
        _logger.LogInformation("Начало работы сервиса! ({Time})", DateTime.Now);
        _brockerProcessor.StartRecived();
        _logger.LogInformation("Конец работы сервиса! ({Time})", DateTime.Now);
    }
}
