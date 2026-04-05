using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwDepProfile
{
    public string? DepartmentName { get; set; }

    public string CodeOp { get; set; } = null!;

    public Guid ProfileId { get; set; }

    public string ProfileName { get; set; } = null!;

    public bool IsDefault { get; set; }

    public DateTime DateBorn { get; set; }
}
