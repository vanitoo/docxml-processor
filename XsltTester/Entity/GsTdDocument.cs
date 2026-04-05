using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsTdDocument
{
    public Guid DocumentId { get; set; }

    public string? TdRegNumber { get; set; }

    public DateTime? DateReg { get; set; }

    public string? CustomCode { get; set; }

    public DateTime? TransitDateLimit { get; set; }

    public string? DestinationCustomsCode { get; set; }

    public DateTime Dateborn { get; set; }

    public string? DeclarantName { get; set; }

    public short? TotalGoodsNumber { get; set; }

    public string ReportedState { get; set; } = null!;

    public DateTime? DateReleased { get; set; }

    public virtual GsObjectDocument Document { get; set; } = null!;
}
