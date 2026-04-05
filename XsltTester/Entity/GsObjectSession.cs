using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsObjectSession
{
    public Guid SessionId { get; set; }

    public Guid InitialParentId { get; set; }

    public int SessionType { get; set; }

    public string? RzdProcessId { get; set; }

    public int StatusId { get; set; }

    public string? InitialParentType { get; set; }

    public DateTime DateBorn { get; set; }

    public Guid? ProfileId { get; set; }

    public bool IsClientSigned { get; set; }

    public Guid? PrincipalId { get; set; }

    public string? InitialWaybillKey { get; set; }

    public virtual ICollection<GsObjectMessage> GsObjectMessages { get; } = new List<GsObjectMessage>();

    public virtual DictSessionType SessionTypeNavigation { get; set; } = null!;

    public virtual DictStatus Status { get; set; } = null!;
}
