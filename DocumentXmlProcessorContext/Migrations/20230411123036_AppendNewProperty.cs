using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DocumentXmlProcessorContext.Migrations;

/// <inheritdoc />
public partial class AppendNewProperty : Migration
{
    /// <inheritdoc />
    protected override void Up(MigrationBuilder migrationBuilder)
    {
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

    /// <inheritdoc />
    protected override void Down(MigrationBuilder migrationBuilder)
    {
        migrationBuilder.DropColumn(
            name: "ErrorId",
            table: "ProcessingFilesData");

        migrationBuilder.DropColumn(
            name: "ErrorMessage",
            table: "ProcessingFilesData");
    }
}
