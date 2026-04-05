using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class LogAction
{
    public long LogId { get; set; }

    public string ActionTypeString { get; set; } = null!;

    public string UserName { get; set; } = null!;

    public Guid? UserId { get; set; }

    public Guid? DocumentId { get; set; }

    public DateTime DateBorn { get; set; }

    public string? Ipaddress { get; set; }
}
