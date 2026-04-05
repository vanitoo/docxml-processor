using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using ProcessingCommon.Constants;
using ProcessingCommon.Models.Messages;
using ProcessingCommon.Models.Settings;
using ProcessingCommon.Services;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using XsltProcessor.Processing;

namespace XsltProcessor.Services;

public class XsltRabbitMqProcessor : RabbitMqProcessor
{
    public XsltRabbitMqProcessor(IOptions<RabbitSettings> settings, ILogger<RabbitMqProcessor> logger) : base(settings,
        logger)
    { }

    protected override void ProcessingMessage(byte[] body, ulong tag)
    {
        Guid? processId = null;
        _logger.LogInformation($"Обработка принятого сообщения: ({DateTime.Now})");
        var message = Encoding.UTF8.GetString(body);
        try
        {
            var documentProcessor = new DocumentProcessing(_logger);
            MessageConvert messageConvert = JsonSerializer.Deserialize<MessageConvert>(message)!;
            XsltProcessingMessageModel messageData = JsonSerializer.Deserialize<XsltProcessingMessageModel>(messageConvert.Data)!;
            processId = messageData.ProcessDocumentId;
            DateTime start = DateTime.Now;
            var results = documentProcessor.Processing(messageData);
            DateTime end = DateTime.Now;
            var resultMessage = new MessageConvert()
            {
                MessageType = MessageTypes.MessageXslt,
                Data = JsonSerializer.Serialize(new ResultHtmlMessageModel()
                {
                    ProcessDocumentId = messageData.ProcessDocumentId,
                    Htmls = results.ToList(),
                    ProcessingTime = (end - start).TotalSeconds
                })
            };
            bool sendMessageToPdf = SendMessage(resultMessage, BrockerNames.PdfProcessName, BrockerNames.PdfRoutingKey);
            bool sendMessageToApi = SendMessage(resultMessage, BrockerNames.ApiProcessName, BrockerNames.ApiRoutingKey);
            if (sendMessageToApi == false)
            {
                sendMessageToApi = SendMessage(resultMessage, BrockerNames.ApiProcessName, BrockerNames.ApiRoutingKey);
            }

            if (sendMessageToPdf == false)
            {
                sendMessageToPdf = SendMessage(resultMessage, BrockerNames.PdfProcessName, BrockerNames.PdfRoutingKey);
            }

            if (sendMessageToPdf && sendMessageToApi)
            {
                _logger.LogInformation($"Сообщение {messageData.ProcessDocumentId} обработано: ({DateTime.Now})");
            }
            else
            {
                _logger.LogError($"Ошибка при обработке сообщения: {messageData.ProcessDocumentId}: ({DateTime.Now})");
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
            Guid errorId = Guid.NewGuid();
            var resultMessage = new MessageConvert()
            {
                MessageType = MessageTypes.MessageError,
                Data = JsonSerializer.Serialize(new ErrorModel()
                {
                    ProcessId = processId,
                    ErrorId = errorId,
                    Message = ex.ToString()
                })
            };
            _logger.LogError($"Ошибка при обработке сообщения: {ex.Message}");
            bool sendMessageToApi = SendMessage(resultMessage, BrockerNames.ApiProcessName, BrockerNames.ApiRoutingKey);
            if (sendMessageToApi == false)
            {
                sendMessageToApi = SendMessage(resultMessage, BrockerNames.ApiProcessName, BrockerNames.ApiRoutingKey);
            }

            if (sendMessageToApi == false)
            {
                _logger.LogError($"Не удалось отправить уведомление об ошибке {errorId.ToString()}.");
            }
        }
        ConfirmMessage(tag);
    }

    protected override void InitSendData()
    {
        var queueNameXmlProcessorApi = _channelSend.QueueDeclare(queue: BrockerNames.ApiProcessName, durable: true,
            exclusive: false, autoDelete: false, arguments: null).QueueName;
        _channelSend.ExchangeDeclare(exchange: BrockerNames.ApiProcessName, type: ExchangeType.Direct,
            durable: true, autoDelete: false);
        _channelSend.QueueBind(queue: queueNameXmlProcessorApi, exchange: BrockerNames.ApiProcessName, routingKey: BrockerNames.ApiRoutingKey);

        var queueNamePdfProcessor = _channelSend.QueueDeclare(queue: BrockerNames.PdfProcessName, durable: true,
            exclusive: false, autoDelete: false, arguments: null).QueueName;
        _channelSend.ExchangeDeclare(exchange: BrockerNames.PdfProcessName, type: ExchangeType.Direct,
            durable: true, autoDelete: false);
        _channelSend.QueueBind(queue: queueNamePdfProcessor, exchange: BrockerNames.PdfProcessName, routingKey: BrockerNames.PdfRoutingKey);
    }

    protected override void InitReciveData()
    {
        _channelRecive.QueueDeclare(queue: BrockerNames.XsltProcessName, durable: true,
            exclusive: false, autoDelete: false, arguments: null);

        var consumer = new AsyncEventingBasicConsumer(_channelRecive);
        consumer.Received += async (sender, e) =>
        {
            var body = e.Body.ToArray();
            Task.Factory.StartNew(() => ProcessingMessage(body, e.DeliveryTag));
            await Task.Yield();
        };
        _channelRecive.BasicConsume(queue: BrockerNames.XsltProcessName, autoAck: false, consumer: consumer);
    }
}
