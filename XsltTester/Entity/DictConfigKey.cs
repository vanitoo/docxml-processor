using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictConfigKey
{
    public string ConfigKey { get; set; } = null!;

    public string DefaultConfigValue { get; set; } = null!;

    public string? ConfigType { get; set; }

    public string? ConfigDescription { get; set; }

    public string? ConfigGroup { get; set; }

    public string? ValuesList { get; set; }

    public int Npp { get; set; }

    public DateTime DateBorn { get; set; }

    public string DictType { get; set; } = null!;

    public virtual ICollection<UsrProfileConfig> UsrProfileConfigs { get; } = new List<UsrProfileConfig>();
}
