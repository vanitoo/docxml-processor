using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictTbcPortalMessage
{
    public int Id { get; set; }

    public int TypeSourceId { get; set; }

    public string? EventMessageType { get; set; }

    public string RmsType { get; set; } = null!;

    public int PortalAction { get; set; }

    public DateTime DateBorn { get; set; }

    public virtual DictTypeSource TypeSource { get; set; } = null!;
}
