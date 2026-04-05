using DocumentXmlProcessorContext.Context;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using OldFIleWatcher.Models;
using ProcessingCommon.Services;
using RestSharp;

namespace OldFIleWatcher.Services;

public class ServiceWorker : IServiceWorker
{
    private readonly ILogger<ServiceWorker> _logger;
    private readonly ApiSettings _settings;
    private readonly IServiceScopeFactory _scopeFactory;

    public ServiceWorker(ILogger<ServiceWorker> logger, IOptions<ApiSettings> settings, IServiceScopeFactory scopeFactory)
    {
        _logger = logger;
        _scopeFactory = scopeFactory;
        _settings = settings.Value;
    }

    public void StartService()
    {
        _logger.LogInformation($"Начало работы сервиса по слежению за старыми данными! ({DateTime.Now})");
        using (var scope = _scopeFactory.CreateScope())
        {
            using (var context = scope.ServiceProvider.GetRequiredService<DocumentProcessorContext>())
            {
                var deletedDocuments = context.ProcessingFiles.OrderBy(x => x.DateCreated)
                    .Where(x => x.DateCreated < DateTime.Now.AddDays(-3)).Select(x => x.Id).Take(_settings.CountDelete).ToList();

                if (deletedDocuments.Any())
                {
                    var client = new RestClient(_settings.Url);
                    var request = new RestRequest(_settings.DeleteRequest);
                    request.AddBody(new
                    {
                        deletedDocuments = deletedDocuments
                    });
                    _logger.LogInformation(
                        $"Запрос на удаление следующих документов {string.Join(",", deletedDocuments)}.");
                    var res = client.ExecutePost(request);
                }
            }
        }
        Thread.Sleep(TimeSpan.FromMinutes(5));
        _logger.LogInformation($"Конец работы сервиса по слежению за старыми данными! ({DateTime.Now})");
    }
}
