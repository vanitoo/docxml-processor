using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictStatus
{
    public int StatusId { get; set; }

    public string StatusName { get; set; } = null!;

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    /// <summary>
    /// Название Объекта, которому может принадлежать этот статус
    /// </summary>
    public string ObjectOwnerName { get; set; } = null!;

    public string? AvailableActions { get; set; }

    public short? SessionType { get; set; }

    public short Danger { get; set; }

    public bool IsSessionOpen { get; set; }

    public bool? IsReadyToArch { get; set; }

    public virtual ICollection<GsMain> GsMains { get; } = new List<GsMain>();

    public virtual ICollection<GsObjectSession> GsObjectSessions { get; } = new List<GsObjectSession>();
}
