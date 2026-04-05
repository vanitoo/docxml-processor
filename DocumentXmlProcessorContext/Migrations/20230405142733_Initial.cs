using System;
using System.Text.Json;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DocumentXmlProcessorContext.Migrations;

/// <inheritdoc />
public partial class Initial : Migration
{
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.CreateTable(
            name: "ProcessingFiles",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                DateCreated = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                DateCompleteProcessing = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                AdditionalData = table.Column<JsonDocument>(type: "jsonb", nullable: true),
                ProcessingFileDataId = table.Column<Guid>(type: "uuid", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_ProcessingFiles", x => x.Id);
            });

        migrationBuilder.CreateTable(
            name: "ProcessingFilesData",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                XmlPath = table.Column<string>(type: "text", nullable: false),
                HtmlPath = table.Column<string>(type: "text", nullable: true),
                PdfPath = table.Column<string>(type: "text", nullable: true),
                ProcessingFileId = table.Column<Guid>(type: "uuid", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_ProcessingFilesData", x => x.Id);
                table.ForeignKey(
                    name: "FK_ProcessingFilesData_ProcessingFiles_Id",
                    column: x => x.Id,
                    principalTable: "ProcessingFiles",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Cascade);
            });
    }

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(
            name: "ProcessingFilesData");

        migrationBuilder.DropTable(
            name: "ProcessingFiles");
    }
}
