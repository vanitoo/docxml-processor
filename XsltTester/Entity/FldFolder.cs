using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class FldFolder
{
    public Guid FolderId { get; set; }

    public string FolderName { get; set; } = null!;

    public int SourceType { get; set; }

    public string? PpvNumber { get; set; }

    public string? TrainIndex { get; set; }

    public string? TrainNumber { get; set; }

    public DateTime DateBorn { get; set; }

    public Guid Author { get; set; }

    public bool IsDeleted { get; set; }

    public bool IsSystem { get; set; }

    public bool IsTrain { get; set; }

    public Guid? ProfileId { get; set; }

    public bool IsArchieve { get; set; }

    public string CodeOp { get; set; } = null!;

    public int StatusId { get; set; }

    public int? FolderSource { get; set; }

    public bool IsDoNotArchive { get; set; }

    public bool IsDoNotArchiveGs { get; set; }

    public Guid? GsDefaultProfileId { get; set; }

    public string? Tags { get; set; }

    public virtual ICollection<ActHeader> ActHeaders { get; } = new List<ActHeader>();

    public virtual AuthUserProfile AuthorNavigation { get; set; } = null!;

    public virtual AuthDepartment CodeOpNavigation { get; set; } = null!;

    public virtual ICollection<FldWagon> FldWagons { get; } = new List<FldWagon>();

    public virtual ICollection<FldWaybill> FldWaybills { get; } = new List<FldWaybill>();

    public virtual DictTypeSource? FolderSourceNavigation { get; set; }

    public virtual ICollection<GsMain> GsMains { get; } = new List<GsMain>();

    public virtual DepProfile? Profile { get; set; }
}
