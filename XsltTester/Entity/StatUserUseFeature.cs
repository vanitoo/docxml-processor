using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class StatUserUseFeature
{
    public int Id { get; set; }

    public DateTime DateBorn { get; set; }

    public string UserLogin { get; set; } = null!;

    public string FeatureName { get; set; } = null!;

    public string? Description { get; set; }

    public string? Link { get; set; }

    public string? ObjectType { get; set; }
}
