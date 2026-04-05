using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictRole
{
    public int RoleId { get; set; }

    public string RoleName { get; set; } = null!;

    public string? Description { get; set; }

    public string AvailableActions { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual ICollection<AuthUsersInRole> AuthUsersInRoles { get; } = new List<AuthUsersInRole>();
}
