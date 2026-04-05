using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwActHeader
{
    public Guid ActId { get; set; }

    public int ExpeditorId { get; set; }

    public string ExpeditorName { get; set; } = null!;

    public string Number { get; set; } = null!;

    public DateTime? DateAct { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string FolderName { get; set; } = null!;

    public string CodeOp { get; set; } = null!;

    public bool IsArchieve { get; set; }

    public Guid FolderId { get; set; }
}
