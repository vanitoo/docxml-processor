using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictClientContract
{
    public int Id { get; set; }

    public string ClientName { get; set; } = null!;

    public string? ClientContract { get; set; }

    public DateTime DateBorn { get; set; }
}
