using System.Text.Json;
using DocumentXmlProcessorAPI.Services;
using DocumentXmlProcessorContext.Context;
using Microsoft.EntityFrameworkCore;
using ProcessingCommon.Constants;
using ProcessingCommon.Interfaces;
using ProcessingCommon.Models.Messages;
using RestSharp;

namespace DocumentXmlProcessorAPI.Processing;

public class ProcessingMessages : IProcessing<bool, MessageConvert>
{
    private readonly IProcessingFileService _processingFileService;
    private readonly DocumentProcessorContext _context;
    private readonly ILogger _logger;
    public ProcessingMessages(ILogger logger, IProcessingFileService processingFileService, DocumentProcessorContext context)
    {
        _logger = logger;
        _processingFileService = processingFileService;
        _context = context;
    }

    public bool Processing(MessageConvert data)
    {
        switch (data.MessageType)
        {
            case MessageTypes.MessageXslt: return MessageXslt(data);
            case MessageTypes.MessagePdf: return MessagePdf(data);
            case MessageTypes.MessageError: return MessageError(data);
            default: return DefaultProcessing(data);
        }
    }

    private bool DefaultProcessing(MessageConvert convert)
    {
        _logger.LogInformation($"Ошибка при обработке сообщения {convert.MessageType}: ({DateTime.Now})");
        return false;
    }

    private bool MessagePdf(MessageConvert convert)
    {
        var pdfResult = JsonSerializer.Deserialize<ResultPdfMessageModel>(convert.Data)!;
        _logger.LogInformation($"Начата обработка PDF сообщения");
        var result = _processingFileService.AddPdf(pdfResult.ProcessDocumentId, pdfResult.Pdfs, pdfResult.ProcessingTime);
        Notification(pdfResult.ProcessDocumentId);
        return result;
    }

    private bool MessageXslt(MessageConvert convert)
    {
        var htmlResult = JsonSerializer.Deserialize<ResultHtmlMessageModel>(convert.Data)!;
        _logger.LogInformation($"Начата обработка HTML сообщения");
        return _processingFileService.AddHtml(htmlResult.ProcessDocumentId, htmlResult.Htmls, htmlResult.ProcessingTime);
    }

    private bool MessageError(MessageConvert convert)
    {
        var errorResult = JsonSerializer.Deserialize<ErrorModel>(convert.Data)!;
        _logger.LogInformation($"Начата обработка Error сообщения");
        if (errorResult.ProcessId != null)
        {
            var needProcess = _context.ProcessingFiles.FirstOrDefault(x => x.Id == errorResult.ProcessId);
            if (needProcess != null)
            {
                try
                {
                    _context.ProcessingFileErrors.Add(new()
                    {
                        Id = errorResult.ErrorId,
                        Message = errorResult.Message,
                        ProcessingFileId = errorResult.ProcessId.Value
                    });
                    _context.SaveChanges();
                    Notification(errorResult.ProcessId.Value);
                }
                catch (Exception e)
                {
                    _logger.LogError($"Произошла ошибка при записи ошибки в бд {errorResult.ErrorId}: {e.ToString()}");
                    throw;
                }
            }
            else
            {
                _logger.LogError($"Для ошибки {errorResult.ErrorId} не найден ProcessId, поэтому дублируется в log приложения.");
            }
        }
        else
        {
            _logger.LogError($"Ошибка {errorResult.ErrorId} не содержит идентификатор процесса, поэтому дублируется в log приложения.");
        }
        return true;
    }

    private void Notification(Guid processId)
    {
        var needProcess = _context.ProcessingFiles.FirstOrDefault(x => x.Id == processId);
        if (needProcess != null)
        {
            if (String.IsNullOrWhiteSpace(needProcess.CallbackUrl) == false)
            {
                List<Tuple<string, string>> cParams = new();
                if (String.IsNullOrWhiteSpace(needProcess.CallbackParams) == false)
                {
                    cParams = JsonSerializer.Deserialize<List<Tuple<string, string>>>(needProcess.CallbackParams);
                }

                var client = new RestClient(needProcess.CallbackUrl);
                var request = new RestRequest();
                request.AddParameter("processId", processId.ToString());
                foreach (var cParam in cParams)
                {
                    request.AddParameter(cParam.Item1, cParam.Item2);
                }
                client.ExecuteGet(request);
            }
        }
    }
}
