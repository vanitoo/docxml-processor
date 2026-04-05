using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class ActBody
{
    public Guid ActBodyId { get; set; }

    public Guid ActId { get; set; }

    public int Npp { get; set; }

    public string WagonNumber { get; set; } = null!;

    public string SmgsNumber { get; set; } = null!;

    public DateTime? SmgsDate { get; set; }

    public string DepartureStation { get; set; } = null!;

    public string DestinationStation { get; set; } = null!;

    public string? DestinationCountry { get; set; }

    public string? DispatchCountry { get; set; }

    public string? GoodsName { get; set; }

    public decimal? GoodsWeight { get; set; }

    public string? Comment { get; set; }

    public int? TelegramId { get; set; }

    public string? DestinationStationName { get; set; }

    public string? DepartureStationName { get; set; }

    public virtual ActHeader Act { get; set; } = null!;

    public virtual ActTelegram? Telegram { get; set; }
}
