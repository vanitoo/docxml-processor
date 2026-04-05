using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictStatusMessage
{
    public int Id { get; set; }

    public string MessageCode { get; set; } = null!;

    public string Direction { get; set; } = null!;

    public int SessionType { get; set; }

    public int StatusId { get; set; }

    public int? ObjectStatus { get; set; }

    public DateTime DateBorn { get; set; }

    public bool IsDeleted { get; set; }
}
