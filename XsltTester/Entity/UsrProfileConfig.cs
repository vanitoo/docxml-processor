using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrProfileConfig
{
    public int Id { get; set; }

    public Guid UserId { get; set; }

    public string ConfigKey { get; set; } = null!;

    public string ConfigValue { get; set; } = null!;

    public DateTime DateBorn { get; set; }

    public virtual DictConfigKey ConfigKeyNavigation { get; set; } = null!;

    public virtual AuthUserProfile User { get; set; } = null!;
}
