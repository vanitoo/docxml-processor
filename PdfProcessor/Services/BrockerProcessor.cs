using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using PdfProcessor.Processing;
using ProcessingCommon.Constants;
using ProcessingCommon.Models.Messages;
using ProcessingCommon.Models.Settings;
using ProcessingCommon.Services;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace PdfProcessor.Services;

public class PdfRabbitMqProcessor : RabbitMqProcessor
{
    public PdfRabbitMqProcessor(IOptions<RabbitSettings> settings, ILogger<RabbitMqProcessor> logger) : base(settings,
        logger)
    {
    }

    protected override void ProcessingMessage(byte[] body, ulong tag)
    {
        Guid? processId = null;
        _logger.LogInformation($"Обработка принятого сообщения: ({DateTime.Now})");
        var message = Encoding.UTF8.GetString(body);
        try
        {
            var pdfProcessor = new PdfProcessing();
            MessageConvert messageConvert = JsonSerializer.Deserialize<MessageConvert>(message)!;
            ResultHtmlMessageModel messageData = JsonSerializer.Deserialize<ResultHtmlMessageModel>(messageConvert.Data)!;
            processId = messageData.ProcessDocumentId;
            List<byte[]> results = new();
            DateTime start = DateTime.Now;
            foreach (var html in messageData.Htmls)
            {
                results.Add(pdfProcessor.Processing(html));
            }
            DateTime end = DateTime.Now;

            var resultMessage = new MessageConvert()
            {
                MessageType = MessageTypes.MessagePdf,
                Data = JsonSerializer.Serialize(new ResultPdfMessageModel()
                {
                    ProcessDocumentId = messageData.ProcessDocumentId,
                    Pdfs = results.ToList(),
                    ProcessingTime = (end - start).TotalSeconds
                })
            };

            bool sendMessageToApi = SendMessage(resultMessage, BrockerNames.ApiProcessName, BrockerNames.ApiRoutingKey);
            if (sendMessageToApi == false)
            {
                sendMessageToApi = SendMessage(resultMessage, BrockerNames.ApiProcessName, BrockerNames.ApiRoutingKey);
            }

            if (sendMessageToApi)
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
            _logger.LogError($"Ошибка при обработке сообщения {errorId.ToString()}: {ex.Message}");
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
        _channelSend.QueueBind(queue: queueNameXmlProcessorApi, exchange: BrockerNames.ApiProcessName,
            routingKey: BrockerNames.ApiRoutingKey);
    }

    protected override void InitReciveData()
    {
        _channelRecive.QueueDeclare(queue: BrockerNames.PdfProcessName, durable: true,
            exclusive: false, autoDelete: false, arguments: null);

        var consumer = new AsyncEventingBasicConsumer(_channelRecive);
        consumer.Received += async (sender, e) =>
        {
            var body = e.Body.ToArray();
            Task.Factory.StartNew(() => ProcessingMessage(body, e.DeliveryTag));
            await Task.Yield();
        };
        _channelRecive.BasicConsume(queue: BrockerNames.PdfProcessName, autoAck: false, consumer: consumer);
    }
}
