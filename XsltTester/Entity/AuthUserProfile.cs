using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class AuthUserProfile
{
    public Guid UserId { get; set; }

    public string UserName { get; set; } = null!;

    public Guid DepartmentId { get; set; }

    public string Password { get; set; } = null!;

    public string? FirstName { get; set; }

    public string? MiddleName { get; set; }

    public string? LastName { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string? Email { get; set; }

    public bool? GetNotifiedByEmail { get; set; }

    public string? AviableSessionType { get; set; }

    public string? ListUserDocuments { get; set; }

    public string? LinkedAccounts { get; set; }

    public bool IsSigner { get; set; }

    public virtual ICollection<AuthUserAttach> AuthUserAttaches { get; } = new List<AuthUserAttach>();

    public virtual ICollection<AuthUsersInRole> AuthUsersInRoles { get; } = new List<AuthUsersInRole>();

    public virtual AuthDepartment Department { get; set; } = null!;

    public virtual ICollection<FldFolder> FldFolders { get; } = new List<FldFolder>();

    public virtual ICollection<GsMain> GsMains { get; } = new List<GsMain>();

    public virtual ICollection<GsObjectDocument> GsObjectDocuments { get; } = new List<GsObjectDocument>();

    public virtual ICollection<GsTemplate> GsTemplates { get; } = new List<GsTemplate>();

    public virtual ICollection<UsrProfileConfig> UsrProfileConfigs { get; } = new List<UsrProfileConfig>();
}
