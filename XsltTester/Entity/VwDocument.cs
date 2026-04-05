using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwDocument
{
    public Guid DocumentId { get; set; }

    public Guid ParentId { get; set; }

    public string Type { get; set; } = null!;

    public int OrderNumber { get; set; }

    public string? PrDocumentNumber { get; set; }

    public DateTime? PrDocumentDate { get; set; }

    public string? Code44 { get; set; }

    public string? ArchId { get; set; }

    public string? ArchDocUin { get; set; }

    public string Data { get; set; } = null!;

    public Guid? SessionId { get; set; }

    public int? SessionType { get; set; }

    public int? StatusId { get; set; }

    public bool IsValid { get; set; }

    public bool IsDeleted { get; set; }
}
