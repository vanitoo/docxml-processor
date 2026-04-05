using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictInvoiceType
{
    public int InvoiceTypeId { get; set; }

    public string Description { get; set; } = null!;

    public string Code44 { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual ICollection<GsInvoice> GsInvoices { get; } = new List<GsInvoice>();
}
