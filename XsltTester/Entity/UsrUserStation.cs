using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrUserStation
{
    public Guid Id { get; set; }

    public string StationCode { get; set; } = null!;

    public string StationName { get; set; } = null!;

    public string? ZdCodeRus { get; set; }

    public string? ZdName { get; set; }

    public string? ZdCarrier { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;
}
