using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsGoodsPackaging
{
    public Guid PackingId { get; set; }

    public Guid GoodsId { get; set; }

    public string PackingCode { get; set; } = null!;

    public int PakingQuantity { get; set; }

    public string? PackingMark { get; set; }

    public virtual GsGood Goods { get; set; } = null!;
}
