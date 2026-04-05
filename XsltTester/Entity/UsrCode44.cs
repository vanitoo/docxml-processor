using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrCode44
{
    public string Code44 { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Code { get; set; } = null!;

    public string Doc { get; set; } = null!;

    public Guid Id { get; set; }

    public bool IsDeleted { get; set; }

    public long Version { get; set; }

    public bool IsDefault { get; set; }

    public string? ShortName { get; set; }
}
