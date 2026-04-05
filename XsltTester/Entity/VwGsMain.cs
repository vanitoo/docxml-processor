using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwGsMain
{
    public Guid GsId { get; set; }

    public Guid FolderId { get; set; }

    public string? Smgsnumber { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public Guid AuthorId { get; set; }

    public string CodeOp { get; set; } = null!;

    public string? WaybillKey { get; set; }

    public int SourceType { get; set; }

    public int StatusId { get; set; }

    public string StatusName { get; set; } = null!;

    public string? Author { get; set; }

    public bool? IsArchieve { get; set; }

    public string? Tags { get; set; }

    public string? Consignor { get; set; }
}
