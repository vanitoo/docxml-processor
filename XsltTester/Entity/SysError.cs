using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class SysError
{
    public int Id { get; set; }

    public DateTime DateBorn { get; set; }

    public string? Process { get; set; }

    public string? ObjectId { get; set; }

    public DateTime? DateExecution { get; set; }

    public string? Description { get; set; }
}
