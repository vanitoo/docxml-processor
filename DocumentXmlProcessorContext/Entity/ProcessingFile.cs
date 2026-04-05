using System.Text.Json;

namespace DocumentXmlProcessorContext.Entity;

public class ProcessingFile : IDisposable
{
    public Guid Id { get; set; }
    public DateTime DateCreated { get; set; } = DateTime.Now;
    public DateTime? DateCompleteProcessing { get; set; }
    public JsonDocument? AdditionalData { get; set; }
    public string? CallbackUrl { get; set; }

    public string? CallbackParams { get; set; }

    public bool IsComplete
    {
        get
        {
            return String.IsNullOrWhiteSpace(ProcessingFileData.HtmlPath) == false &&
                   String.IsNullOrWhiteSpace(ProcessingFileData.PdfPath) == false;
        }
    }
    public bool IsCompleteHtml
    {
        get
        {
            return String.IsNullOrWhiteSpace(ProcessingFileData.HtmlPath) == false;

        }
    }
    public bool IsCompletePdf
    {
        get
        {
            return String.IsNullOrWhiteSpace(ProcessingFileData.PdfPath) == false;

        }
    }

    public Guid ProcessingFileDataId { get; set; }
    public virtual ProcessingFileData ProcessingFileData { get; set; } = null!;

    public virtual ICollection<ProcessingFileError> ProcessingFileErrors { get; set; } =
        new List<ProcessingFileError>();

    public void Dispose()
    {
        AdditionalData?.Dispose();
    }
}
