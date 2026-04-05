using Microsoft.Extensions.Logging;
using ProcessingCommon.Services;

namespace XsltProcessor.Services;

public class ServiceWorker : IServiceWorker
{
    private readonly ILogger<ServiceWorker> _logger;
    private readonly IBrockerProcessor _brockerProcessor;

    public ServiceWorker(ILogger<ServiceWorker> logger, IBrockerProcessor brockerProcessor)
    {
        _logger = logger;
        _brockerProcessor = brockerProcessor;
    }

    public void StartService()
    {
        _logger.LogInformation($"Начало работы сервиса! ({DateTime.Now})");
        _brockerProcessor.StartRecived();
        Thread.Sleep(TimeSpan.FromMinutes(60));
        _logger.LogInformation($"Конец работы сервиса! ({DateTime.Now})");
    }
}
