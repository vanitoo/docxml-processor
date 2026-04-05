using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrExcelCustomUnit
{
    public Guid Id { get; set; }

    public string UnknownUnit { get; set; } = null!;

    public string KnownUnitCode { get; set; } = null!;

    public string CodeOp { get; set; } = null!;

    public string Author { get; set; } = null!;

    public DateTime? DateBorn { get; set; }

    public virtual AuthDepartment CodeOpNavigation { get; set; } = null!;
}
