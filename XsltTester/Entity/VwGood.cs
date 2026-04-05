using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwGood
{
    public Guid GoodsId { get; set; }

    public Guid InvoiceId { get; set; }

    public Guid GsId { get; set; }

    public string? InvoiceNumber { get; set; }

    public DateTime? InvoiceDate { get; set; }

    public string? PresentDocuments { get; set; }

    public int GoodsNumeric { get; set; }

    public string? GoodsTnvedcode { get; set; }

    public string GoodsDescription { get; set; } = null!;

    public decimal? GrossWeightQuantity { get; set; }

    public decimal? NetWeightQuantity { get; set; }

    public string? OriginCountryCode { get; set; }

    public string? OriginCountryName { get; set; }

    public decimal? InvoicedCost { get; set; }

    public decimal? GoodsQuantity { get; set; }

    public string? MeasureUnitQualifierCode { get; set; }

    public string? PackingAccordingSource { get; set; }

    public string? GoodsPackings { get; set; }
}
