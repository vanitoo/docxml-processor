using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace DocumentXmlProcessorContext.Context;

public class DocumentProcessorContextFactory : IDesignTimeDbContextFactory<DocumentProcessorContext>
{
    public DocumentProcessorContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<DocumentProcessorContext>();
        optionsBuilder.UseNpgsql("Host=192.168.12.111;Port=5432;Database=DocumentXmlProcessor;Username=postgres;Password=123QWE!@#123QWE!@#");

        return new DocumentProcessorContext(optionsBuilder.Options);
    }
}
