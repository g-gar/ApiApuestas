using System;
using System.Collections.Generic;
using System.Threading;
using Messaging.Core.Interfaces;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using test.model;

namespace rabbitmq{
    public class EntryPoint{
        private readonly ILogger _logger;
        private readonly IRabbitService _rabbitService;
        private readonly object _lock;
        private int _counter;

        public EntryPoint(IRabbitService rabbitService, ILogger logger)
        {
            _rabbitService = rabbitService;
            _logger = logger;
            _lock = new object();
            _counter = 0;
        }

        public void Start()
        {
            _rabbitService.Subscribe("APexchange", "addPlayer", new LogPayloadsRabbitMessageHandler(_logger), "event.addPlayer", "direct", durable:true);
            new Thread(() =>
            {
                Console.WriteLine(2);
                while (true)
                {
                    string messageId;
                    lock (_lock)
                    {
                        messageId = $"message{_counter++}";
                    }
                    Payload payload = new Payload()
                    {
                        Body = $"test {DateTime.Now}",
                        MessageId = messageId
                    };
                    _logger.LogInformation($"Publishing payload[{payload}] to exchange=APExchange with direct routing and key=event.AddPlayer");
                    _rabbitService.Publish(new List<Payload>(){payload}, "APexchange", "event.addPlayer", type: "direct", durable: true);
                    _logger.LogInformation($"Published payload[{payload}] to exchange=APExchange with direct routing and key=event.AddPlayer");
                    // Console.WriteLine($"{payload}");
                    Thread.Sleep(10);
                }
            }).Start();
        }
    }
}