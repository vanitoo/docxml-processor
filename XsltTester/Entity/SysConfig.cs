using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class SysConfig
{
    public int Id { get; set; }

    public string ConfigKey { get; set; } = null!;

    public string ConfigValue { get; set; } = null!;

    public string? ConfigType { get; set; }
}
