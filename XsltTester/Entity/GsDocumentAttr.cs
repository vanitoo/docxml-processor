using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsDocumentAttr
{
    public Guid DocumentId { get; set; }

    public string Code44 { get; set; } = null!;

    public string? PrDocumentNumber { get; set; }

    public DateTime? PrDocumentDate { get; set; }

    public string? PrDocumentName { get; set; }

    public string? ArchId { get; set; }

    public string? ArchDocUin { get; set; }

    public string? UserComment { get; set; }

    public DateTime? ExpiryDate { get; set; }

    public string? EsadDeclarationKind { get; set; }

    public virtual GsObjectDocument Document { get; set; } = null!;
}
