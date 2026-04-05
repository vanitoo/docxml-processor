using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictPrincipal
{
    public Guid Id { get; set; }

    public string ParticipantId { get; set; } = null!;

    public string? SenderInformation { get; set; }

    public DateTime Dateborn { get; set; }

    public string Author { get; set; } = null!;

    public string OrganizationName { get; set; } = null!;

    public string? ReceiverInformation { get; set; }

    public string TransportType { get; set; } = null!;

    public Guid? GsPrincipalId { get; set; }

    public virtual ICollection<UsrArchive> UsrArchives { get; } = new List<UsrArchive>();
}
