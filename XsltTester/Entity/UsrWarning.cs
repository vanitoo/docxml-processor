using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class UsrWarning
{
    public int Id { get; set; }

    /// <summary>
    /// Название системы:
    /// АСТРА 
    /// РЖД
    /// ФТС
    /// </summary>
    public string System { get; set; } = null!;

    public string? Warning { get; set; }

    public DateTime DateStart { get; set; }

    public DateTime DateEnd { get; set; }

    public DateTime Dateborn { get; set; }

    public string Author { get; set; } = null!;

    public string WarningKind { get; set; } = null!;
}
