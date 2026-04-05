using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DocumentXmlProcessorContext.Migrations;

/// <inheritdoc />
public partial class ChangeStructure : Migration
{
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(
            name: "ErrorId",
            table: "ProcessingFilesData");

        migrationBuilder.DropColumn(
            name: "ErrorMessage",
            table: "ProcessingFilesData");

        migrationBuilder.CreateTable(
            name: "ProcessingFileErrors",
            columns: table => new
            {
                Id = table.Column<Guid>(type: "uuid", nullable: false),
                Message = table.Column<string>(type: "text", nullable: false),
                ProcessingFileId = table.Column<Guid>(type: "uuid", nullable: false)
            },
            constraints: table =>
            {
                table.PrimaryKey("PK_ProcessingFileErrors", x => x.Id);
                table.ForeignKey(
                    name: "FK_ProcessingFileErrors_ProcessingFiles_ProcessingFileId",
                    column: x => x.ProcessingFileId,
                    principalTable: "ProcessingFiles",
                    principalColumn: "Id",
                    onDelete: ReferentialAction.Cascade);
            });

        migrationBuilder.CreateIndex(
            name: "IX_ProcessingFileErrors_ProcessingFileId",
            table: "ProcessingFileErrors",
            column: "ProcessingFileId");
    }

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropTable(
            name: "ProcessingFileErrors");

        migrationBuilder.AddColumn<Guid>(
            name: "ErrorId",
            table: "ProcessingFilesData",
            type: "uuid",
            nullable: false,
            defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

        migrationBuilder.AddColumn<string>(
            name: "ErrorMessage",
            table: "ProcessingFilesData",
            type: "text",
            nullable: true);
    }
}
