using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class EmailAttachment
{
    public Guid Id { get; set; }

    public string Attachments { get; set; } = null!;

    public virtual EmailRegistry IdNavigation { get; set; } = null!;
}
