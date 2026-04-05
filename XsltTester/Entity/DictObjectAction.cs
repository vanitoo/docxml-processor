using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictObjectAction
{
    public string ActionId { get; set; } = null!;

    public string? Description { get; set; }

    public string ObjectType { get; set; } = null!;

    public bool? IsArchiveAction { get; set; }

    public bool? IsDeletedAction { get; set; }

    public int? Order { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string? Group { get; set; }
}
