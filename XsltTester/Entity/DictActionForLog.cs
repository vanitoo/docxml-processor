using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictActionForLog
{
    public int ActionId { get; set; }

    public string? Description { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;
}
