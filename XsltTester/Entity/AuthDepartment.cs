using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class AuthDepartment
{
    public Guid DepartmentId { get; set; }

    public string? DepartmentName { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string CodeOp { get; set; } = null!;

    public int? BorderStationCode { get; set; }

    public string? KodDor { get; set; }

    public string? HiddenSystemFolder { get; set; }

    public int TimeOffset { get; set; }

    public string CustomCode { get; set; } = null!;

    public bool IsSystem { get; set; }

    public string? AssignedStations { get; set; }

    public string? ActStationName { get; set; }

    public virtual ICollection<ActReport49> ActReport49s { get; } = new List<ActReport49>();

    public virtual ICollection<AuthDepartmentsInRole> AuthDepartmentsInRoles { get; } = new List<AuthDepartmentsInRole>();

    public virtual ICollection<AuthUserProfile> AuthUserProfiles { get; } = new List<AuthUserProfile>();

    public virtual ICollection<DepProfile> DepProfiles { get; } = new List<DepProfile>();

    public virtual ICollection<FldFolder> FldFolders { get; } = new List<FldFolder>();

    public virtual ICollection<GsMain> GsMains { get; } = new List<GsMain>();

    public virtual ICollection<UsrExcelCustomUnit> UsrExcelCustomUnits { get; } = new List<UsrExcelCustomUnit>();
}
