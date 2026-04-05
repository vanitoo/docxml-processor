using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictTypeSource
{
    public int TypeSourceId { get; set; }

    public string Name { get; set; } = null!;

    public int Priority { get; set; }

    public string? ToDirection { get; set; }

    public bool OnlyFolder { get; set; }

    public virtual ICollection<DictTbcPortalMessage> DictTbcPortalMessages { get; } = new List<DictTbcPortalMessage>();

    public virtual ICollection<FldFolder> FldFolders { get; } = new List<FldFolder>();

    public virtual ICollection<GsMain> GsMains { get; } = new List<GsMain>();
}
