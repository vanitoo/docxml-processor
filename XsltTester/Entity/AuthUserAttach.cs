using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class AuthUserAttach
{
    public Guid Id { get; set; }

    public Guid UserId { get; set; }

    public string CodeOp { get; set; } = null!;

    public bool? Enabled { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual AuthUserProfile User { get; set; } = null!;
}
