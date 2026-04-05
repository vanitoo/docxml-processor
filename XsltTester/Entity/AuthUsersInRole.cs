using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class AuthUsersInRole
{
    public Guid UserId { get; set; }

    public int RoleId { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual DictRole Role { get; set; } = null!;

    public virtual AuthUserProfile User { get; set; } = null!;
}
