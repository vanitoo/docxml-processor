using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsMain
{
    public Guid GsId { get; set; }

    public Guid FolderId { get; set; }

    public string? Smgsnumber { get; set; }

    public DateTime? Smgsdate { get; set; }

    public string DepartureStation { get; set; } = null!;

    public string DestinationStation { get; set; } = null!;

    public string? DestinationCountry { get; set; }

    public string? DispatchCountry { get; set; }

    public string? BorderCustomsCode { get; set; }

    public bool IsDeleted { get; set; }

    public DateTime DateBorn { get; set; }

    public Guid AuthorId { get; set; }

    public string CodeOp { get; set; } = null!;

    public string? WaybillKey { get; set; }

    public int SourceType { get; set; }

    public string? Comment { get; set; }

    public Guid? ProfileId { get; set; }

    public string? SourceId { get; set; }

    public int StatusId { get; set; }

    public string? DestinationCustomsCode { get; set; }

    public string? BorderTransport { get; set; }

    public string? SmgsdepartureStation { get; set; }

    public bool IsBaggageCheck { get; set; }

    public string? DeliveryTerms { get; set; }

    public string? DeliveryPlace { get; set; }

    public string? Tags { get; set; }

    public DateTime? DateControlPoint { get; set; }

    public string? PortalStatusName { get; set; }

    public string? PortalLastComment { get; set; }

    public Guid? RedispatchOriginalGsId { get; set; }

    public Guid? PortalTargetId { get; set; }

    public string? PayerName { get; set; }

    public virtual AuthUserProfile Author { get; set; } = null!;

    public virtual AuthDepartment CodeOpNavigation { get; set; } = null!;

    public virtual FldFolder Folder { get; set; } = null!;

    public virtual ICollection<GsChProfileInfo> GsChProfileInfos { get; } = new List<GsChProfileInfo>();

    public virtual GsExpeditor? GsExpeditor { get; set; }

    public virtual ICollection<GsInvoice> GsInvoices { get; } = new List<GsInvoice>();

    public virtual ICollection<GsOrganization> GsOrganizations { get; } = new List<GsOrganization>();

    public virtual ICollection<GsPresentedDocument> GsPresentedDocuments { get; } = new List<GsPresentedDocument>();

    public virtual ICollection<GsTransport> GsTransports { get; } = new List<GsTransport>();

    public virtual DepProfile? Profile { get; set; }

    public virtual DictTypeSource SourceTypeNavigation { get; set; } = null!;

    public virtual DictStatus Status { get; set; } = null!;
}
