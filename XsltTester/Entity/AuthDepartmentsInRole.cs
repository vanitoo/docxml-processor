using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class AuthDepartmentsInRole
{
    public Guid DepartmentId { get; set; }

    public int DepartmentRoleId { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual AuthDepartment Department { get; set; } = null!;

    public virtual DictDepartmentRole DepartmentRole { get; set; } = null!;
}
