using FluentAssertions;
using PdfProcessor.Processing;
using Xunit;

namespace PdfProcessor.Tests.Processing;

public class PdfProcessingTests
{
    private static readonly byte[] FakePdfBytes =
    {
        0x25, 0x50, 0x44, 0x46, // %PDF
        0x2D, 0x31, 0x2E, 0x34  // -1.4
    };

    [Fact]
    public void PdfProcessing_Constructor_ShouldInitialize()
    {
        // Act
        var processing = new PdfProcessing(html => FakePdfBytes);

        // Assert
        processing.Should().NotBeNull();
    }

    [Fact]
    public void PdfProcessing_Processing_WithValidHtml_ShouldReturnBytes()
    {
        // Arrange
        var processing = new PdfProcessing(html => FakePdfBytes);
        var html = "<html><body><h1>Test</h1></body></html>";

        // Act
        var result = processing.Processing(html);

        // Assert
        result.Should().NotBeNull();
        result.Should().NotBeEmpty();
        result.Take(4).Should().Equal(new byte[] { 0x25, 0x50, 0x44, 0x46 });
    }

    [Fact]
    public void PdfProcessing_Processing_WithEmptyHtml_ShouldReturnBytes()
    {
        // Arrange
        var processing = new PdfProcessing(html => FakePdfBytes);
        var html = "<html><body></body></html>";

        // Act
        var result = processing.Processing(html);

        // Assert
        result.Should().NotBeNull();
        result.Should().NotBeEmpty();
    }

    [Fact]
    public void PdfProcessing_Processing_WithComplexHtml_ShouldReturnBytes()
    {
        // Arrange
        var processing = new PdfProcessing(html => FakePdfBytes);
        var html = @"<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: Arial; }
        .header { color: blue; }
    </style>
</head>
<body>
    <div class='header'>
        <h1>Document Title</h1>
        <p>Paragraph with some text.</p>
        <table>
            <tr><td>Cell 1</td><td>Cell 2</td></tr>
        </table>
    </div>
</body>
</html>";

        // Act
        var result = processing.Processing(html);

        // Assert
        result.Should().NotBeNull();
        result.Should().NotBeEmpty();
        result.Take(4).Should().Equal(new byte[] { 0x25, 0x50, 0x44, 0x46 });
    }

    [Fact]
    public void PdfProcessing_Processing_WithNullHtml_ShouldThrowArgumentNullException()
    {
        // Arrange
        var processing = new PdfProcessing(html => FakePdfBytes);

        // Act
        Action act = () => processing.Processing(null!);

        // Assert
        act.Should().Throw<ArgumentNullException>()
            .WithParameterName("data");
    }
}
