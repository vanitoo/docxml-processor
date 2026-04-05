using System.ComponentModel.DataAnnotations;

namespace DocumentXmlProcessorAPI.Models.Request;

public class AddFileModel
{
    [Required(ErrorMessage = "Xml данные обязательны")]
    public string Xml { get; set; } = null!;
    public string? AdditionalData { get; set; }
    public string? CallbackUrl { get; set; }
    public string? CallbackParams { get; set; }
}
