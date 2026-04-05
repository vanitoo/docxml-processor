using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictSessionType
{
    public int SessionTypeId { get; set; }

    public string SessionTypeDescription { get; set; } = null!;

    public string ActualVersion { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string? TypeRootMessages { get; set; }

    public virtual ICollection<GsObjectSession> GsObjectSessions { get; } = new List<GsObjectSession>();
}
