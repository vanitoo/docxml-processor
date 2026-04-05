using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using XsltTester.Entity;

namespace XsltTester.Context;

public partial class AstraDbContext : DbContext
{
    public AstraDbContext()
    {
    }

    public AstraDbContext(DbContextOptions<AstraDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ActBody> ActBodies { get; set; }

    public virtual DbSet<ActHeader> ActHeaders { get; set; }

    public virtual DbSet<ActReport49> ActReport49s { get; set; }

    public virtual DbSet<ActTelegram> ActTelegrams { get; set; }

    public virtual DbSet<AuthDepartment> AuthDepartments { get; set; }

    public virtual DbSet<AuthDepartmentsInRole> AuthDepartmentsInRoles { get; set; }

    public virtual DbSet<AuthUserAttach> AuthUserAttaches { get; set; }

    public virtual DbSet<AuthUserProfile> AuthUserProfiles { get; set; }

    public virtual DbSet<AuthUsersInRole> AuthUsersInRoles { get; set; }

    public virtual DbSet<DepProfile> DepProfiles { get; set; }

    public virtual DbSet<DepProfileConfig> DepProfileConfigs { get; set; }

    public virtual DbSet<DictActionForLog> DictActionForLogs { get; set; }

    public virtual DbSet<DictClientContract> DictClientContracts { get; set; }

    public virtual DbSet<DictConfigKey> DictConfigKeys { get; set; }

    public virtual DbSet<DictCurrencyRate> DictCurrencyRates { get; set; }

    public virtual DbSet<DictCurrencyWord> DictCurrencyWords { get; set; }

    public virtual DbSet<DictDepartmentRole> DictDepartmentRoles { get; set; }

    public virtual DbSet<DictDocumentType> DictDocumentTypes { get; set; }

    public virtual DbSet<DictInvoiceType> DictInvoiceTypes { get; set; }

    public virtual DbSet<DictObjectAction> DictObjectActions { get; set; }

    public virtual DbSet<DictPrincipal> DictPrincipals { get; set; }

    public virtual DbSet<DictReasonChProfile> DictReasonChProfiles { get; set; }

    public virtual DbSet<DictReportType> DictReportTypes { get; set; }

    public virtual DbSet<DictRole> DictRoles { get; set; }

    public virtual DbSet<DictSessionAction> DictSessionActions { get; set; }

    public virtual DbSet<DictSessionType> DictSessionTypes { get; set; }

    public virtual DbSet<DictSigner> DictSigners { get; set; }

    public virtual DbSet<DictStatus> DictStatuses { get; set; }

    public virtual DbSet<DictStatusMessage> DictStatusMessages { get; set; }

    public virtual DbSet<DictTbcPortalMessage> DictTbcPortalMessages { get; set; }

    public virtual DbSet<DictTypeBp> DictTypeBps { get; set; }

    public virtual DbSet<DictTypeSource> DictTypeSources { get; set; }

    public virtual DbSet<EditorDictionaryStatistic> EditorDictionaryStatistics { get; set; }

    public virtual DbSet<EmailAttachment> EmailAttachments { get; set; }

    public virtual DbSet<EmailRegistry> EmailRegistries { get; set; }

    public virtual DbSet<FldFolder> FldFolders { get; set; }

    public virtual DbSet<FldWagon> FldWagons { get; set; }

    public virtual DbSet<FldWaybill> FldWaybills { get; set; }

    public virtual DbSet<GsChProfileInfo> GsChProfileInfos { get; set; }

    public virtual DbSet<GsDocumentAttr> GsDocumentAttrs { get; set; }

    public virtual DbSet<GsDocumentXml> GsDocumentXmls { get; set; }

    public virtual DbSet<GsExpeditor> GsExpeditors { get; set; }

    public virtual DbSet<GsFavoriteDocument> GsFavoriteDocuments { get; set; }

    public virtual DbSet<GsFavoriteDocumentXml> GsFavoriteDocumentXmls { get; set; }

    public virtual DbSet<GsGood> GsGoods { get; set; }

    public virtual DbSet<GsGoodsPackaging> GsGoodsPackagings { get; set; }

    public virtual DbSet<GsHistory> GsHistories { get; set; }

    public virtual DbSet<GsInvoice> GsInvoices { get; set; }

    public virtual DbSet<GsMain> GsMains { get; set; }

    public virtual DbSet<GsMessageSignXml> GsMessageSignXmls { get; set; }

    public virtual DbSet<GsObjectDocument> GsObjectDocuments { get; set; }

    public virtual DbSet<GsObjectMessage> GsObjectMessages { get; set; }

    public virtual DbSet<GsObjectSession> GsObjectSessions { get; set; }

    public virtual DbSet<GsOrganization> GsOrganizations { get; set; }

    public virtual DbSet<GsOrganizationAddress> GsOrganizationAddresses { get; set; }

    public virtual DbSet<GsOrganizationDetail> GsOrganizationDetails { get; set; }

    public virtual DbSet<GsPiDocument> GsPiDocuments { get; set; }

    public virtual DbSet<GsPrecedingDocumentAdditionalInfo> GsPrecedingDocumentAdditionalInfos { get; set; }

    public virtual DbSet<GsPresentedDocument> GsPresentedDocuments { get; set; }

    public virtual DbSet<GsTdDocument> GsTdDocuments { get; set; }

    public virtual DbSet<GsTemplate> GsTemplates { get; set; }

    public virtual DbSet<GsTransport> GsTransports { get; set; }

    public virtual DbSet<GsValidationInfo> GsValidationInfos { get; set; }

    public virtual DbSet<LogAction> LogActions { get; set; }

    public virtual DbSet<ObjUpdate> ObjUpdates { get; set; }

    public virtual DbSet<ObjValidationInfo> ObjValidationInfos { get; set; }

    public virtual DbSet<RpClientTd> RpClientTds { get; set; }

    public virtual DbSet<RpClientTdDetail> RpClientTdDetails { get; set; }

    public virtual DbSet<RpMonitorTranskont> RpMonitorTranskonts { get; set; }

    public virtual DbSet<StatUserUseFeature> StatUserUseFeatures { get; set; }

    public virtual DbSet<SysConfig> SysConfigs { get; set; }

    public virtual DbSet<SysError> SysErrors { get; set; }

    public virtual DbSet<SysIisrestartRequest> SysIisrestartRequests { get; set; }

    public virtual DbSet<SysJob> SysJobs { get; set; }

    public virtual DbSet<SysSupportProblem> SysSupportProblems { get; set; }

    public virtual DbSet<SysVisit> SysVisits { get; set; }

    public virtual DbSet<Temp> Temps { get; set; }

    public virtual DbSet<UsrArchive> UsrArchives { get; set; }

    public virtual DbSet<UsrArchiveDocument> UsrArchiveDocuments { get; set; }

    public virtual DbSet<UsrCode44> UsrCode44s { get; set; }

    public virtual DbSet<UsrConsignorForRzd> UsrConsignorForRzds { get; set; }

    public virtual DbSet<UsrCurrencyRate> UsrCurrencyRates { get; set; }

    public virtual DbSet<UsrDeclarant> UsrDeclarants { get; set; }

    public virtual DbSet<UsrExcelCustomUnit> UsrExcelCustomUnits { get; set; }

    public virtual DbSet<UsrExpeditor> UsrExpeditors { get; set; }

    public virtual DbSet<UsrOrganization> UsrOrganizations { get; set; }

    public virtual DbSet<UsrProfileConfig> UsrProfileConfigs { get; set; }

    public virtual DbSet<UsrUserStation> UsrUserStations { get; set; }

    public virtual DbSet<UsrWarning> UsrWarnings { get; set; }

    public virtual DbSet<VwActHeader> VwActHeaders { get; set; }

    public virtual DbSet<VwDepProfile> VwDepProfiles { get; set; }

    public virtual DbSet<VwDepProfileConfig> VwDepProfileConfigs { get; set; }

    public virtual DbSet<VwDocument> VwDocuments { get; set; }

    public virtual DbSet<VwFolder> VwFolders { get; set; }

    public virtual DbSet<VwFolderSession> VwFolderSessions { get; set; }

    public virtual DbSet<VwGood> VwGoods { get; set; }

    public virtual DbSet<VwGsHistory> VwGsHistories { get; set; }

    public virtual DbSet<VwGsMain> VwGsMains { get; set; }

    public virtual DbSet<VwGsSession> VwGsSessions { get; set; }

    public virtual DbSet<VwSmgsStation> VwSmgsStations { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ActBody>(entity =>
        {
            entity.ToTable("actBody");

            entity.HasIndex(e => e.ActId, "IX_actBody_ActId");

            entity.Property(e => e.ActBodyId).HasDefaultValueSql("(newid())");
            entity.Property(e => e.Comment).HasMaxLength(1000);
            entity.Property(e => e.DepartureStation).HasMaxLength(150);
            entity.Property(e => e.DepartureStationName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.DestinationCountry)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.DestinationStation).HasMaxLength(150);
            entity.Property(e => e.DestinationStationName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.DispatchCountry)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.GoodsName)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.GoodsWeight).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.Npp).HasColumnName("NPP");
            entity.Property(e => e.SmgsDate).HasColumnType("date");
            entity.Property(e => e.SmgsNumber)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.WagonNumber)
                .HasMaxLength(150)
                .IsUnicode(false);

            entity.HasOne(d => d.Act).WithMany(p => p.ActBodies)
                .HasForeignKey(d => d.ActId)
                .HasConstraintName("FK_actBody_actHeader");

            entity.HasOne(d => d.Telegram).WithMany(p => p.ActBodies)
                .HasForeignKey(d => d.TelegramId)
                .HasConstraintName("FK_actBody_actTelegram");
        });

        modelBuilder.Entity<ActHeader>(entity =>
        {
            entity.HasKey(e => e.ActId);

            entity.ToTable("actHeader");

            entity.HasIndex(e => new { e.FolderId, e.ExpeditorId }, "IX_actHeader_FolderId");

            entity.Property(e => e.ActId).HasDefaultValueSql("(newid())");
            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.DateAct).HasColumnType("date");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");
            entity.Property(e => e.Number)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.StationForAct)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("('')");

            entity.HasOne(d => d.Expeditor).WithMany(p => p.ActHeaders)
                .HasForeignKey(d => d.ExpeditorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_actHeader_dictExpeditor");

            entity.HasOne(d => d.Folder).WithMany(p => p.ActHeaders)
                .HasForeignKey(d => d.FolderId)
                .HasConstraintName("FK_actHeader_fldFolder");
        });

        modelBuilder.Entity<ActReport49>(entity =>
        {
            entity.ToTable("actReport49");

            entity.Property(e => e.Id).HasDefaultValueSql("(newid())");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.Data).HasColumnType("xml");
            entity.Property(e => e.DateReport).HasColumnType("date");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ReportType)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Department).WithMany(p => p.ActReport49s)
                .HasForeignKey(d => d.DepartmentId)
                .HasConstraintName("FK_actReport49_authDepartment");
        });

        modelBuilder.Entity<ActTelegram>(entity =>
        {
            entity.HasKey(e => e.TelegramId);

            entity.ToTable("actTelegram");

            entity.HasIndex(e => new { e.ExpeditorId, e.DateTelegram }, "IX_actTelegram_ExpeditorId");

            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.CountAviableTs).HasColumnName("CountAviableTS");
            entity.Property(e => e.DateBegin).HasColumnType("date");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DateEnd).HasColumnType("date");
            entity.Property(e => e.DateTelegram).HasColumnType("date");
            entity.Property(e => e.Number)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Expeditor).WithMany(p => p.ActTelegrams)
                .HasForeignKey(d => d.ExpeditorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_actTelegram_dictExpeditor");
        });

        modelBuilder.Entity<AuthDepartment>(entity =>
        {
            entity.HasKey(e => e.DepartmentId);

            entity.ToTable("authDepartment");

            entity.HasIndex(e => e.CodeOp, "UQ_authDepartment_CodeOp").IsUnique();

            entity.Property(e => e.DepartmentId).HasDefaultValueSql("(newid())");
            entity.Property(e => e.ActStationName).HasMaxLength(255);
            entity.Property(e => e.AssignedStations).HasMaxLength(255);
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.CustomCode)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasDefaultValueSql("((10000000))");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DepartmentName).HasMaxLength(255);
            entity.Property(e => e.IsSystem).HasColumnName("isSystem");
            entity.Property(e => e.KodDor).HasMaxLength(2);
        });

        modelBuilder.Entity<AuthDepartmentsInRole>(entity =>
        {
            entity.HasKey(e => new { e.DepartmentId, e.DepartmentRoleId });

            entity.ToTable("authDepartmentsInRole");

            entity.Property(e => e.Author).HasMaxLength(255);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Department).WithMany(p => p.AuthDepartmentsInRoles)
                .HasForeignKey(d => d.DepartmentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_authDepartmentsInRole_authDepartment");

            entity.HasOne(d => d.DepartmentRole).WithMany(p => p.AuthDepartmentsInRoles)
                .HasForeignKey(d => d.DepartmentRoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_authDepartmentsInRole_dictDepartmentRole");
        });

        modelBuilder.Entity<AuthUserAttach>(entity =>
        {
            entity.ToTable("authUserAttach");

            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("id");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Enabled)
                .IsRequired()
                .HasDefaultValueSql("((1))");

            entity.HasOne(d => d.User).WithMany(p => p.AuthUserAttaches)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_authUserAttach_authUserProfile");
        });

        modelBuilder.Entity<AuthUserProfile>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("authUserProfile");

            entity.HasIndex(e => e.UserName, "UQ_authUserProfile").IsUnique();

            entity.Property(e => e.UserId)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("UserID");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.AviableSessionType)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasDefaultValueSql("('1,2,3,4,5,6,7,8,9,10,')");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email)
                .HasMaxLength(250)
                .IsUnicode(false);
            entity.Property(e => e.GetNotifiedByEmail)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.LinkedAccounts).HasColumnType("xml");
            entity.Property(e => e.ListUserDocuments).IsUnicode(false);
            entity.Property(e => e.UserName).HasMaxLength(255);

            entity.HasOne(d => d.Department).WithMany(p => p.AuthUserProfiles)
                .HasForeignKey(d => d.DepartmentId)
                .HasConstraintName("FK_authUserProfile_authDepartment");
        });

        modelBuilder.Entity<AuthUsersInRole>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.RoleId });

            entity.ToTable("authUsersInRole");

            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Role).WithMany(p => p.AuthUsersInRoles)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_authUsersInRole_dictRole");

            entity.HasOne(d => d.User).WithMany(p => p.AuthUsersInRoles)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_authUsersInRole_authUserProfile");
        });

        modelBuilder.Entity<DepProfile>(entity =>
        {
            entity.HasKey(e => e.ProfileId);

            entity.ToTable("depProfile");

            entity.Property(e => e.ProfileId).ValueGeneratedNever();
            entity.Property(e => e.Author).HasMaxLength(255);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IsDefault).HasColumnName("isDefault");
            entity.Property(e => e.ProfileName)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Department).WithMany(p => p.DepProfiles)
                .HasForeignKey(d => d.DepartmentId)
                .HasConstraintName("FK_depProfile_authDepartment");
        });

        modelBuilder.Entity<DepProfileConfig>(entity =>
        {
            entity.ToTable("depProfileConfig");

            entity.HasIndex(e => new { e.ProfileId, e.ConfigKey }, "IX_depProfileConfig");

            entity.Property(e => e.ConfigKey)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.EditAuthor)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.EditDate).HasColumnType("datetime");

            entity.HasOne(d => d.Profile).WithMany(p => p.DepProfileConfigs)
                .HasForeignKey(d => d.ProfileId)
                .HasConstraintName("FK_depProfileConfig_depProfile");
        });

        modelBuilder.Entity<DictActionForLog>(entity =>
        {
            entity.HasKey(e => e.ActionId).HasName("PK_dictAction");

            entity.ToTable("dictActionForLog");

            entity.Property(e => e.ActionId)
                .ValueGeneratedNever()
                .HasColumnName("ActionID");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<DictClientContract>(entity =>
        {
            entity.ToTable("dictClientContract");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.ClientContract)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("clientContract");
            entity.Property(e => e.ClientName)
                .HasMaxLength(450)
                .IsUnicode(false)
                .HasColumnName("clientName");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<DictConfigKey>(entity =>
        {
            entity.HasKey(e => e.ConfigKey).HasName("PK_dictUserConfigKey");

            entity.ToTable("dictConfigKey");

            entity.Property(e => e.ConfigKey)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ConfigDescription)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ConfigGroup)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ConfigType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DictType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('userconfig')");
            entity.Property(e => e.Npp).HasColumnName("NPP");
            entity.Property(e => e.ValuesList).IsUnicode(false);
        });

        modelBuilder.Entity<DictCurrencyRate>(entity =>
        {
            entity.HasKey(e => new { e.CurrencyCode, e.ReferenceDate }).HasName("PK_dictCurrencyRate");

            entity.ToTable("!dictCurrencyRate");

            entity.HasIndex(e => e.ReferenceDate, "IX_dictCurrencyRate_ReferenceDate");

            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("Currency_Code");
            entity.Property(e => e.ReferenceDate).HasColumnType("date");
            entity.Property(e => e.CrDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CurrencyCodeNum)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("Currency_Code_Num");
            entity.Property(e => e.Rate).HasColumnType("money");
        });

        modelBuilder.Entity<DictCurrencyWord>(entity =>
        {
            entity.HasKey(e => e.CurrencyCode);

            entity.ToTable("dictCurrencyWords");

            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.Piece1)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Piece2)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Piece3)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Unit1)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Unit2)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Unit3)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<DictDepartmentRole>(entity =>
        {
            entity.HasKey(e => e.RoleId);

            entity.ToTable("dictDepartmentRole");

            entity.Property(e => e.Author).HasMaxLength(255);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.RoleName).HasMaxLength(50);
        });

        modelBuilder.Entity<DictDocumentType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dictDocumentType_1");

            entity.ToTable("dictDocumentType");

            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("id");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.AvailableActions).IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DefaultCode44).HasMaxLength(5);
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.DocType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.EditorVersion)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.PrintVersion)
                .HasMaxLength(500)
                .IsUnicode(false);
        });

        modelBuilder.Entity<DictInvoiceType>(entity =>
        {
            entity.HasKey(e => e.InvoiceTypeId);

            entity.ToTable("dictInvoiceType");

            entity.Property(e => e.InvoiceTypeId)
                .ValueGeneratedNever()
                .HasColumnName("InvoiceTypeID");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.Code44).HasMaxLength(50);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<DictObjectAction>(entity =>
        {
            entity.HasKey(e => e.ActionId);

            entity.ToTable("dictObjectAction");

            entity.Property(e => e.ActionId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ActionID");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Group)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("group");
            entity.Property(e => e.IsArchiveAction).HasDefaultValueSql("((0))");
            entity.Property(e => e.IsDeletedAction)
                .HasDefaultValueSql("((0))")
                .HasColumnName("isDeletedAction");
            entity.Property(e => e.ObjectType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('Folder')");
        });

        modelBuilder.Entity<DictPrincipal>(entity =>
        {
            entity.ToTable("dictPrincipal");

            entity.HasIndex(e => new { e.ParticipantId, e.TransportType }, "UQ_dictPrincipal").IsUnique();

            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("id");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.OrganizationName)
                .HasMaxLength(200)
                .HasDefaultValueSql("('')");
            entity.Property(e => e.ParticipantId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ParticipantID");
            entity.Property(e => e.ReceiverInformation)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.SenderInformation)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.TransportType)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasDefaultValueSql("('TbcProvider')");
        });

        modelBuilder.Entity<DictReasonChProfile>(entity =>
        {
            entity.ToTable("dictReasonChProfile");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<DictReportType>(entity =>
        {
            entity.HasKey(e => e.ReportId);

            entity.ToTable("dictReportType");

            entity.Property(e => e.ReportId).HasDefaultValueSql("(newid())");
            entity.Property(e => e.AccessRole)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasDefaultValueSql("('')");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.PublicName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ReportCodeName)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<DictRole>(entity =>
        {
            entity.HasKey(e => e.RoleId);

            entity.ToTable("dictRole");

            entity.Property(e => e.RoleId).ValueGeneratedNever();
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.AvailableActions)
                .IsUnicode(false)
                .HasDefaultValueSql("('')");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.RoleName).HasMaxLength(50);
        });

        modelBuilder.Entity<DictSessionAction>(entity =>
        {
            entity.HasKey(e => e.ActionId);

            entity.ToTable("dictSessionAction");

            entity.Property(e => e.ActionId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ActionID");
            entity.Property(e => e.AccessAlbumVersion)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.AlterAction)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Group)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("group");
            entity.Property(e => e.IsDeletedAction)
                .HasDefaultValueSql("((0))")
                .HasColumnName("isDeletedAction");
            entity.Property(e => e.IsSendPtd).HasColumnName("isSendPtd");
            entity.Property(e => e.IsSendToTransit).HasColumnName("isSendToTransit");
            entity.Property(e => e.IsSignedAction).HasColumnName("isSignedAction");
            entity.Property(e => e.SessionType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("((0))");
        });

        modelBuilder.Entity<DictSessionType>(entity =>
        {
            entity.HasKey(e => e.SessionTypeId);

            entity.ToTable("dictSessionType");

            entity.Property(e => e.SessionTypeId)
                .ValueGeneratedNever()
                .HasColumnName("SessionTypeID");
            entity.Property(e => e.ActualVersion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('5.9.0')");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TypeRootMessages)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<DictSigner>(entity =>
        {
            entity.ToTable("dictSigner");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.Company)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.DeclarantId)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("DeclarantID");
            entity.Property(e => e.TheName)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("theName");
            entity.Property(e => e.UserName)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("userName");
        });

        modelBuilder.Entity<DictStatus>(entity =>
        {
            entity.HasKey(e => e.StatusId);

            entity.ToTable("dictStatus");

            entity.Property(e => e.StatusId).ValueGeneratedNever();
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.AvailableActions).IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IsReadyToArch)
                .IsRequired()
                .HasDefaultValueSql("((1))")
                .HasColumnName("isReadyToArch");
            entity.Property(e => e.IsSessionOpen).HasColumnName("isSessionOpen");
            entity.Property(e => e.ObjectOwnerName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('All')")
                .HasComment("Название Объекта, которому может принадлежать этот статус");
            entity.Property(e => e.SessionType).HasDefaultValueSql("((7))");
            entity.Property(e => e.StatusName).HasMaxLength(500);
        });

        modelBuilder.Entity<DictStatusMessage>(entity =>
        {
            entity.ToTable("dictStatusMessage");

            entity.HasIndex(e => new { e.MessageCode, e.Direction, e.SessionType }, "IX_dictStatusMessage_MessageCode");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("id");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Direction)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('FromRZD')");
            entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");
            entity.Property(e => e.MessageCode)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<DictTbcPortalMessage>(entity =>
        {
            entity.ToTable("dictTbcPortalMessage");

            entity.HasIndex(e => e.Id, "IX_dictTbcPortalMessage");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.EventMessageType).HasMaxLength(50);
            entity.Property(e => e.RmsType).HasMaxLength(50);

            entity.HasOne(d => d.TypeSource).WithMany(p => p.DictTbcPortalMessages)
                .HasForeignKey(d => d.TypeSourceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_dictTbcPortalMessage_dictTbcPortalMessage");
        });

        modelBuilder.Entity<DictTypeBp>(entity =>
        {
            entity.HasKey(e => e.TypeBpid).HasName("PK_dictProfileType");

            entity.ToTable("dictTypeBP");

            entity.Property(e => e.TypeBpid)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("TypeBPId");
            entity.Property(e => e.ActualBpVersion)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('5.11.0')");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.AvailableActions)
                .HasMaxLength(2500)
                .IsUnicode(false)
                .HasDefaultValueSql("('')");
            entity.Property(e => e.CodeName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ProfileName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.RzdtransportType)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasDefaultValueSql("('OLDRZD')")
                .HasColumnName("RZDTransportType");
        });

        modelBuilder.Entity<DictTypeSource>(entity =>
        {
            entity.HasKey(e => e.TypeSourceId).HasName("PK_dictFolderType");

            entity.ToTable("dictTypeSource");

            entity.Property(e => e.TypeSourceId).ValueGeneratedNever();
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ToDirection)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<EditorDictionaryStatistic>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_DictStat");

            entity.ToTable("editorDictionaryStatistics");

            entity.HasIndex(e => new { e.UserName, e.DictType }, "IX_editorDictionaryStatistics");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DictType)
                .HasMaxLength(50)
                .HasColumnName("dictType");
            entity.Property(e => e.FieldName)
                .HasMaxLength(1024)
                .HasColumnName("fieldName");
            entity.Property(e => e.UserName).HasMaxLength(255);
            entity.Property(e => e.Value).HasMaxLength(1024);
        });

        modelBuilder.Entity<EmailAttachment>(entity =>
        {
            entity.Property(e => e.Id).HasDefaultValueSql("(newid())");
            entity.Property(e => e.Attachments).HasColumnType("xml");

            entity.HasOne(d => d.IdNavigation).WithOne(p => p.EmailAttachment)
                .HasForeignKey<EmailAttachment>(d => d.Id)
                .HasConstraintName("FK_EmailAttachments_EmailRegistry");
        });

        modelBuilder.Entity<EmailRegistry>(entity =>
        {
            entity.ToTable("EmailRegistry");

            entity.Property(e => e.Id).HasDefaultValueSql("(newid())");
            entity.Property(e => e.Author)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.DateSend).HasColumnType("datetime");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IsHtml)
                .HasDefaultValueSql("((0))")
                .HasColumnName("isHtml");
            entity.Property(e => e.MailFrom)
                .HasMaxLength(5000)
                .IsUnicode(false);
            entity.Property(e => e.SendBcc)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.SendTo)
                .HasMaxLength(5000)
                .IsUnicode(false);
            entity.Property(e => e.Subject).HasMaxLength(500);
        });

        modelBuilder.Entity<FldFolder>(entity =>
        {
            entity.HasKey(e => e.FolderId).HasName("PK_gsFolder");

            entity.ToTable("fldFolder");

            entity.HasIndex(e => e.DateBorn, "IX_FolderID_Dateborn");

            entity.HasIndex(e => new { e.IsArchieve, e.CodeOp }, "IX_Folder_CodeOP");

            entity.HasIndex(e => new { e.IsSystem, e.IsTrain, e.IsArchieve, e.DateBorn }, "IX_fldFolder");

            entity.HasIndex(e => e.StatusId, "IX_fldFolder_StatusId");

            entity.HasIndex(e => new { e.IsArchieve, e.CodeOp, e.DateBorn }, "IX_fldFolder_isArhive");

            entity.Property(e => e.FolderId).HasDefaultValueSql("(newid())");
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.FolderName).HasMaxLength(50);
            entity.Property(e => e.GsDefaultProfileId).HasColumnName("gsDefaultProfileId");
            entity.Property(e => e.IsArchieve).HasColumnName("isArchieve");
            entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");
            entity.Property(e => e.IsDoNotArchive).HasColumnName("isDoNotArchive");
            entity.Property(e => e.IsDoNotArchiveGs).HasColumnName("isDoNotArchiveGs");
            entity.Property(e => e.IsSystem).HasColumnName("isSystem");
            entity.Property(e => e.IsTrain).HasColumnName("isTrain");
            entity.Property(e => e.PpvNumber).HasMaxLength(50);
            entity.Property(e => e.Tags).HasMaxLength(1000);
            entity.Property(e => e.TrainIndex).HasMaxLength(50);
            entity.Property(e => e.TrainNumber).HasMaxLength(50);

            entity.HasOne(d => d.AuthorNavigation).WithMany(p => p.FldFolders)
                .HasForeignKey(d => d.Author)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsFolder_authUserProfile");

            entity.HasOne(d => d.CodeOpNavigation).WithMany(p => p.FldFolders)
                .HasPrincipalKey(p => p.CodeOp)
                .HasForeignKey(d => d.CodeOp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsFolder_authDepartment");

            entity.HasOne(d => d.FolderSourceNavigation).WithMany(p => p.FldFolders)
                .HasForeignKey(d => d.FolderSource)
                .HasConstraintName("FK_fldFolder_dictTypeSource");

            entity.HasOne(d => d.Profile).WithMany(p => p.FldFolders)
                .HasForeignKey(d => d.ProfileId)
                .HasConstraintName("FK_gsFolder_depProfile");
        });

        modelBuilder.Entity<FldWagon>(entity =>
        {
            entity.HasKey(e => e.WagonId);

            entity.ToTable("fldWagons");

            entity.HasIndex(e => e.FolderId, "IX_fldFolder_FolderId");

            entity.Property(e => e.WagonId).HasDefaultValueSql("(newid())");
            entity.Property(e => e.ContainerNumbers)
                .HasMaxLength(4000)
                .IsUnicode(false);
            entity.Property(e => e.DepartureStation)
                .HasMaxLength(6)
                .IsUnicode(false);
            entity.Property(e => e.DestinationStation)
                .HasMaxLength(6)
                .IsUnicode(false);
            entity.Property(e => e.GoodsWeightQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.WagonNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.WaybillNumbers).IsUnicode(false);

            entity.HasOne(d => d.Folder).WithMany(p => p.FldWagons)
                .HasForeignKey(d => d.FolderId)
                .HasConstraintName("FK_fldWagons_fldFolder");
        });

        modelBuilder.Entity<FldWaybill>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_gsFolderWaybill");

            entity.ToTable("fldWaybill");

            entity.HasIndex(e => new { e.FolderId, e.WaybillNumber }, "IX_fldWaybill_FolderId");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.FolderId).HasColumnName("FolderID");
            entity.Property(e => e.WaybillKey).HasMaxLength(50);
            entity.Property(e => e.WaybillNumber).HasMaxLength(50);

            entity.HasOne(d => d.Folder).WithMany(p => p.FldWaybills)
                .HasForeignKey(d => d.FolderId)
                .HasConstraintName("FK_gsFolderWaybill_gsFolder");
        });

        modelBuilder.Entity<GsChProfileInfo>(entity =>
        {
            entity.ToTable("gsChProfileInfo");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.AdditionalInfo)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.GsId).HasColumnName("gsId");
            entity.Property(e => e.TypeBpNew)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("typeBpNew");
            entity.Property(e => e.TypeBpOld)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("typeBpOld");

            entity.HasOne(d => d.Gs).WithMany(p => p.GsChProfileInfos)
                .HasForeignKey(d => d.GsId)
                .HasConstraintName("FK_gChProfileInfo_gsMain");

            entity.HasOne(d => d.Reason).WithMany(p => p.GsChProfileInfos)
                .HasForeignKey(d => d.ReasonId)
                .HasConstraintName("FK_gChProfileInfo_dictReasonChProfile");
        });

        modelBuilder.Entity<GsDocumentAttr>(entity =>
        {
            entity.HasKey(e => e.DocumentId);

            entity.ToTable("gsDocumentAttr");

            entity.Property(e => e.DocumentId).ValueGeneratedNever();
            entity.Property(e => e.ArchDocUin)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchDocUIN");
            entity.Property(e => e.ArchId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchID");
            entity.Property(e => e.Code44).HasMaxLength(5);
            entity.Property(e => e.EsadDeclarationKind)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.ExpiryDate).HasColumnType("datetime");
            entity.Property(e => e.PrDocumentDate).HasColumnType("datetime");
            entity.Property(e => e.PrDocumentName).HasMaxLength(255);
            entity.Property(e => e.PrDocumentNumber).HasMaxLength(50);

            entity.HasOne(d => d.Document).WithOne(p => p.GsDocumentAttr)
                .HasForeignKey<GsDocumentAttr>(d => d.DocumentId)
                .HasConstraintName("FK_gsDocumentAttr_gsObjectDocument");
        });

        modelBuilder.Entity<GsDocumentXml>(entity =>
        {
            entity.ToTable("gsDocumentXml");

            entity.HasIndex(e => e.DataHashSha255, "IX_gsDocumentXml_DataHashSHA256");

            entity.Property(e => e.GsDocumentXmlId)
                .ValueGeneratedNever()
                .HasColumnName("gsDocumentXmlId");
            entity.Property(e => e.Data).HasColumnType("xml");
            entity.Property(e => e.DataHashSha255)
                .HasMaxLength(256)
                .IsUnicode(false)
                .HasColumnName("DataHashSHA255");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.GsDocumentXmlNavigation).WithOne(p => p.GsDocumentXml)
                .HasForeignKey<GsDocumentXml>(d => d.GsDocumentXmlId)
                .HasConstraintName("FK_gsDocumentXml_gsObjectDocument");
        });

        modelBuilder.Entity<GsExpeditor>(entity =>
        {
            entity.HasKey(e => e.GsId);

            entity.ToTable("gsExpeditor");

            entity.Property(e => e.GsId)
                .ValueGeneratedNever()
                .HasColumnName("gsId");
            entity.Property(e => e.ExpeditorName).HasMaxLength(255);
            entity.Property(e => e.ExpeditorSubCode).HasMaxLength(200);

            entity.HasOne(d => d.Gs).WithOne(p => p.GsExpeditor)
                .HasForeignKey<GsExpeditor>(d => d.GsId)
                .HasConstraintName("FK_gsExpeditor_gsMain");
        });

        modelBuilder.Entity<GsFavoriteDocument>(entity =>
        {
            entity.ToTable("gsFavoriteDocument");

            entity.HasIndex(e => new { e.DepartmentId, e.Type }, "NonClusteredIndex-20220624-162540");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.AlbumVersion)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ArchDocUin)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchDocUIN");
            entity.Property(e => e.ArchId)
                .HasMaxLength(50)
                .HasColumnName("ArchID");
            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.Code44).HasMaxLength(5);
            entity.Property(e => e.Data).HasColumnType("xml");
            entity.Property(e => e.DepartmentId).HasColumnName("DepartmentID");
            entity.Property(e => e.ExpiryDate).HasColumnType("datetime");
            entity.Property(e => e.OriginalDocumentId).HasColumnName("OriginalDocumentID");
            entity.Property(e => e.PrDocumentDate).HasColumnType("datetime");
            entity.Property(e => e.PrDocumentName).HasMaxLength(255);
            entity.Property(e => e.PrDocumentNumber).HasMaxLength(50);
            entity.Property(e => e.TemplateDate).HasColumnType("datetime");
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<GsFavoriteDocumentXml>(entity =>
        {
            entity.HasKey(e => e.TemplateId);

            entity.ToTable("gsFavoriteDocumentXML");

            entity.Property(e => e.TemplateId).ValueGeneratedNever();
            entity.Property(e => e.Data).HasColumnType("xml");

            entity.HasOne(d => d.Template).WithOne(p => p.GsFavoriteDocumentXml)
                .HasForeignKey<GsFavoriteDocumentXml>(d => d.TemplateId)
                .HasConstraintName("FK_gsFavoriteDocumentXML_gsFavoriteDocument");
        });

        modelBuilder.Entity<GsGood>(entity =>
        {
            entity.HasKey(e => e.GoodsId);

            entity.ToTable("gsGoods");

            entity.HasIndex(e => e.GoodsTnvedcode, "IX_gsGoods_GoodsTNVEDCode");

            entity.HasIndex(e => new { e.InvoiceId, e.GoodsNumeric }, "IX_gsGoods_InvoiceId");

            entity.HasIndex(e => e.MeasureUnitAccordingSource, "IX_gsGoods_MeasureUnitAccordingSource");

            entity.Property(e => e.GoodsId)
                .ValueGeneratedNever()
                .HasColumnName("GoodsID");
            entity.Property(e => e.Article)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.DateEdit).HasColumnType("datetime");
            entity.Property(e => e.GoodsQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.GoodsTnvedcode)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("GoodsTNVEDCode");
            entity.Property(e => e.GrossWeightQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.InvoiceId).HasColumnName("InvoiceID");
            entity.Property(e => e.InvoicedCost).HasColumnType("numeric(20, 4)");
            entity.Property(e => e.MainGoodsQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.MainMeasureUnitQualifierCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.MeasureUnitAccordingSource)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasComment("Единицы измерения по версии источника");
            entity.Property(e => e.MeasureUnitQualifierCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.NetWeightQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.OriginCountryCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.PackingAccordingSource).IsUnicode(false);
            entity.Property(e => e.Price).HasColumnType("numeric(20, 4)");
            entity.Property(e => e.TradeMark).IsUnicode(false);

            entity.HasOne(d => d.Invoice).WithMany(p => p.GsGoods)
                .HasForeignKey(d => d.InvoiceId)
                .HasConstraintName("FK_gsGoods_gsInvoice");
        });

        modelBuilder.Entity<GsGoodsPackaging>(entity =>
        {
            entity.HasKey(e => e.PackingId);

            entity.ToTable("gsGoodsPackaging");

            entity.HasIndex(e => e.GoodsId, "IX_gsGoodsPackaging_goodsID");

            entity.Property(e => e.PackingId)
                .ValueGeneratedNever()
                .HasColumnName("PackingID");
            entity.Property(e => e.GoodsId).HasColumnName("goodsID");
            entity.Property(e => e.PackingCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.PackingMark).HasMaxLength(250);

            entity.HasOne(d => d.Goods).WithMany(p => p.GsGoodsPackagings)
                .HasForeignKey(d => d.GoodsId)
                .HasConstraintName("FK_gsGoodsPackaging_gsGoods");
        });

        modelBuilder.Entity<GsHistory>(entity =>
        {
            entity.HasKey(e => e.HistoryId).HasName("PK_Table_1");

            entity.ToTable("gsHistory");

            entity.HasIndex(e => new { e.ActionId, e.ObjectId, e.DateBorn }, "IX_gsHistory_ActionId");

            entity.HasIndex(e => e.ParentId, "IX_gsHistory_ParentID");

            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
        });

        modelBuilder.Entity<GsInvoice>(entity =>
        {
            entity.HasKey(e => e.InvoiceId);

            entity.ToTable("gsInvoice");

            entity.HasIndex(e => e.GsId, "IX_gsInvoice_gsId");

            entity.Property(e => e.InvoiceId)
                .ValueGeneratedNever()
                .HasColumnName("InvoiceID");
            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.CurrencyRatio).HasColumnType("numeric(20, 4)");
            entity.Property(e => e.DeliveryTerms)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.GsId).HasColumnName("gsID");
            entity.Property(e => e.InvoiceDate).HasColumnType("date");
            entity.Property(e => e.InvoiceNumber).HasMaxLength(250);
            entity.Property(e => e.InvoiceType).HasDefaultValueSql("((1))");
            entity.Property(e => e.LinkContainers).IsUnicode(false);
            entity.Property(e => e.ResultingCurrency)
                .HasMaxLength(3)
                .IsUnicode(false);

            entity.HasOne(d => d.Gs).WithMany(p => p.GsInvoices)
                .HasForeignKey(d => d.GsId)
                .HasConstraintName("FK_gsInvoice_gsMain");

            entity.HasOne(d => d.InvoiceTypeNavigation).WithMany(p => p.GsInvoices)
                .HasForeignKey(d => d.InvoiceType)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsInvoice_dictInvoiceType");
        });

        modelBuilder.Entity<GsMain>(entity =>
        {
            entity.HasKey(e => e.GsId);

            entity.ToTable("gsMain");

            entity.HasIndex(e => new { e.IsDeleted, e.CodeOp, e.DateBorn }, "IX_gsMain_CodeOP");

            entity.HasIndex(e => new { e.FolderId, e.CodeOp, e.Smgsnumber, e.DateBorn, e.IsDeleted }, "IX_gsMain_FolderId");

            entity.HasIndex(e => e.SourceId, "IX_gsMain_SourceID");

            entity.HasIndex(e => e.StatusId, "IX_gsMain_StatusID");

            entity.HasIndex(e => e.WaybillKey, "IX_gsMain_WaybillKey");

            entity.HasIndex(e => e.Tags, "NonClusteredIndex-20190910-162118");

            entity.Property(e => e.GsId)
                .ValueGeneratedNever()
                .HasColumnName("gsID");
            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.BorderCustomsCode)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.BorderTransport).IsUnicode(false);
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('OpTest')");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DateControlPoint).HasColumnType("datetime");
            entity.Property(e => e.DeliveryPlace)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.DeliveryTerms)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.DepartureStation).HasMaxLength(50);
            entity.Property(e => e.DestinationCountry)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.DestinationCustomsCode)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.DestinationStation).HasMaxLength(50);
            entity.Property(e => e.DispatchCountry)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.FolderId).HasColumnName("FolderID");
            entity.Property(e => e.PayerName).HasMaxLength(250);
            entity.Property(e => e.PortalLastComment).HasMaxLength(1000);
            entity.Property(e => e.PortalStatusName).HasMaxLength(500);
            entity.Property(e => e.PortalTargetId).HasColumnName("PortalTargetID");
            entity.Property(e => e.Smgsdate)
                .HasColumnType("datetime")
                .HasColumnName("SMGSDate");
            entity.Property(e => e.SmgsdepartureStation)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SMGSDepartureStation");
            entity.Property(e => e.Smgsnumber)
                .HasMaxLength(50)
                .HasColumnName("SMGSNumber");
            entity.Property(e => e.SourceId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SourceID");
            entity.Property(e => e.StatusId).HasColumnName("StatusID");
            entity.Property(e => e.Tags).HasMaxLength(1000);
            entity.Property(e => e.WaybillKey).HasMaxLength(50);

            entity.HasOne(d => d.Author).WithMany(p => p.GsMains)
                .HasForeignKey(d => d.AuthorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsMain_authUserProfile");

            entity.HasOne(d => d.CodeOpNavigation).WithMany(p => p.GsMains)
                .HasPrincipalKey(p => p.CodeOp)
                .HasForeignKey(d => d.CodeOp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsMain_authDepartment");

            entity.HasOne(d => d.Folder).WithMany(p => p.GsMains)
                .HasForeignKey(d => d.FolderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsMain_fldFolder");

            entity.HasOne(d => d.Profile).WithMany(p => p.GsMains)
                .HasForeignKey(d => d.ProfileId)
                .HasConstraintName("FK_gsMain_depProfile");

            entity.HasOne(d => d.SourceTypeNavigation).WithMany(p => p.GsMains)
                .HasForeignKey(d => d.SourceType)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsMain_dictTypeSource");

            entity.HasOne(d => d.Status).WithMany(p => p.GsMains)
                .HasForeignKey(d => d.StatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsMain_dictStatus");
        });

        modelBuilder.Entity<GsMessageSignXml>(entity =>
        {
            entity.HasKey(e => e.MessageId);

            entity.ToTable("gsMessageSignXml");

            entity.Property(e => e.MessageId).ValueGeneratedNever();
            entity.Property(e => e.Data).HasColumnType("xml");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Message).WithOne(p => p.GsMessageSignXml)
                .HasForeignKey<GsMessageSignXml>(d => d.MessageId)
                .HasConstraintName("FK_gsMessageSignXml_gsObjectMessages");
        });

        modelBuilder.Entity<GsObjectDocument>(entity =>
        {
            entity.HasKey(e => e.DocumentId);

            entity.ToTable("gsObjectDocument");

            entity.HasIndex(e => new { e.IsValid, e.IsPaper, e.IsDeleted }, "IX_gsObjectDocument_IsValid");

            entity.HasIndex(e => e.OriginalId, "IX_gsObjectDocument_OriginalId");

            entity.HasIndex(e => e.ParentId, "IX_gsObjectDocument_ParentID");

            entity.Property(e => e.DocumentId).ValueGeneratedNever();
            entity.Property(e => e.AlbumVersion)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.AutoGeneratedEditor).HasComment("Указывает на то, что документ был открыт в \"полной\" версии редактора и в дальнейшем его можно открывать только в \"полной\" версии, чтобы не пострадали поля, не отображённые в обычный редактор");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IsCorrection).HasColumnName("isCorrection");
            entity.Property(e => e.IsPaper).HasColumnName("isPaper");
            entity.Property(e => e.IsValid)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.OriginalId).HasColumnName("OriginalID");
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Author).WithMany(p => p.GsObjectDocuments)
                .HasForeignKey(d => d.AuthorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsObjectDocument_authUserProfile");
        });

        modelBuilder.Entity<GsObjectMessage>(entity =>
        {
            entity.HasKey(e => e.MessageId);

            entity.ToTable("gsObjectMessages");

            entity.HasIndex(e => e.DbmessagesId, "IX_gsObjectMessages_DBMessagesID");

            entity.HasIndex(e => new { e.Direction, e.MessageType, e.IsRepaid }, "IX_gsObjectMessages_Direction");

            entity.HasIndex(e => e.MessageType, "IX_gsObjectMessages_MessageType");

            entity.HasIndex(e => new { e.MessageType, e.ObjectId, e.IsDeleted }, "IX_gsObjectMessages_MessageType_ObjectId");

            entity.HasIndex(e => new { e.MessageType, e.ParentMessageId }, "IX_gsObjectMessages_MessageType_ParentMessageId");

            entity.HasIndex(e => e.SessionId, "IX_gsObjectMessages_SessionId");

            entity.Property(e => e.MessageId).HasColumnName("MessageID");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DbmessagesId).HasColumnName("DBMessagesID");
            entity.Property(e => e.Description).HasMaxLength(1024);
            entity.Property(e => e.Direction)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.EdexchangeId).HasColumnName("EDExchangeID");
            entity.Property(e => e.IsNotificationViewed)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            entity.Property(e => e.IsRequiresAnswer).HasColumnName("isRequiresAnswer");
            entity.Property(e => e.MainProccessId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("MainProccessID");
            entity.Property(e => e.MessageType).HasMaxLength(50);
            entity.Property(e => e.ParamsXml).HasColumnType("xml");
            entity.Property(e => e.ProcessingDate)
                .HasComment("Когда мы отправляем, в поле кладется дата отправки, когда мы принимаем - в поле кладется дата из транспортной бд")
                .HasColumnType("datetime");
            entity.Property(e => e.TransportExternalId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("TransportExternalID");

            entity.HasOne(d => d.Session).WithMany(p => p.GsObjectMessages)
                .HasForeignKey(d => d.SessionId)
                .HasConstraintName("FK_gsObjectMessages_gsObjectSession");
        });

        modelBuilder.Entity<GsObjectSession>(entity =>
        {
            entity.HasKey(e => e.SessionId);

            entity.ToTable("gsObjectSession");

            entity.HasIndex(e => e.InitialParentId, "IX_UQ_gsObjectSession_InitialParentId").IsUnique();

            entity.HasIndex(e => e.ProfileId, "IX_gsObjectSession_ProfileId");

            entity.Property(e => e.SessionId).ValueGeneratedNever();
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.InitialParentType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.InitialWaybillKey).HasMaxLength(50);
            entity.Property(e => e.RzdProcessId)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.SessionTypeNavigation).WithMany(p => p.GsObjectSessions)
                .HasForeignKey(d => d.SessionType)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsObjectSession_dictSessionType");

            entity.HasOne(d => d.Status).WithMany(p => p.GsObjectSessions)
                .HasForeignKey(d => d.StatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_gsObjectSession_dictStatus");
        });

        modelBuilder.Entity<GsOrganization>(entity =>
        {
            entity.HasKey(e => e.OrganizationId).IsClustered(false);

            entity.ToTable("gsOrganization");

            entity.HasIndex(e => new { e.GsId, e.InvoiceId, e.OrganizationType, e.OrganizationId, e.OrganizationName }, "IX_gsOrganization")
                .IsUnique()
                .IsClustered();

            entity.HasIndex(e => e.OrganizationName, "IX_gsOrganization_OrganizationName");

            entity.HasIndex(e => new { e.GsId, e.OrganizationType }, "IX_gsOrganization_gsId");

            entity.Property(e => e.OrganizationId)
                .ValueGeneratedNever()
                .HasColumnName("OrganizationID");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.GsId).HasColumnName("gsID");
            entity.Property(e => e.InvoiceId).HasColumnName("invoiceID");
            entity.Property(e => e.OrganizationName).HasMaxLength(150);
            entity.Property(e => e.OrganizationType)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('')");

            entity.HasOne(d => d.Gs).WithMany(p => p.GsOrganizations)
                .HasForeignKey(d => d.GsId)
                .HasConstraintName("FK_gsOrganization_gsMain");
        });

        modelBuilder.Entity<GsOrganizationAddress>(entity =>
        {
            entity.HasKey(e => e.OrganizationId);

            entity.ToTable("gsOrganizationAddress");

            entity.Property(e => e.OrganizationId)
                .ValueGeneratedNever()
                .HasColumnName("OrganizationID");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.PostalCode)
                .HasMaxLength(9)
                .IsUnicode(false);

            entity.HasOne(d => d.Organization).WithOne(p => p.GsOrganizationAddress)
                .HasForeignKey<GsOrganizationAddress>(d => d.OrganizationId)
                .HasConstraintName("FK_gsOrganizationAddress_gsOrganization");
        });

        modelBuilder.Entity<GsOrganizationDetail>(entity =>
        {
            entity.HasKey(e => e.OrganizationId);

            entity.ToTable("gsOrganizationDetails");

            entity.Property(e => e.OrganizationId)
                .ValueGeneratedNever()
                .HasColumnName("OrganizationID");
            entity.Property(e => e.Inn)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("INN");
            entity.Property(e => e.KgInn)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("kg_INN");
            entity.Property(e => e.KgOkpo)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("kg_OKPO");
            entity.Property(e => e.Kpp)
                .HasMaxLength(9)
                .IsUnicode(false)
                .HasColumnName("KPP");
            entity.Property(e => e.KzBin)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("kz_BIN");
            entity.Property(e => e.KzIin)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("kz_IIN");
            entity.Property(e => e.KzItnCategoryCode)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_CategoryCode");
            entity.Property(e => e.KzItnItnreserv)
                .HasMaxLength(36)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_ITNReserv");
            entity.Property(e => e.KzItnKatocode)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_KATOCode");
            entity.Property(e => e.KzItnRnn)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_RNN");
            entity.Property(e => e.Ogrn)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("OGRN");
            entity.Property(e => e.RaSocialServiceCertificate)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ra_SocialServiceCertificate");
            entity.Property(e => e.RaSocialServiceNumber)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ra_SocialServiceNumber");
            entity.Property(e => e.RaUnn)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("ra_UNN");
            entity.Property(e => e.RbRbidentificationNumber)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("rb_RBIdentificationNumber");
            entity.Property(e => e.RbUnp)
                .HasMaxLength(9)
                .IsUnicode(false)
                .HasColumnName("rb_UNP");

            entity.HasOne(d => d.Organization).WithOne(p => p.GsOrganizationDetail)
                .HasForeignKey<GsOrganizationDetail>(d => d.OrganizationId)
                .HasConstraintName("FK_gsOrganizationDetails_gsOrganization");
        });

        modelBuilder.Entity<GsPiDocument>(entity =>
        {
            entity.HasKey(e => e.DocumentId);

            entity.ToTable("gsPiDocument");

            entity.Property(e => e.DocumentId).ValueGeneratedNever();
            entity.Property(e => e.DateReg).HasColumnType("datetime");
            entity.Property(e => e.PiRegId)
                .HasMaxLength(50)
                .HasColumnName("PI_RegID");
            entity.Property(e => e.RegNumberCountryCode)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("RegNumber_CountryCode");
            entity.Property(e => e.RegNumberDate)
                .HasColumnType("date")
                .HasColumnName("RegNumber_Date");
            entity.Property(e => e.RegNumberPiNumber)
                .HasMaxLength(9)
                .IsUnicode(false)
                .HasColumnName("RegNumber_PiNumber");

            entity.HasOne(d => d.Document).WithOne(p => p.GsPiDocument)
                .HasForeignKey<GsPiDocument>(d => d.DocumentId)
                .HasConstraintName("FK_gsPiDocument_gsObjectDocument");
        });

        modelBuilder.Entity<GsPrecedingDocumentAdditionalInfo>(entity =>
        {
            entity.HasKey(e => e.DocumentId);

            entity.ToTable("gsPrecedingDocumentAdditionalInfo");

            entity.Property(e => e.DocumentId)
                .ValueGeneratedNever()
                .HasColumnName("DocumentID");
            entity.Property(e => e.CustomsCountryCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.IsPidocument).HasColumnName("isPIDocument");
            entity.Property(e => e.PrecedingDocumentCustomsCode)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.PrecedingDocumentId).HasColumnName("PrecedingDocumentID");

            entity.HasOne(d => d.Document).WithOne(p => p.GsPrecedingDocumentAdditionalInfo)
                .HasForeignKey<GsPrecedingDocumentAdditionalInfo>(d => d.DocumentId)
                .HasConstraintName("FK_gsPrecedingDocumentAdditionalInfo_gsPresentedDocuments");
        });

        modelBuilder.Entity<GsPresentedDocument>(entity =>
        {
            entity.HasKey(e => e.DocumentId).IsClustered(false);

            entity.ToTable("gsPresentedDocuments", tb => tb.HasTrigger("gsPresentedDocumentsFillExternalId"));

            entity.HasIndex(e => new { e.GsId, e.DocumentId }, "IX_gsPresentedDocuments_gsID").IsClustered();

            entity.Property(e => e.DocumentId)
                .ValueGeneratedNever()
                .HasColumnName("DocumentID");
            entity.Property(e => e.DocPresentKindCode).HasDefaultValueSql("((2))");
            entity.Property(e => e.DontExtractSmgs).HasColumnName("DontExtractSMGS");
            entity.Property(e => e.GsId).HasColumnName("gsID");
            entity.Property(e => e.IsPrecedingDocument).HasColumnName("isPrecedingDocument");
            entity.Property(e => e.LinkGoods).IsUnicode(false);
            entity.Property(e => e.PrDocumentDate).HasColumnType("date");
            entity.Property(e => e.PrDocumentName).HasMaxLength(250);
            entity.Property(e => e.PrDocumentNumber).HasMaxLength(50);
            entity.Property(e => e.PrModeCode)
                .HasMaxLength(5)
                .IsUnicode(false);

            entity.HasOne(d => d.Gs).WithMany(p => p.GsPresentedDocuments)
                .HasForeignKey(d => d.GsId)
                .HasConstraintName("FK_gsPresentedDocuments_gsMain");
        });

        modelBuilder.Entity<GsTdDocument>(entity =>
        {
            entity.HasKey(e => e.DocumentId);

            entity.ToTable("gsTdDocument");

            entity.HasIndex(e => e.TdRegNumber, "IX_gsTdDocument_Td_RegNumber");

            entity.Property(e => e.DocumentId).ValueGeneratedNever();
            entity.Property(e => e.CustomCode)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.DateReg).HasColumnType("date");
            entity.Property(e => e.DateReleased).HasColumnType("date");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DeclarantName).HasMaxLength(200);
            entity.Property(e => e.DestinationCustomsCode)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.ReportedState)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasDefaultValueSql("('waiting')");
            entity.Property(e => e.TdRegNumber)
                .HasMaxLength(25)
                .IsUnicode(false);
            entity.Property(e => e.TransitDateLimit).HasColumnType("date");

            entity.HasOne(d => d.Document).WithOne(p => p.GsTdDocument)
                .HasForeignKey<GsTdDocument>(d => d.DocumentId)
                .HasConstraintName("FK_gsTdDocument_gsObjectDocument");
        });

        modelBuilder.Entity<GsTemplate>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_gsDocumentTemplate_1");

            entity.ToTable("gsTemplate");

            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("ID");
            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TemplateDate).HasColumnType("datetime");

            entity.HasOne(d => d.Author).WithMany(p => p.GsTemplates)
                .HasForeignKey(d => d.AuthorId)
                .HasConstraintName("FK_gsTemplate_authUserProfile");

            entity.HasOne(d => d.Document).WithMany(p => p.GsTemplates)
                .HasForeignKey(d => d.DocumentId)
                .HasConstraintName("FK_gsTemplate_gsObjectDocument");
        });

        modelBuilder.Entity<GsTransport>(entity =>
        {
            entity.HasKey(e => e.TransportId);

            entity.ToTable("gsTransport");

            entity.HasIndex(e => e.GsId, "IX_gsTransport");

            entity.HasIndex(e => e.Number, "IX_gsTransport_Number");

            entity.Property(e => e.TransportId)
                .ValueGeneratedNever()
                .HasColumnName("TransportID");
            entity.Property(e => e.GsId).HasColumnName("gsID");
            entity.Property(e => e.IsContainer).HasColumnName("isContainer");
            entity.Property(e => e.Number).HasMaxLength(50);

            entity.HasOne(d => d.Gs).WithMany(p => p.GsTransports)
                .HasForeignKey(d => d.GsId)
                .HasConstraintName("FK_gsTransport_gsMain");
        });

        modelBuilder.Entity<GsValidationInfo>(entity =>
        {
            entity.HasKey(e => e.GsId).HasName("PK_gsValidationInfo");

            entity.ToTable("!gsValidationInfo");

            entity.Property(e => e.GsId).ValueGeneratedNever();
            entity.Property(e => e.ProblemDetails).HasColumnType("text");
        });

        modelBuilder.Entity<LogAction>(entity =>
        {
            entity.HasKey(e => e.LogId);

            entity.ToTable("logActions");

            entity.Property(e => e.ActionTypeString)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("IPAddress");
            entity.Property(e => e.UserName).HasMaxLength(255);
        });

        modelBuilder.Entity<ObjUpdate>(entity =>
        {
            entity.HasKey(e => e.ObjectId);

            entity.ToTable("objUpdate");

            entity.Property(e => e.ObjectId).ValueGeneratedNever();
            entity.Property(e => e.DateAuto)
                .HasComment("Когда последний раз обновлялось из TransmissionList")
                .HasColumnType("datetime");
            entity.Property(e => e.DateManual)
                .HasComment("Когда было выключено автообновление")
                .HasColumnType("datetime");
            entity.Property(e => e.IsManual)
                .HasComment("Включено ли автоматическое обновление из TransmisiionList. Автоматически выключается при сохранении ППВ")
                .HasColumnName("isManual");
            entity.Property(e => e.MessageTransportId).HasComment("Какой документ транспортной бд последний раз обновил ППВ");
        });

        modelBuilder.Entity<ObjValidationInfo>(entity =>
        {
            entity.HasKey(e => e.ObjId).HasName("PK_objValidationInfo_1");

            entity.ToTable("objValidationInfo");

            entity.Property(e => e.ObjId).ValueGeneratedNever();
            entity.Property(e => e.IsDocument).HasColumnName("isDocument");
            entity.Property(e => e.ProblemDetails).HasColumnType("text");
        });

        modelBuilder.Entity<RpClientTd>(entity =>
        {
            entity.ToTable("rpClientTd");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.ReportDate).HasColumnType("date");
            entity.Property(e => e.TypeReport)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('ClientTd')");
        });

        modelBuilder.Entity<RpClientTdDetail>(entity =>
        {
            entity.ToTable("rpClientTdDetail");

            entity.Property(e => e.Id).HasColumnName("ID");
            entity.Property(e => e.ClientContractNumber)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ClientId).HasColumnName("ClientID");
            entity.Property(e => e.ClientName)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ClientType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Data).HasColumnType("xml");
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.ParcipantName)
                .HasMaxLength(2000)
                .IsUnicode(false);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.ReportSum).HasColumnType("numeric(18, 2)");

            entity.HasOne(d => d.Parent).WithMany(p => p.RpClientTdDetails)
                .HasForeignKey(d => d.ParentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_rpClientTdDetail_rpClientTd");
        });

        modelBuilder.Entity<RpMonitorTranskont>(entity =>
        {
            entity.ToTable("rpMonitorTranskont");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.AdditionalNotes).IsUnicode(false);
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.ContainerNumbers).IsUnicode(false);
            entity.Property(e => e.CustomsControl).IsUnicode(false);
            entity.Property(e => e.Dateborn).HasColumnType("datetime");
            entity.Property(e => e.DocumentsReceive).HasColumnType("datetime");
            entity.Property(e => e.ExpeditorName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.OutfitNumber)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.PitSent).HasColumnType("datetime");
            entity.Property(e => e.RailwayBillReceive).HasColumnType("datetime");
            entity.Property(e => e.ReportToTk)
                .HasColumnType("datetime")
                .HasColumnName("ReportToTK");
            entity.Property(e => e.TdFilled).HasColumnType("datetime");
            entity.Property(e => e.TdRegister).HasColumnType("datetime");
            entity.Property(e => e.TdSent).HasColumnType("datetime");
            entity.Property(e => e.TransferToMarcevo).HasColumnType("datetime");
        });

        modelBuilder.Entity<StatUserUseFeature>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_stUserUseFunction");

            entity.ToTable("statUserUseFeatures");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.FeatureName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Link)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.ObjectType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.UserLogin)
                .HasMaxLength(500)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SysConfig>(entity =>
        {
            entity.ToTable("sysConfig");

            entity.HasIndex(e => e.ConfigKey, "IX_sysConfig_ConfigKey").IsUnique();

            entity.Property(e => e.ConfigKey)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ConfigType)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SysError>(entity =>
        {
            entity.ToTable("sysError");

            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DateExecution).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(1024)
                .IsUnicode(false);
            entity.Property(e => e.ObjectId)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Process)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SysIisrestartRequest>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_IISRestartRequests");

            entity.ToTable("sysIISRestartRequests");

            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.DatePlanned).HasColumnType("datetime");
            entity.Property(e => e.Proceed).HasColumnType("datetime");
        });

        modelBuilder.Entity<SysJob>(entity =>
        {
            entity.ToTable("sysJob");

            entity.HasIndex(e => new { e.Process, e.DateExecution, e.ObjectId, e.DateBorn }, "IX_sysJob_ProcessID");

            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.DateExecution).HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(1024)
                .IsUnicode(false);
            entity.Property(e => e.Process)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SysSupportProblem>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_sysSupportProblem_1");

            entity.ToTable("sysSupportProblem");

            entity.HasIndex(e => e.Dateborn, "IX_sysSupportProblem_dateBorn");

            entity.Property(e => e.Ais1035SessionId).HasColumnName("ais1035SessionID");
            entity.Property(e => e.Category)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Comment)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.DateClose).HasColumnType("datetime");
            entity.Property(e => e.DateSendNotify).HasColumnType("datetime");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.MessageType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TransportId)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SysVisit>(entity =>
        {
            entity.HasKey(e => new { e.ObjectId, e.UserId }).IsClustered(false);

            entity.ToTable("sysVisits");

            entity.HasIndex(e => new { e.DtVisited, e.ObjectId, e.UserId }, "CI_SysVisits").IsClustered();

            entity.Property(e => e.ObjectId).HasColumnName("objectID");
            entity.Property(e => e.UserId).HasColumnName("userID");
            entity.Property(e => e.DtVisited)
                .HasColumnType("datetime")
                .HasColumnName("dtVisited");
        });

        modelBuilder.Entity<Temp>(entity =>
        {
            entity.HasKey(e => e.G07);

            entity.ToTable("_Temp");

            entity.Property(e => e.G07)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("g07");
        });

        modelBuilder.Entity<UsrArchive>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dictArchive");

            entity.ToTable("usrArchive");

            entity.Property(e => e.Id).HasDefaultValueSql("(newid())");
            entity.Property(e => e.ArchiveId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchiveID");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Description)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.IsAstraMain).HasColumnName("isAstraMain");

            entity.HasOne(d => d.Principal).WithMany(p => p.UsrArchives)
                .HasForeignKey(d => d.PrincipalId)
                .HasConstraintName("FK_dictArchive_dictPrincipal");
        });

        modelBuilder.Entity<UsrArchiveDocument>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dictArchiveDocument");

            entity.ToTable("usrArchiveDocument");

            entity.HasIndex(e => e.ArchDocumentId, "IX_usrArchiveDocument_ArchDocumentId");

            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("id");
            entity.Property(e => e.ArchDocId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchDocID");
            entity.Property(e => e.ArchDocStatus).HasMaxLength(50);
            entity.Property(e => e.ArchDocumentId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchDocumentID");
            entity.Property(e => e.Code44).HasMaxLength(5);
            entity.Property(e => e.Data).HasColumnType("xml");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.DictArchiveId).HasColumnName("dictArchiveId");
            entity.Property(e => e.PrDocumentDate).HasColumnType("datetime");
            entity.Property(e => e.PrDocumentName).HasMaxLength(255);
            entity.Property(e => e.PrDocumentNumber).HasMaxLength(50);

            entity.HasOne(d => d.DictArchive).WithMany(p => p.UsrArchiveDocuments)
                .HasForeignKey(d => d.DictArchiveId)
                .HasConstraintName("FK_dictArchiveDocument_dictArchive");
        });

        modelBuilder.Entity<UsrCode44>(entity =>
        {
            entity.ToTable("usrCode44");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Code).HasMaxLength(50);
            entity.Property(e => e.Code44).HasMaxLength(50);
            entity.Property(e => e.Doc).HasMaxLength(150);
            entity.Property(e => e.IsDefault).HasColumnName("isDefault");
            entity.Property(e => e.ShortName).HasMaxLength(150);
        });

        modelBuilder.Entity<UsrConsignorForRzd>(entity =>
        {
            entity.ToTable("usrConsignorForRzd");

            entity.Property(e => e.Id).HasDefaultValueSql("(newid())");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('')")
                .HasColumnName("CodeOP");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Inn)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("INN");
            entity.Property(e => e.Kpp)
                .HasMaxLength(9)
                .IsUnicode(false)
                .HasColumnName("KPP");
            entity.Property(e => e.Ogrn)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("OGRN");
            entity.Property(e => e.OrganizationName).HasMaxLength(200);
            entity.Property(e => e.PostalCode)
                .HasMaxLength(9)
                .IsUnicode(false);
            entity.Property(e => e.ShortOrganizationName).HasMaxLength(100);
        });

        modelBuilder.Entity<UsrCurrencyRate>(entity =>
        {
            entity.HasKey(e => new { e.CurrencyCode, e.ReferenceDate });

            entity.ToTable("usrCurrencyRate");

            entity.HasIndex(e => e.ReferenceDate, "IX_usrCurrencyRate_ReferenceDate");

            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("Currency_Code");
            entity.Property(e => e.ReferenceDate).HasColumnType("date");
            entity.Property(e => e.CrDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CurrencyCodeNum)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("Currency_Code_Num");
            entity.Property(e => e.Rate).HasColumnType("money");
        });

        modelBuilder.Entity<UsrDeclarant>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dictDeclarant");

            entity.ToTable("usrDeclarant");

            entity.HasIndex(e => e.ColumnOrderNumber, "IX_dictDeclarant").IsUnique();

            entity.Property(e => e.Id).HasDefaultValueSql("(newid())");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('')")
                .HasColumnName("CodeOP");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Inn)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("INN");
            entity.Property(e => e.Kpp)
                .HasMaxLength(9)
                .IsUnicode(false)
                .HasColumnName("KPP");
            entity.Property(e => e.Ogrn)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("OGRN");
            entity.Property(e => e.OrganizationName).HasMaxLength(200);
            entity.Property(e => e.PostalCode)
                .HasMaxLength(9)
                .IsUnicode(false);
            entity.Property(e => e.ShortOrganizationName).HasMaxLength(100);
            entity.Property(e => e.ShortStreetHouse)
                .HasMaxLength(50)
                .HasColumnName("shortStreetHouse");
        });

        modelBuilder.Entity<UsrExcelCustomUnit>(entity =>
        {
            entity.ToTable("usrExcelCustomUnits");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Author).HasMaxLength(255);
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.KnownUnitCode)
                .HasMaxLength(5)
                .IsUnicode(false);
            entity.Property(e => e.UnknownUnit)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.CodeOpNavigation).WithMany(p => p.UsrExcelCustomUnits)
                .HasPrincipalKey(p => p.CodeOp)
                .HasForeignKey(d => d.CodeOp)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_usrExcelCustomUnits_authDepartment");
        });

        modelBuilder.Entity<UsrExpeditor>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dictExpeditor");

            entity.ToTable("usrExpeditor");

            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.ContractNumber)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.ExpeditorName).HasMaxLength(255);
        });

        modelBuilder.Entity<UsrOrganization>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dictOrganization");

            entity.ToTable("usrOrganization");

            entity.HasIndex(e => new { e.CodeOp, e.OrganizationType, e.OrganizationName }, "IX_dictOrganization");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('')")
                .HasColumnName("CodeOP");
            entity.Property(e => e.CountryCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Inn)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("INN");
            entity.Property(e => e.KgInn)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("kg_INN");
            entity.Property(e => e.KgOkpo)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("kg_OKPO");
            entity.Property(e => e.Kpp)
                .HasMaxLength(9)
                .IsUnicode(false)
                .HasColumnName("KPP");
            entity.Property(e => e.KzBin)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("kz_BIN");
            entity.Property(e => e.KzIin)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("kz_IIN");
            entity.Property(e => e.KzItnCategoryCode)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_CategoryCode");
            entity.Property(e => e.KzItnItnreserv)
                .HasMaxLength(36)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_ITNReserv");
            entity.Property(e => e.KzItnKatocode)
                .HasMaxLength(2)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_KATOCode");
            entity.Property(e => e.KzItnRnn)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("kz_ITN_RNN");
            entity.Property(e => e.Ogrn)
                .HasMaxLength(15)
                .IsUnicode(false)
                .HasColumnName("OGRN");
            entity.Property(e => e.OrganizationName).HasMaxLength(150);
            entity.Property(e => e.OrganizationType)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Phone).HasMaxLength(50);
            entity.Property(e => e.PostalCode)
                .HasMaxLength(9)
                .IsUnicode(false);
            entity.Property(e => e.RaSocialServiceCertificate)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ra_SocialServiceCertificate");
            entity.Property(e => e.RaSocialServiceNumber)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("ra_SocialServiceNumber");
            entity.Property(e => e.RaUnn)
                .HasMaxLength(8)
                .IsUnicode(false)
                .HasColumnName("ra_UNN");
            entity.Property(e => e.RbRbidentificationNumber)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("rb_RBIdentificationNumber");
            entity.Property(e => e.RbUnp)
                .HasMaxLength(9)
                .IsUnicode(false)
                .HasColumnName("rb_UNP");
        });

        modelBuilder.Entity<UsrProfileConfig>(entity =>
        {
            entity.ToTable("usrProfileConfig");

            entity.HasIndex(e => new { e.UserId, e.ConfigKey }, "UQ_usrProfileConfig").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.ConfigKey)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.ConfigKeyNavigation).WithMany(p => p.UsrProfileConfigs)
                .HasForeignKey(d => d.ConfigKey)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_usrProfileConfig_dictConfigKey");

            entity.HasOne(d => d.User).WithMany(p => p.UsrProfileConfigs)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_usrProfileConfig_authUserProfile");
        });

        modelBuilder.Entity<UsrUserStation>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_dictUserStation");

            entity.ToTable("usrUserStation");

            entity.Property(e => e.Id)
                .HasDefaultValueSql("(newid())")
                .HasColumnName("id");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .HasDefaultValueSql("(suser_sname())");
            entity.Property(e => e.DateBorn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.StationCode)
                .HasMaxLength(6)
                .IsUnicode(false)
                .HasColumnName("Station_code");
            entity.Property(e => e.StationName)
                .HasMaxLength(155)
                .IsUnicode(false)
                .HasColumnName("Station_name");
            entity.Property(e => e.ZdCarrier)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ZD_Carrier");
            entity.Property(e => e.ZdCodeRus)
                .HasMaxLength(4)
                .IsUnicode(false)
                .HasColumnName("ZD_Code_Rus");
            entity.Property(e => e.ZdName)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ZD_Name");
        });

        modelBuilder.Entity<UsrWarning>(entity =>
        {
            entity.ToTable("usrWarning");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Author)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.DateEnd).HasColumnType("datetime");
            entity.Property(e => e.DateStart).HasColumnType("datetime");
            entity.Property(e => e.Dateborn)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.System)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasComment("Название системы:\r\nАСТРА \r\nРЖД\r\nФТС");
            entity.Property(e => e.Warning)
                .HasMaxLength(5000)
                .IsUnicode(false);
            entity.Property(e => e.WarningKind)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValueSql("('default')");
        });

        modelBuilder.Entity<VwActHeader>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vwActHeader");

            entity.Property(e => e.Author).HasMaxLength(255);
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.DateAct).HasColumnType("date");
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.ExpeditorName).HasMaxLength(255);
            entity.Property(e => e.FolderName).HasMaxLength(50);
            entity.Property(e => e.IsArchieve).HasColumnName("isArchieve");
            entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");
            entity.Property(e => e.Number)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwDepProfile>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_DepProfile");

            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.DepartmentName).HasMaxLength(255);
            entity.Property(e => e.IsDefault).HasColumnName("isDefault");
            entity.Property(e => e.ProfileName)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwDepProfileConfig>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vwDepProfileConfig");

            entity.Property(e => e.ConfigDescription)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ConfigGroup)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.ConfigKey)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ConfigType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Npp).HasColumnName("NPP");
            entity.Property(e => e.ValuesList).IsUnicode(false);
        });

        modelBuilder.Entity<VwDocument>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vwDocuments");

            entity.Property(e => e.ArchDocUin)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchDocUIN");
            entity.Property(e => e.ArchId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchID");
            entity.Property(e => e.Code44).HasMaxLength(5);
            entity.Property(e => e.Data).HasColumnType("xml");
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.PrDocumentDate).HasColumnType("datetime");
            entity.Property(e => e.PrDocumentNumber).HasMaxLength(50);
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwFolder>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_Folder");

            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.FolderName).HasMaxLength(50);
            entity.Property(e => e.IsArchieve).HasColumnName("isArchieve");
            entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");
            entity.Property(e => e.IsTrain).HasColumnName("isTrain");
            entity.Property(e => e.PpvNumber).HasMaxLength(50);
            entity.Property(e => e.StatusName).HasMaxLength(500);
            entity.Property(e => e.TrainIndex).HasMaxLength(50);
            entity.Property(e => e.TrainNumber).HasMaxLength(50);
        });

        modelBuilder.Entity<VwFolderSession>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vwFolderSession");

            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("CodeOP");
            entity.Property(e => e.FolderName).HasMaxLength(50);
            entity.Property(e => e.PpvNumber).HasMaxLength(50);
            entity.Property(e => e.TrainIndex).HasMaxLength(50);
            entity.Property(e => e.TrainNumber).HasMaxLength(50);
        });

        modelBuilder.Entity<VwGood>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vwGoods");

            entity.Property(e => e.GoodsId).HasColumnName("GoodsID");
            entity.Property(e => e.GoodsPackings).IsUnicode(false);
            entity.Property(e => e.GoodsQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.GoodsTnvedcode)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("GoodsTNVEDCode");
            entity.Property(e => e.GrossWeightQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.GsId).HasColumnName("gsID");
            entity.Property(e => e.InvoiceDate).HasColumnType("date");
            entity.Property(e => e.InvoiceNumber).HasMaxLength(250);
            entity.Property(e => e.InvoicedCost).HasColumnType("numeric(20, 4)");
            entity.Property(e => e.MeasureUnitQualifierCode)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.NetWeightQuantity).HasColumnType("numeric(24, 6)");
            entity.Property(e => e.OriginCountryCode)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.OriginCountryName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PackingAccordingSource).IsUnicode(false);
            entity.Property(e => e.PresentDocuments).IsUnicode(false);
        });

        modelBuilder.Entity<VwGsHistory>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_gsHistory");

            entity.Property(e => e.ArchDocUin)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchDocUIN");
            entity.Property(e => e.ArchId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("ArchID");
            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Code44).HasMaxLength(5);
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.ObjectName).HasMaxLength(500);
            entity.Property(e => e.ParentId).HasColumnName("ParentID");
            entity.Property(e => e.PrDocumentNumber).HasMaxLength(50);
            entity.Property(e => e.Smgsnumber)
                .HasMaxLength(50)
                .HasColumnName("SMGSNumber");
            entity.Property(e => e.Type)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<VwGsMain>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_gsMain");

            entity.Property(e => e.Author)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.AuthorId).HasColumnName("AuthorID");
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Consignor).HasMaxLength(150);
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.FolderId).HasColumnName("FolderID");
            entity.Property(e => e.GsId).HasColumnName("gsID");
            entity.Property(e => e.IsArchieve).HasColumnName("isArchieve");
            entity.Property(e => e.Smgsnumber)
                .HasMaxLength(50)
                .HasColumnName("SMGSNumber");
            entity.Property(e => e.StatusId).HasColumnName("StatusID");
            entity.Property(e => e.StatusName).HasMaxLength(500);
            entity.Property(e => e.Tags).HasMaxLength(1000);
            entity.Property(e => e.WaybillKey).HasMaxLength(50);
        });

        modelBuilder.Entity<VwGsSession>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vwGsSession");

            entity.Property(e => e.BorderCustomsCode)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.CodeOp)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.DateBorn).HasColumnType("datetime");
            entity.Property(e => e.FolderId).HasColumnName("FolderID");
            entity.Property(e => e.FolderName).HasMaxLength(50);
            entity.Property(e => e.GsId).HasColumnName("gsID");
            entity.Property(e => e.Smgsnumber)
                .HasMaxLength(50)
                .HasColumnName("SMGSNumber");
            entity.Property(e => e.SourceId)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("SourceID");
            entity.Property(e => e.StatusId).HasColumnName("StatusID");
            entity.Property(e => e.WaybillKey).HasMaxLength(50);
        });

        modelBuilder.Entity<VwSmgsStation>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vwSmgsStation");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.StationCode)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("Station_code");
            entity.Property(e => e.StationName)
                .HasMaxLength(155)
                .IsUnicode(false)
                .HasColumnName("Station_name");
            entity.Property(e => e.ZdCarrier)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ZD_Carrier");
            entity.Property(e => e.ZdCodeRus)
                .HasMaxLength(4)
                .IsUnicode(false)
                .HasColumnName("ZD_Code_Rus");
            entity.Property(e => e.ZdName)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("ZD_Name");
        });
        modelBuilder.HasSequence("sqPresentExternalId");

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
