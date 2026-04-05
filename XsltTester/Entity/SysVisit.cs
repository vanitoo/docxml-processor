using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class SysVisit
{
    public Guid ObjectId { get; set; }

    public Guid UserId { get; set; }

    public DateTime DtVisited { get; set; }
}
