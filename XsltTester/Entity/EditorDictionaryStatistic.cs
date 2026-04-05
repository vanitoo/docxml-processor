using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class EditorDictionaryStatistic
{
    public long Id { get; set; }

    public string DictType { get; set; } = null!;

    public string FieldName { get; set; } = null!;

    public string Value { get; set; } = null!;

    public long Frequency { get; set; }

    public string UserName { get; set; } = null!;
}
