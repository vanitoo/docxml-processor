using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictReasonChProfile
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public bool NeedAdditionalInfo { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public virtual ICollection<GsChProfileInfo> GsChProfileInfos { get; } = new List<GsChProfileInfo>();
}
