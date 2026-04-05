using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class FldWaybill
{
    public Guid Id { get; set; }

    public Guid FolderId { get; set; }

    public string? WaybillNumber { get; set; }

    public string? WaybillKey { get; set; }

    public string? Transport { get; set; }

    public virtual FldFolder Folder { get; set; } = null!;
}
