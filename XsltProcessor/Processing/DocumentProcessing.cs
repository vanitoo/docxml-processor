using System.Text.Json;
using Microsoft.Extensions.Logging;
using ProcessingCommon.Models.Data;
using ProcessingCommon.Models.Messages;
using XsltProcessor.Interfaces;

namespace XsltProcessor.Processing;

public class DocumentProcessing : IProcessing<List<string>, XsltProcessingMessageModel>
{
    private readonly ILogger _logger;
    public DocumentProcessing(ILogger logger)
    {
        _logger = logger;
    }

    public List<string> Processing(XsltProcessingMessageModel data)
    {
        XsltBuilder builder = new XsltBuilder(data.Xml, _logger)
            .BasicBuild();

        if (String.IsNullOrWhiteSpace(data.AdditionalData) == false)
        {
            AdditionalDataConvert? convert = JsonSerializer.Deserialize<AdditionalDataConvert>(data.AdditionalData);
            if (convert != default)
            {
                if (convert.Type == "ExtEsad")
                {
                    ExtensionEsadData? extData = JsonSerializer.Deserialize<ExtensionEsadData>(convert.Data);
                    if (extData != default)
                    {
                        builder = builder.ExtensionEsad(extData);
                    }
                }
                if (convert.Type == "ExtPI")
                {
                    ExtensionPIData? extData = JsonSerializer.Deserialize<ExtensionPIData>(convert.Data);
                    if (extData != default)
                    {
                        builder = builder.ExtensionPi(extData);
                    }
                }
            }
        }

        return builder.GetResultHtmls.ToList();
    }
}
