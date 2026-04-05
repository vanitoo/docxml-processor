using System.ComponentModel.DataAnnotations;

namespace XsltTester.Models;

public class AddFileModel
{
    public string Xml { get; set; } = null!;
    public string? AdditionalData { get; set; }
    public string? CallbackUrl { get; set; }
}
