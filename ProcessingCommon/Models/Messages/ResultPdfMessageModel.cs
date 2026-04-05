namespace ProcessingCommon.Models.Messages;

public class ResultPdfMessageModel
{
    public Guid ProcessDocumentId { get; set; }
    public List<byte[]> Pdfs { get; set; } = new();
    public double ProcessingTime { get; set; }
}
