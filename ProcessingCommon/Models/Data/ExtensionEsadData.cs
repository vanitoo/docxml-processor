using System.Collections.Generic;

namespace ProcessingCommon.Models.Data;

public class ExtensionEsadData
{
    public string? DocumentType { get; set; }
    public string? TdRegNumber { get; set; }
    public string? CustomCode { get; set; }
    public string? StatusName { get; set; }
    public string? CustomsOffical { get; set; }
    public string? Seal { get; set; }
    public string? TransitDateLimit { get; set; }
    public string? Signature { get; set; }
    public string? DestinationPlace { get; set; }
    public string? DestinationCustom { get; set; }
    public string? DestinationStation { get; set; }
    public string? DestinationPlaceCertificate { get; set; }
    public string? DestinationPlaceDescription { get; set; }
    public Dictionary<string, string>? DictCountry { get; set; }
}