using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsHistory
{
    public int HistoryId { get; set; }

    public Guid ParentId { get; set; }

    public int ActionId { get; set; }

    public Guid? ObjectId { get; set; }

    public string? ObjectName { get; set; }

    public Guid AuthorId { get; set; }

    public DateTime DateBorn { get; set; }

    public bool? AstraLog { get; set; }
}
