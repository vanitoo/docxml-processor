namespace DocumentXmlProcessorContext.Entity;

public class ProcessingFileError
{
    public Guid Id { get; set; }
    public string Message { get; set; } = null!;
    public Guid ProcessingFileId { get; set; }
    public virtual ProcessingFile ProcessingFile { get; set; } = null!;
}
