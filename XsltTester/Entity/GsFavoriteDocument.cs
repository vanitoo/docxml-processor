using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsFavoriteDocument
{
    public Guid Id { get; set; }

    public DateTime TemplateDate { get; set; }

    public string? Data { get; set; }

    public string Code44 { get; set; } = null!;

    public string? PrDocumentNumber { get; set; }

    public DateTime? PrDocumentDate { get; set; }

    public string? PrDocumentName { get; set; }

    public string? ArchId { get; set; }

    public string? ArchDocUin { get; set; }

    public string Type { get; set; } = null!;

    public string AlbumVersion { get; set; } = null!;

    public string? UserComment { get; set; }

    public Guid AuthorId { get; set; }

    public Guid? OriginalDocumentId { get; set; }

    public Guid DepartmentId { get; set; }

    public DateTime? ExpiryDate { get; set; }

    public virtual GsFavoriteDocumentXml? GsFavoriteDocumentXml { get; set; }
}
