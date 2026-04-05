using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwFolder
{
    public Guid FolderId { get; set; }

    public string FolderName { get; set; } = null!;

    public DateTime DateBorn { get; set; }

    public bool IsDeleted { get; set; }

    public bool IsTrain { get; set; }

    public bool IsArchieve { get; set; }

    public string CodeOp { get; set; } = null!;

    public string StatusName { get; set; } = null!;

    public string? Author { get; set; }

    public int StatusId { get; set; }

    public string? PpvNumber { get; set; }

    public string? TrainIndex { get; set; }

    public string? TrainNumber { get; set; }
}
