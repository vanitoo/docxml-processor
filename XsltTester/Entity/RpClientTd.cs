using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class RpClientTd
{
    public Guid Id { get; set; }

    public DateTime ReportDate { get; set; }

    public DateTime DateBorn { get; set; }

    public string TypeReport { get; set; } = null!;

    public virtual ICollection<RpClientTdDetail> RpClientTdDetails { get; } = new List<RpClientTdDetail>();
}
