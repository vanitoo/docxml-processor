using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class VwDepProfileConfig
{
    public int? Id { get; set; }

    public Guid ProfileId { get; set; }

    public string ConfigKey { get; set; } = null!;

    public string ConfigValue { get; set; } = null!;

    public string? ConfigType { get; set; }

    public string? ConfigDescription { get; set; }

    public string? ConfigGroup { get; set; }

    public string? ValuesList { get; set; }

    public int Npp { get; set; }

    public bool IsDeleted { get; set; }
}
