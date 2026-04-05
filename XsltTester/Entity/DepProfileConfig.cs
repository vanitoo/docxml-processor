using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DepProfileConfig
{
    public int Id { get; set; }

    public Guid ProfileId { get; set; }

    public string ConfigKey { get; set; } = null!;

    public string ConfigValue { get; set; } = null!;

    public string EditAuthor { get; set; } = null!;

    public DateTime EditDate { get; set; }

    public virtual DepProfile Profile { get; set; } = null!;
}
