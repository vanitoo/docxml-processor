using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DepProfile
{
    public Guid ProfileId { get; set; }

    public Guid DepartmentId { get; set; }

    public string ProfileName { get; set; } = null!;

    public bool IsDefault { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual ICollection<DepProfileConfig> DepProfileConfigs { get; } = new List<DepProfileConfig>();

    public virtual AuthDepartment Department { get; set; } = null!;

    public virtual ICollection<FldFolder> FldFolders { get; } = new List<FldFolder>();

    public virtual ICollection<GsMain> GsMains { get; } = new List<GsMain>();
}
