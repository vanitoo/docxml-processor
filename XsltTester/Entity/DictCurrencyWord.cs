using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictCurrencyWord
{
    public string CurrencyCode { get; set; } = null!;

    public string? Unit1 { get; set; }

    public string? Unit2 { get; set; }

    public string? Unit3 { get; set; }

    public string? Piece1 { get; set; }

    public string? Piece2 { get; set; }

    public string? Piece3 { get; set; }
}
