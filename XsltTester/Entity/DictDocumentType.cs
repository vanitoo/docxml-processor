using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class DictDocumentType
{
    public Guid Id { get; set; }

    public string DocType { get; set; } = null!;

    public string? Description { get; set; }

    public string PrintVersion { get; set; } = null!;

    public string? EditorVersion { get; set; }

    public string? AvailableActions { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public string Author { get; set; } = null!;

    public string? DefaultCode44 { get; set; }
}
