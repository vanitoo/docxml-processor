using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsChProfileInfo
{
    public int Id { get; set; }

    public Guid GsId { get; set; }

    public Guid UserId { get; set; }

    public DateTime DateBorn { get; set; }

    public int ReasonId { get; set; }

    public string TypeBpOld { get; set; } = null!;

    public string TypeBpNew { get; set; } = null!;

    public string? AdditionalInfo { get; set; }

    public virtual GsMain Gs { get; set; } = null!;

    public virtual DictReasonChProfile Reason { get; set; } = null!;
}
