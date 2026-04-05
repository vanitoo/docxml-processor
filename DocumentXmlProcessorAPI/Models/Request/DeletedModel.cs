namespace DocumentXmlProcessorAPI.Models.Request;

public class DeletedModel
{
    public List<Guid> DeletedDocuments { get; set; } = new();
}
