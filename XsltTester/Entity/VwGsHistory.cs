using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwGsHistory
{
    public string? Smgsnumber { get; set; }

    public DateTime DateBorn { get; set; }

    public string? Author { get; set; }

    public string? Description { get; set; }

    public string? ObjectName { get; set; }

    public int? OrderNumber { get; set; }

    public string? Type { get; set; }

    public string? Code44 { get; set; }

    public string? PrDocumentNumber { get; set; }

    public string? ArchId { get; set; }

    public string? ArchDocUin { get; set; }

    public Guid ParentId { get; set; }

    public Guid? ObjectId { get; set; }

    public int HistoryId { get; set; }

    public int ActionId { get; set; }

    public Guid AuthorId { get; set; }
}
