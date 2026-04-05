using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsPrecedingDocumentAdditionalInfo
{
    public Guid DocumentId { get; set; }

    public int? PrecedingDocumentId { get; set; }

    public string? PrecedingDocumentCustomsCode { get; set; }

    public string? CustomsCountryCode { get; set; }

    public bool IsPidocument { get; set; }

    public virtual GsPresentedDocument Document { get; set; } = null!;
}
