using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsExpeditor
{
    public Guid GsId { get; set; }

    public string ExpeditorName { get; set; } = null!;

    public string? ExpeditorSubCode { get; set; }

    public virtual GsMain Gs { get; set; } = null!;
}
