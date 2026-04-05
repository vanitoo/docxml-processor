using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrArchiveDocument
{
    public Guid Id { get; set; }

    public Guid DictArchiveId { get; set; }

    public string? Code44 { get; set; }

    public string? PrDocumentNumber { get; set; }

    public DateTime? PrDocumentDate { get; set; }

    public string? PrDocumentName { get; set; }

    public string? ArchDocId { get; set; }

    public string? ArchDocumentId { get; set; }

    public string? ArchDocStatus { get; set; }

    public string? Data { get; set; }

    public DateTime Dateborn { get; set; }

    public virtual UsrArchive DictArchive { get; set; } = null!;
}
