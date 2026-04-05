using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsValidationInfo
{
    public Guid GsId { get; set; }

    public int ProblemCount { get; set; }

    public string? ProblemDetails { get; set; }
}
