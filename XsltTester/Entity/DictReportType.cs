using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictReportType
{
    public Guid ReportId { get; set; }

    public string? ReportCodeName { get; set; }

    public string PublicName { get; set; } = null!;

    public string? Description { get; set; }

    public int ReportOrder { get; set; }

    public string AccessRole { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;
}
