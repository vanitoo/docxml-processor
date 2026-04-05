using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrExpeditor
{
    public int Id { get; set; }

    public string ExpeditorName { get; set; } = null!;

    public string? ContractNumber { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual ICollection<ActHeader> ActHeaders { get; } = new List<ActHeader>();

    public virtual ICollection<ActTelegram> ActTelegrams { get; } = new List<ActTelegram>();
}
