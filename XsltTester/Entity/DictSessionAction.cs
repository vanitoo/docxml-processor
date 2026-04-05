using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictSessionAction
{
    public string ActionId { get; set; } = null!;

    public string? Description { get; set; }

    public string? AlterAction { get; set; }

    public string SessionType { get; set; } = null!;

    public bool IsNotValid { get; set; }

    public bool IsArchiveAction { get; set; }

    public bool IsPaperAction { get; set; }

    public bool IsRzd { get; set; }

    public bool? IsDeletedAction { get; set; }

    public bool IsSignedAction { get; set; }

    public bool IsSendToTransit { get; set; }

    public bool IsSendPtd { get; set; }

    public string? Group { get; set; }

    public int? Order { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string? AccessAlbumVersion { get; set; }
}
