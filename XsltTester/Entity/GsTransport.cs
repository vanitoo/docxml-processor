using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsTransport
{
    public Guid TransportId { get; set; }

    public Guid GsId { get; set; }

    public string Number { get; set; } = null!;

    public bool IsContainer { get; set; }

    public int? OrderNumber { get; set; }

    public virtual GsMain Gs { get; set; } = null!;
}
