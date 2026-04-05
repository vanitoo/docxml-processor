using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class ActHeader
{
    public Guid ActId { get; set; }

    public int ExpeditorId { get; set; }

    public Guid FolderId { get; set; }

    public string Number { get; set; } = null!;

    public string StationForAct { get; set; } = null!;

    public DateTime? DateAct { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public Guid AuthorId { get; set; }

    public virtual ICollection<ActBody> ActBodies { get; } = new List<ActBody>();

    public virtual UsrExpeditor Expeditor { get; set; } = null!;

    public virtual FldFolder Folder { get; set; } = null!;
}
