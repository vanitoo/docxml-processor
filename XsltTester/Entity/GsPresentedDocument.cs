using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsPresentedDocument
{
    public Guid DocumentId { get; set; }

    public Guid GsId { get; set; }

    public string? PrDocumentName { get; set; }

    public string? PrDocumentNumber { get; set; }

    public DateTime? PrDocumentDate { get; set; }

    public string PrModeCode { get; set; } = null!;

    public bool IsPrecedingDocument { get; set; }

    public string? LinkGoods { get; set; }

    public bool DontExtractSmgs { get; set; }

    public int DocPresentKindCode { get; set; }

    public long ExternalId { get; set; }

    public virtual GsMain Gs { get; set; } = null!;

    public virtual GsPrecedingDocumentAdditionalInfo? GsPrecedingDocumentAdditionalInfo { get; set; }
}
