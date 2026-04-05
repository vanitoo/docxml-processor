using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class ActTelegram
{
    public int TelegramId { get; set; }

    public int ExpeditorId { get; set; }

    public string Number { get; set; } = null!;

    public DateTime DateTelegram { get; set; }

    public DateTime? DateBegin { get; set; }

    public DateTime? DateEnd { get; set; }

    public int? CountAviableTs { get; set; }

    public DateTime DateBorn { get; set; }

    public Guid AuthorId { get; set; }

    public virtual ICollection<ActBody> ActBodies { get; } = new List<ActBody>();

    public virtual UsrExpeditor Expeditor { get; set; } = null!;
}
