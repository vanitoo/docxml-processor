using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsOrganization
{
    public Guid OrganizationId { get; set; }

    public Guid GsId { get; set; }

    public string? OrganizationName { get; set; }

    public DateTime DateBorn { get; set; }

    public string OrganizationType { get; set; } = null!;

    public Guid? InvoiceId { get; set; }

    public virtual GsMain Gs { get; set; } = null!;

    public virtual GsOrganizationAddress? GsOrganizationAddress { get; set; }

    public virtual GsOrganizationDetail? GsOrganizationDetail { get; set; }
}
