using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DocumentXmlProcessorContext.Migrations;

/// <inheritdoc />
public partial class AddTimeProcessing : Migration
{
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AddColumn<decimal>(
            name: "HtmlTimeProcessing",
            table: "ProcessingFilesData",
            type: "numeric(20,0)",
            nullable: true);

        migrationBuilder.AddColumn<decimal>(
            name: "PdfTimeProcessing",
            table: "ProcessingFilesData",
            type: "numeric(20,0)",
            nullable: true);
    }

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(
            name: "HtmlTimeProcessing",
            table: "ProcessingFilesData");

        migrationBuilder.DropColumn(
            name: "PdfTimeProcessing",
            table: "ProcessingFilesData");
    }
}
