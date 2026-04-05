using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrOrganization
{
    public Guid Id { get; set; }

    public string OrganizationName { get; set; } = null!;

    public string? PostalCode { get; set; }

    public string CountryCode { get; set; } = null!;

    public string? Region { get; set; }

    public string City { get; set; } = null!;

    public string StreetHouse { get; set; } = null!;

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

    public string OrganizationType { get; set; } = null!;

    public DateTime DateBorn { get; set; }

    public bool IsDeleted { get; set; }

    public string Author { get; set; } = null!;

    public string CodeOp { get; set; } = null!;

    public string? Phone { get; set; }
}
