using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class RpMonitorTranskont
{
    public Guid Id { get; set; }

    public Guid GsId { get; set; }

    public Guid? GroupId { get; set; }

    public string? OutfitNumber { get; set; }

    public DateTime DocumentsReceive { get; set; }

    public string? ExpeditorName { get; set; }

    public int GsCountInGroup { get; set; }

    public string? ContainerNumbers { get; set; }

    public DateTime? PitSent { get; set; }

    public DateTime? RailwayBillReceive { get; set; }

    public DateTime? TransferToMarcevo { get; set; }

    public DateTime? TdFilled { get; set; }

    public DateTime? TdSent { get; set; }

    public DateTime? TdRegister { get; set; }

    public string? CustomsControl { get; set; }

    public string? AdditionalNotes { get; set; }

    public DateTime Dateborn { get; set; }

    public string? CodeOp { get; set; }

    public DateTime? ReportToTk { get; set; }
}
