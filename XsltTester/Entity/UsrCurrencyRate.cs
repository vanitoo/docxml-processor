using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrCurrencyRate
{
    public string CurrencyCode { get; set; } = null!;

    public DateTime ReferenceDate { get; set; }

    public decimal Rate { get; set; }

    public DateTime CrDate { get; set; }

    public string CurrencyCodeNum { get; set; } = null!;

    public int Nominal { get; set; }
}
