using DocumentXmlProcessorContext.Entity;
using Microsoft.EntityFrameworkCore;

namespace DocumentXmlProcessorContext.Context;

public sealed class DocumentProcessorContext : DbContext
{
    public DbSet<ProcessingFile> ProcessingFiles { get; set; } = null!;
    public DbSet<ProcessingFileData> ProcessingFilesData { get; set; } = null!;
    public DbSet<ProcessingFileError> ProcessingFileErrors { get; set; } = null!;

    public DocumentProcessorContext(DbContextOptions<DocumentProcessorContext> options) : base(options)
    {
        //Database.EnsureCreated();
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ProcessingFile>().HasKey(x => x.Id);
        modelBuilder.Entity<ProcessingFileData>().HasKey(x => x.Id);

        modelBuilder.Entity<ProcessingFile>()
            .HasOne(x => x.ProcessingFileData)
            .WithOne(x => x.ProcessingFile)
            .HasForeignKey<ProcessingFileData>(x => x.Id);

        modelBuilder.Entity<ProcessingFile>()
            .HasMany(x => x.ProcessingFileErrors)
            .WithOne(x => x.ProcessingFile)
            .HasForeignKey(x => x.ProcessingFileId);
    }
}
