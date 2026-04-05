using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsInvoice
{
    public Guid InvoiceId { get; set; }

    public Guid GsId { get; set; }

    public string? InvoiceNumber { get; set; }

    public DateTime? InvoiceDate { get; set; }

    public string? CurrencyCode { get; set; }

    public int InvoiceNumeric { get; set; }

    public int InvoiceType { get; set; }

    public decimal? CurrencyRatio { get; set; }

    public string? ResultingCurrency { get; set; }

    public bool ConvertCurrency { get; set; }

    public string? LinkContainers { get; set; }

    public string? DeliveryTerms { get; set; }

    public virtual GsMain Gs { get; set; } = null!;

    public virtual ICollection<GsGood> GsGoods { get; } = new List<GsGood>();

    public virtual DictInvoiceType InvoiceTypeNavigation { get; set; } = null!;
}
