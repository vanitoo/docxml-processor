using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class FldWagon
{
    public Guid WagonId { get; set; }

    public Guid FolderId { get; set; }

    public string WagonNumber { get; set; } = null!;

    public int WagonOrdinal { get; set; }

    public string? WaybillNumbers { get; set; }

    public bool EmptyIndicator { get; set; }

    public string? DepartureStation { get; set; }

    public string? DestinationStation { get; set; }

    public decimal? GoodsWeightQuantity { get; set; }

    public string? ContainerNumbers { get; set; }

    public virtual FldFolder Folder { get; set; } = null!;
}
