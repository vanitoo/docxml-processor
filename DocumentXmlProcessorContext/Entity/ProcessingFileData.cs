namespace DocumentXmlProcessorContext.Entity;

public class ProcessingFileData
{
    public Guid Id { get; set; }
    public string XmlPath { get; set; } = null!;
    public string? HtmlPath { get; set; }
    public double? HtmlTimeProcessing { get; set; }
    public string? PdfPath { get; set; }
    public double? PdfTimeProcessing { get; set; }

    public Guid ProcessingFileId { get; set; }
    public virtual ProcessingFile ProcessingFile { get; set; } = null!;
}
