using System.Text;
using System.Text.Json;
using DocumentXmlProcessorAPI.Processing;
using DocumentXmlProcessorContext.Context;
using Microsoft.Extensions.Options;
using ProcessingCommon.Constants;
using ProcessingCommon.Models.Messages;
using ProcessingCommon.Models.Settings;
using ProcessingCommon.Services;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace DocumentXmlProcessorAPI.Services;
public class ApiRabbitMqProcessor : RabbitMqProcessor
{
    private readonly IServiceScopeFactory _scopeFactory;

    public ApiRabbitMqProcessor(ILogger<RabbitMqProcessor> logger,
        IOptions<RabbitSettings> settings, IServiceScopeFactory scopeFactory)
        : base(settings, logger)
    {
        _scopeFactory = scopeFactory;
    }

    protected override void ProcessingMessage(byte[] body, ulong tag)
    {
        _logger.LogInformation($"Обработка принятого сообщения: ({DateTime.Now})");
        var message = Encoding.UTF8.GetString(body);
        try
        {
            using (var scope = _scopeFactory.CreateScope())
            {
                var processingFileService = scope.ServiceProvider.GetRequiredService<IProcessingFileService>();
                var context = scope.ServiceProvider.GetRequiredService<DocumentProcessorContext>();
                var processing = new ProcessingMessages(_logger, processingFileService, context);
                MessageConvert messageConvert = JsonSerializer.Deserialize<MessageConvert>(message)!;
                var result = processing.Processing(messageConvert);
                if (result)
                {
                    _logger.LogInformation($"Сообщение {messageConvert.MessageType} обработано: ({DateTime.Now})");
                }
                else
                {
                    _logger.LogError($"Ошибка при обработке сообщения: {messageConvert.MessageType}: ({DateTime.Now})");
                }
            }
        }
        catch (IOException ex)
        {
            _logger.LogError($"IO Error: {ex.Message}");
            if (_connection.IsOpen == false)
            {
                CreateConnectionAndChannels();
            }
        }
        catch (Exception ex)
        {
            _logger.LogError($"Ошибка при обработке сообщения: {ex.Message}");
        }
        ConfirmMessage(tag);
    }

    protected override void InitSendData()
    {
        var queueName = _channelSend.QueueDeclare(queue: BrockerNames.XsltProcessName, durable: true,
            exclusive: false, autoDelete: false, arguments: null).QueueName;
        _channelSend.ExchangeDeclare(exchange: BrockerNames.XsltProcessName, type: ExchangeType.Direct,
            durable: true, autoDelete: false);
        _channelSend.QueueBind(queue: queueName, exchange: BrockerNames.XsltProcessName,
            routingKey: BrockerNames.XsltRoutingKey);
    }

    protected override void InitReciveData()
    {
        _channelRecive.QueueDeclare(queue: BrockerNames.ApiProcessName, durable: true,
            exclusive: false, autoDelete: false, arguments: null);

        var consumer = new AsyncEventingBasicConsumer(_channelRecive);
        consumer.Received += async (sender, e) =>
        {
            var body = e.Body.ToArray();
            Task.Factory.StartNew(() => ProcessingMessage(body, e.DeliveryTag));
            await Task.Yield();
        };
        _channelRecive.BasicConsume(queue: BrockerNames.ApiProcessName, autoAck: false, consumer: consumer);
    }
}
