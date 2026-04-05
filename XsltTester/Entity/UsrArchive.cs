using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrArchive
{
    public Guid Id { get; set; }

    public Guid PrincipalId { get; set; }

    public string ArchiveId { get; set; } = null!;

    public string? Description { get; set; }

    public bool IsAstraMain { get; set; }

    public DateTime Dateborn { get; set; }

    public string Author { get; set; } = null!;

    public virtual DictPrincipal Principal { get; set; } = null!;

    public virtual ICollection<UsrArchiveDocument> UsrArchiveDocuments { get; } = new List<UsrArchiveDocument>();
}
