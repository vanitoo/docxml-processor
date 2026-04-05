using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class SysSupportProblem
{
    public int Id { get; set; }

    public DateTime Dateborn { get; set; }

    public string Category { get; set; } = null!;

    public Guid Ais1035SessionId { get; set; }

    public string? TransportId { get; set; }

    public string? MessageType { get; set; }

    public DateTime? DateClose { get; set; }

    public string? Comment { get; set; }

    public DateTime? DateSendNotify { get; set; }
}
