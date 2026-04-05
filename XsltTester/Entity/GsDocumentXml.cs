using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsDocumentXml
{
    public Guid GsDocumentXmlId { get; set; }

    public string Data { get; set; } = null!;

    public DateTime DateBorn { get; set; }

    public long? DataHash { get; set; }

    public string? DataHashSha255 { get; set; }

    public virtual GsObjectDocument GsDocumentXmlNavigation { get; set; } = null!;
}
