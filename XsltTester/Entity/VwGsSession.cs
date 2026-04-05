using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwGsSession
{
    public Guid GsId { get; set; }

    public Guid FolderId { get; set; }

    public string FolderName { get; set; } = null!;

    public string? Smgsnumber { get; set; }

    public string? BorderCustomsCode { get; set; }

    public DateTime DateBorn { get; set; }

    public string CodeOp { get; set; } = null!;

    public string? WaybillKey { get; set; }

    public int SourceType { get; set; }

    public string? SourceId { get; set; }

    public int StatusId { get; set; }

    public Guid? SessionId { get; set; }

    public int? SessionType { get; set; }

    public int? StatusSessionId { get; set; }
}
