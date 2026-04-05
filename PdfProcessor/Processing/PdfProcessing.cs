using NetCoreHTMLToPDF;
using ProcessingCommon.Interfaces;

namespace PdfProcessor.Processing;

public class PdfProcessing : IProcessing<byte[], string>
{
    private readonly Func<string, byte[]> _convertHtmlToPdf;

    public PdfProcessing()
        : this(static html =>
        {
            var converter = new HtmlConverter();
            return converter.FromHtmlString(html);
        })
    {
    }

    public PdfProcessing(Func<string, byte[]> convertHtmlToPdf)
    {
        _convertHtmlToPdf = convertHtmlToPdf ?? throw new ArgumentNullException(nameof(convertHtmlToPdf));
    }

    public byte[] Processing(string data)
    {
        if (data is null)
        {
            throw new ArgumentNullException(nameof(data));
        }

        return _convertHtmlToPdf(data);
    }
}
