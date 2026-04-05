using ProcessingCommon.Services;

namespace DocumentXmlProcessorAPI.Services;

public class ApiHostedService : IHostedService
{
    private readonly ILogger<ApiHostedService> _logger;
    private readonly IBrockerProcessor _brockerProcessor;

    public ApiHostedService(IBrockerProcessor brockerProcessor, ILogger<ApiHostedService> logger)
    {
        _brockerProcessor = brockerProcessor;
        _logger = logger;
    }

    public Task StartAsync(CancellationToken cancellationToken)
    {
        _logger.LogInformation($"Начало работы api сервиса: {DateTime.Now}");
        _brockerProcessor.StartRecived();
        return Task.CompletedTask;
    }

    public Task StopAsync(CancellationToken cancellationToken)
    {
        _logger.LogInformation($"Завершение работы api сервиса: {DateTime.Now}");
        return Task.CompletedTask;
    }
}
