using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DocumentXmlProcessorContext.Migrations;

/// <inheritdoc />
public partial class ChangeTimeProcessing : Migration
{
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AlterColumn<double>(
            name: "PdfTimeProcessing",
            table: "ProcessingFilesData",
            type: "double precision",
            nullable: true,
            oldClrType: typeof(decimal),
            oldType: "numeric(20,0)",
            oldNullable: true);

        migrationBuilder.AlterColumn<double>(
            name: "HtmlTimeProcessing",
            table: "ProcessingFilesData",
            type: "double precision",
            nullable: true,
            oldClrType: typeof(decimal),
            oldType: "numeric(20,0)",
            oldNullable: true);
    }

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.AlterColumn<decimal>(
            name: "PdfTimeProcessing",
            table: "ProcessingFilesData",
            type: "numeric(20,0)",
            nullable: true,
            oldClrType: typeof(double),
            oldType: "double precision",
            oldNullable: true);

        migrationBuilder.AlterColumn<decimal>(
            name: "HtmlTimeProcessing",
            table: "ProcessingFilesData",
            type: "numeric(20,0)",
            nullable: true,
            oldClrType: typeof(double),
            oldType: "double precision",
            oldNullable: true);
    }
}
