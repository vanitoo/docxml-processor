using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsMessageSignXml
{
    public int MessageId { get; set; }

    public string Data { get; set; } = null!;

    public DateTime DateBorn { get; set; }

    public virtual GsObjectMessage Message { get; set; } = null!;
}
