namespace ProcessingCommon.Models.Messages;

public class ResultHtmlMessageModel
{
    public Guid ProcessDocumentId { get; set; }
    public List<string> Htmls { get; set; } = new();
    public double ProcessingTime { get; set; }
}
