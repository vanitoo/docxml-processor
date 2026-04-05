using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsOrganizationDetail
{
    public Guid OrganizationId { get; set; }

    public string? Ogrn { get; set; }

    public string? Inn { get; set; }

    public string? Kpp { get; set; }

    public string? KzBin { get; set; }

    public string? KzIin { get; set; }

    public string? KzItnCategoryCode { get; set; }

    public string? KzItnKatocode { get; set; }

    public string? KzItnRnn { get; set; }

    public string? KzItnItnreserv { get; set; }

    public string? RbUnp { get; set; }

    public string? RbRbidentificationNumber { get; set; }

    public string? RaUnn { get; set; }

    public string? RaSocialServiceNumber { get; set; }

    public string? RaSocialServiceCertificate { get; set; }

    public string? KgInn { get; set; }

    public string? KgOkpo { get; set; }

    public virtual GsOrganization Organization { get; set; } = null!;
}
