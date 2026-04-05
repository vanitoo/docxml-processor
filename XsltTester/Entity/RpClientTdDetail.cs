using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class RpClientTdDetail
{
    public int Id { get; set; }

    public Guid ParentId { get; set; }

    public int Count { get; set; }

    public string ClientName { get; set; } = null!;

    public string ClientType { get; set; } = null!;

    public Guid? ClientId { get; set; }

    public string? ClientContractNumber { get; set; }

    public bool IsDelete { get; set; }

    public DateTime DateBorn { get; set; }

    public string Data { get; set; } = null!;

    public string? ParcipantName { get; set; }

    public decimal? ReportSum { get; set; }

    public virtual RpClientTd Parent { get; set; } = null!;
}
