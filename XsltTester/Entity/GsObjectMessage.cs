using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsObjectMessage
{
    public int MessageId { get; set; }

    public Guid SessionId { get; set; }

    public string Direction { get; set; } = null!;

    public string MessageType { get; set; } = null!;

    public string? Description { get; set; }

    public DateTime DateBorn { get; set; }

    public Guid AuthorId { get; set; }

    /// <summary>
    /// Когда мы отправляем, в поле кладется дата отправки, когда мы принимаем - в поле кладется дата из транспортной бд
    /// </summary>
    public DateTime? ProcessingDate { get; set; }

    public string? SendNote { get; set; }

    public Guid? ObjectId { get; set; }

    public int? TransportId { get; set; }

    public Guid? DbmessagesId { get; set; }

    public int? ParentMessageId { get; set; }

    public bool IsDeleted { get; set; }

    public bool IsRepaid { get; set; }

    public string? ParamsXml { get; set; }

    public string? TransportExternalId { get; set; }

    public string? MainProccessId { get; set; }

    public long? EdexchangeId { get; set; }

    public bool IsRequiresAnswer { get; set; }

    public bool? IsNotificationViewed { get; set; }

    public virtual GsMessageSignXml? GsMessageSignXml { get; set; }

    public virtual GsObjectSession Session { get; set; } = null!;
}
