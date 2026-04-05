using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsFavoriteDocumentXml
{
    public Guid TemplateId { get; set; }

    public string Data { get; set; } = null!;

    public virtual GsFavoriteDocument Template { get; set; } = null!;
}
