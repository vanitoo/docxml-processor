using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class ObjValidationInfo
{
    public Guid ObjId { get; set; }

    public int ProblemCount { get; set; }

    public string? ProblemDetails { get; set; }

    public bool IsDocument { get; set; }
}
