namespace DocumentXmlProcessorAPI.Models.DataTransfer;

public class ServiceResponse<T>
{
    public T? Result { get; set; }
    public IEnumerable<string> Errors { get; set; } = new List<string>();

    public bool IsSuccess
    {
        get
        {
            return Errors.Any() == false;
        }
    }
}
