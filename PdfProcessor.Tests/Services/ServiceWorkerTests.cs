using FluentAssertions;
using Microsoft.Extensions.Logging;
using Moq;
using PdfProcessor.Services;
using ProcessingCommon.Services;
using Xunit;

namespace PdfProcessor.Tests.Services;

public class ServiceWorkerTests
{
    private readonly Mock<ILogger<ServiceWorker>> _loggerMock;
    private readonly Mock<IBrockerProcessor> _brockerProcessorMock;

    public ServiceWorkerTests()
    {
        _loggerMock = new Mock<ILogger<ServiceWorker>>();
        _brockerProcessorMock = new Mock<IBrockerProcessor>();
    }

    [Fact]
    public void ServiceWorker_Constructor_ShouldInitialize()
    {
        // Act
        var worker = new ServiceWorker(
            _loggerMock.Object,
            _brockerProcessorMock.Object
        );

        // Assert
        worker.Should().NotBeNull();
    }

    [Fact]
    public void ServiceWorker_StartService_ShouldCallStartRecived()
    {
        // Arrange
        var worker = new ServiceWorker(
            _loggerMock.Object,
            _brockerProcessorMock.Object
        );

        // Act
        worker.StartService();

        // Assert
        _brockerProcessorMock.Verify(
            x => x.StartRecived(),
            Times.Once
        );
    }
}
