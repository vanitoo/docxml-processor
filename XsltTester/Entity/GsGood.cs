using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsGood
{
    public Guid GoodsId { get; set; }

    public Guid InvoiceId { get; set; }

    public int GoodsNumeric { get; set; }

    public string? GoodsTnvedcode { get; set; }

    public string GoodsDescription { get; set; } = null!;

    public decimal? GrossWeightQuantity { get; set; }

    public decimal? NetWeightQuantity { get; set; }

    public string? OriginCountryCode { get; set; }

    public decimal? InvoicedCost { get; set; }

    public decimal? GoodsQuantity { get; set; }

    public string? MeasureUnitQualifierCode { get; set; }

    public string? PackingAccordingSource { get; set; }

    /// <summary>
    /// Единицы измерения по версии источника
    /// </summary>
    public string? MeasureUnitAccordingSource { get; set; }

    public decimal? MainGoodsQuantity { get; set; }

    public string? MainMeasureUnitQualifierCode { get; set; }

    public DateTime? DateEdit { get; set; }

    public string? Article { get; set; }

    public int? TotalPackageNumber { get; set; }

    public string? TradeMark { get; set; }

    public decimal? Price { get; set; }

    public int? PartiallyOccupiedPlaces { get; set; }

    public virtual ICollection<GsGoodsPackaging> GsGoodsPackagings { get; } = new List<GsGoodsPackaging>();

    public virtual GsInvoice Invoice { get; set; } = null!;
}
