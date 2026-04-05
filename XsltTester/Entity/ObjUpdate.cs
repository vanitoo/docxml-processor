using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class ObjUpdate
{
    public Guid ObjectId { get; set; }

    /// <summary>
    /// Включено ли автоматическое обновление из TransmisiionList. Автоматически выключается при сохранении ППВ
    /// </summary>
    public bool IsManual { get; set; }

    /// <summary>
    /// Когда было выключено автообновление
    /// </summary>
    public DateTime? DateManual { get; set; }

    /// <summary>
    /// Когда последний раз обновлялось из TransmissionList
    /// </summary>
    public DateTime DateAuto { get; set; }

    /// <summary>
    /// Какой документ транспортной бд последний раз обновил ППВ
    /// </summary>
    public int? MessageTransportId { get; set; }
}
