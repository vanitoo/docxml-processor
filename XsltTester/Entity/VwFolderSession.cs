using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwFolderSession
{
    public Guid FolderId { get; set; }

    public string FolderName { get; set; } = null!;

    public string? PpvNumber { get; set; }

    public string? TrainIndex { get; set; }

    public string? TrainNumber { get; set; }

    public string CodeOp { get; set; } = null!;

    public int StatusId { get; set; }

    public Guid? DocumentId { get; set; }

    public Guid? SessionId { get; set; }

    public int? SessionType { get; set; }

    public int? SessionStatus { get; set; }
}
