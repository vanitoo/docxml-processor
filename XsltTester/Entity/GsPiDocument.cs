using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsPiDocument
{
    public Guid DocumentId { get; set; }

    public string PiRegId { get; set; } = null!;

    public DateTime DateReg { get; set; }

    public string? RegNumberCountryCode { get; set; }

    public DateTime? RegNumberDate { get; set; }

    public string? RegNumberPiNumber { get; set; }

    public virtual GsObjectDocument Document { get; set; } = null!;
}
