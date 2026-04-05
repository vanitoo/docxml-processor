namespace ProcessingCommon.Models.Messages;

public class ErrorModel
{
    public Guid? ProcessId { get; set; }
    public Guid ErrorId { get; set; }
    public string Message { get; set; } = null!;
}
