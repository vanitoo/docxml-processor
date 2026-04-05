using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictDepartmentRole
{
    public int RoleId { get; set; }

    public string RoleName { get; set; } = null!;

    public string? Description { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual ICollection<AuthDepartmentsInRole> AuthDepartmentsInRoles { get; } = new List<AuthDepartmentsInRole>();
}
