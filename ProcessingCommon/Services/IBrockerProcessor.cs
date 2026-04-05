using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using ProcessingCommon.Constants;
using ProcessingCommon.Models.Messages;
using ProcessingCommon.Models.Settings;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace ProcessingCommon.Services;

public interface IBrockerProcessor
{
    bool SendMessage<T>(T data, string exchange, string routing);
    void StartRecived();
}

public abstract class RabbitMqProcessor : IBrockerProcessor
{
    protected readonly ILogger<RabbitMqProcessor> _logger;
    private readonly RabbitSettings _settings;
    protected IConnection _connection;
    protected IModel _channelRecive;
    protected IModel _channelSend;
    private readonly ushort _messagePrefetchCount = 10;

    public RabbitMqProcessor(IOptions<RabbitSettings> settings, ILogger<RabbitMqProcessor> logger)
    {
        _settings = settings.Value;
        _logger = logger;
    }


    protected abstract void ProcessingMessage(byte[] body, ulong tag);
    protected abstract void InitSendData();
    protected abstract void InitReciveData();

    public bool SendMessage<T>(T data, string exchange, string routing)
    {
        var messageBody = Encoding.UTF8.GetBytes(
            JsonSerializer.Serialize(data, JsonSerializerOptions.Default));
        if (_channelSend.IsOpen && _connection.IsOpen)
        {
            lock (_channelSend)
            {
                _channelSend.BasicPublish(exchange: exchange, routingKey: routing,
                    basicProperties: null, body: messageBody);
            }
            return true;
        }
        else
        {
            CreateConnectionAndChannels();
            return false;
        }
    }

    public void ConfirmMessage(ulong tag)
    {
        lock (_channelRecive)
        {
            _channelRecive.BasicAck(tag, false);
        }
    }

    public void StartRecived()
    {
        CreateConnectionAndChannels();
    }

    public void Dispose()
    {
        _channelRecive.Close();
        _channelSend.Close();
        _connection.Close();
    }

    protected void CreateConnectionAndChannels()
    {
        var factory = new ConnectionFactory()
        {
            UserName = _settings.UserName,
            Password = _settings.UserPassword,
            HostName = _settings.Connection,
            DispatchConsumersAsync = true
        };

        if (_connection == null)
        {
            _connection = factory.CreateConnection();
        }
        else if (_connection.IsOpen == false)
        {
            _channelSend.Close();
            _channelRecive.Close();
            _connection.Close();
            _connection = factory.CreateConnection();
        }

        if (_channelSend == null)
        {
            _channelSend = _connection.CreateModel();
            InitSendData();
        }
        else if (_channelSend.IsOpen == false)
        {
            _channelSend.Close();
            _channelSend = _connection.CreateModel();
            InitSendData();
        }

        if (_channelRecive == null)
        {
            _channelRecive = _connection.CreateModel();
            _channelRecive.BasicQos(0, _messagePrefetchCount, false);
            InitReciveData();
        }
        else if (_channelRecive.IsOpen == false)
        {
            _channelRecive.Close();
            _channelRecive = _connection.CreateModel();
            _channelRecive.BasicQos(0, _messagePrefetchCount, false);
            InitReciveData();
        }
    }
}
