namespace ProcessingCommon.Models.Messages;

public class XsltProcessingMessageModel
{
    public Guid ProcessDocumentId { get; set; }
    public string Xml { get; set; } = null!;
    public string? AdditionalData { get; set; }
}
