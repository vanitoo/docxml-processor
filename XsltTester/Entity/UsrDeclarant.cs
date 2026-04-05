using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrDeclarant
{
    public Guid Id { get; set; }

    public string ShortOrganizationName { get; set; } = null!;

    public string OrganizationName { get; set; } = null!;

    public string? Inn { get; set; }

    public string? Ogrn { get; set; }

    public string? PostalCode { get; set; }

    public string CountryCode { get; set; } = null!;

    public string? Region { get; set; }

    public string City { get; set; } = null!;

    public string StreetHouse { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string CodeOp { get; set; } = null!;

    public int ColumnOrderNumber { get; set; }

    public string? Kpp { get; set; }

    public string? ShortStreetHouse { get; set; }
}
