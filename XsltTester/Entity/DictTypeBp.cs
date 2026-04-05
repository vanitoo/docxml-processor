using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictTypeBp
{
    public string TypeBpid { get; set; } = null!;

    public string ProfileName { get; set; } = null!;

    public string AvailableActions { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string ActualBpVersion { get; set; } = null!;

    public string? CodeName { get; set; }

    public string? RzdtransportType { get; set; }
}
