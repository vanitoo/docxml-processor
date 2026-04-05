using System;
using System.Collections.Generic;

namespace XsltTester.Entity;

public partial class GsTemplate
{
    public Guid Id { get; set; }

    public Guid DocumentId { get; set; }

    public DateTime TemplateDate { get; set; }

    public Guid AuthorId { get; set; }

    public bool IsFavorite { get; set; }

    public DateTime DateBorn { get; set; }

    public virtual AuthUserProfile Author { get; set; } = null!;

    public virtual GsObjectDocument Document { get; set; } = null!;
}
