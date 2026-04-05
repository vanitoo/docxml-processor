using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwSmgsStation
{
    public Guid Id { get; set; }

    public string StationCode { get; set; } = null!;

    public string? StationName { get; set; }

    public string? ZdCodeRus { get; set; }

    public string? ZdName { get; set; }

    public string? ZdCarrier { get; set; }
}
