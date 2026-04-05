using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class SysIisrestartRequest
{
    public int Id { get; set; }

    public Guid AuthorId { get; set; }

    public DateTime DateBorn { get; set; }

    public DateTime? Proceed { get; set; }

    public DateTime DatePlanned { get; set; }

    public bool IsRegular { get; set; }
}
