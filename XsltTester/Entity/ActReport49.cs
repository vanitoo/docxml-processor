using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class ActReport49
{
    public Guid Id { get; set; }

    public Guid DepartmentId { get; set; }

    public DateTime DateReport { get; set; }

    public string? Data { get; set; }

    public DateTime Dateborn { get; set; }

    public string Author { get; set; } = null!;

    public string ReportType { get; set; } = null!;

    public virtual AuthDepartment Department { get; set; } = null!;
}
