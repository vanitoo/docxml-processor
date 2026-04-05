using System.Text.Json;
using DocumentXmlProcessorAPI.Models;
using DocumentXmlProcessorAPI.Models.Request;
using DocumentXmlProcessorAPI.Services;
using Microsoft.AspNetCore.Mvc;
using ProcessingCommon.Constants;
using ProcessingCommon.Models.Messages;
using ProcessingCommon.Services;

namespace DocumentXmlProcessorAPI.Controllers;

[ApiController]
[Route("[controller]")]
public class DocumentProcessingController : ControllerBase
{
    private readonly ILogger<DocumentProcessingController> _logger;
    private readonly IProcessingFileService _processingFileService;
    private readonly IBrockerProcessor _brokerProcessor;

    public DocumentProcessingController(ILogger<DocumentProcessingController> logger, IProcessingFileService processingFileService, IBrockerProcessor brokerProcessor)
    {
        _logger = logger;
        _processingFileService = processingFileService;
        _brokerProcessor = brokerProcessor;
    }

    [HttpPost("Add")]
    public async Task<StandartResponse<Guid>> Add(AddFileModel request)
    {
        var result = await _processingFileService.AddToProcessing(request.Xml, request.AdditionalData, request.CallbackUrl, request.CallbackParams);
        if (result.IsSuccess == false)
        {
            ModelState.AddModelError("Custom", string.Join(";", result.Errors));
        }

        _brokerProcessor.SendMessage(new MessageConvert()
        {
            MessageType = MessageTypes.MessageXslt,
            Data = JsonSerializer.Serialize(new XsltProcessingMessageModel()
            {
                ProcessDocumentId = result.Result.Value,
                Xml = request.Xml,
                AdditionalData = request.AdditionalData
            }, JsonSerializerOptions.Default)
        }, BrockerNames.XsltProcessName, BrockerNames.XsltRoutingKey);
        return StandartResponseAnswer.Ok(result.Result.Value);
    }

    [HttpGet("Html")]
    public async Task<StandartResponse<List<string>>> GetHtml(Guid processId)
    {
        var result = await _processingFileService.GetHtml(processId);
        return StandartResponseAnswer.Ok(result);
    }

    [HttpGet("Pdf")]
    public async Task<StandartResponse<List<byte[]>>> GetPdf(Guid processId)
    {
        var result = await _processingFileService.GetPdf(processId);
        return StandartResponseAnswer.Ok(result);
    }

    [HttpPost("CheckOldFiles")]
    public async Task<StandartResponse<object>> CheckOldFiles(DeletedModel model)
    {
        if (model.DeletedDocuments.Any())
        {
            await _processingFileService.DeleteDocuments(model.DeletedDocuments);
        }
        return StandartResponseAnswer.Ok();
    }

    [HttpGet("State")]
    public async Task<StandartResponse<int>> ProcessingComplete(Guid processId)
    {
        var result = await _processingFileService.DocumentState(processId);
        return StandartResponseAnswer.Ok((int)result);
    }

    [HttpGet("StateHtml")]
    public async Task<StandartResponse<int>> ProcessingCompleteHtml(Guid processId)
    {
        var result = await _processingFileService.DocumentStateHtml(processId);
        return StandartResponseAnswer.Ok((int)result);
    }
}
