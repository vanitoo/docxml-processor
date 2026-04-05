using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using ProcessingCommon.Services;
using RestSharp;
using XsltTester.Context;
using XsltTester.Models;

namespace XsltTester.Services;

public class ServiceWorker : IServiceWorker
{
    private readonly AstraDbContext _context;
    private readonly ILogger<ServiceWorker> _logger;
    private readonly TestSettings _settings;

    public ServiceWorker(ILogger<ServiceWorker> logger, AstraDbContext context, IOptions<TestSettings> settings)
    {
        _logger = logger;
        _context = context;
        _settings = settings.Value;
    }

    public void StartService()
    {
        _logger.LogInformation($"Начало тестирования! ({DateTime.Now})");
        var span = DateTime.Now.AddDays(-2);
        var testData = _context.GsObjectDocuments
            .Where(x => x.Type == "ESADout_CU"
                        && (x.AlbumVersion == "5.20.0" || x.AlbumVersion == "5.21.0")
                        && x.IsDeleted == false
                        && x.DateBorn >= span).ToList();
        foreach (var data in testData)
        {
            var needTest = _context.GsObjectDocuments
                .Join(_context.GsDocumentXmls, x => x.DocumentId, x => x.GsDocumentXmlId,
                    (x, y) => new
                    {
                        DocumentId = x.DocumentId,
                        Type = x.Type,
                        Album = x.AlbumVersion,
                        Date = x.DateBorn,
                        Data = y.Data
                    })
                .FirstOrDefault(x => x.DocumentId == data.DocumentId);
            if (needTest == null)
            {
                continue;
            }

            var client = new RestClient(_settings.Base);
            var request = new RestRequest();
            request.AddBody(new AddFileModel()
            {
                Xml = needTest.Data,
                AdditionalData = null,
                CallbackUrl = null
            });
            _logger.LogInformation($"Отправка {DateTime.Now} {needTest.Type} {needTest.Album}.");
            var res = client.ExecutePost(request);
        }
        Console.ReadLine();
        _logger.LogInformation($"Конец тестирования! ({DateTime.Now})");
    }
}
