using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class EmailRegistry
{
    public Guid Id { get; set; }

    public string SendTo { get; set; } = null!;

    public string? Subject { get; set; }

    public string? Body { get; set; }

    public string Author { get; set; } = null!;

    public DateTime Dateborn { get; set; }

    public DateTime? DateSend { get; set; }

    public string? SendBcc { get; set; }

    public string? MailFrom { get; set; }

    public bool? IsHtml { get; set; }

    public virtual EmailAttachment? EmailAttachment { get; set; }
}
