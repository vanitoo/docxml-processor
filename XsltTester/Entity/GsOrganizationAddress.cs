using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsOrganizationAddress
{
    public Guid OrganizationId { get; set; }

    public string? PostalCode { get; set; }

    public string CountryCode { get; set; } = null!;

    public string? Region { get; set; }

    public string City { get; set; } = null!;

    public string StreetHouse { get; set; } = null!;

    public DateTime DateBorn { get; set; }

    public virtual GsOrganization Organization { get; set; } = null!;
}
