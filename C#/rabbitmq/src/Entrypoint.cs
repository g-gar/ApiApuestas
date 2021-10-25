using System;
using System.Collections.Generic;
using System.Threading;
using core;
using Messaging.Core.Interfaces;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;

namespace rabbitmq{
    public class EntryPoint{

        private readonly CommandFacade _commandFacade;
        private readonly ILogger _logger;
        private readonly IRabbitService _rabbitService;

        public EntryPoint(IRabbitService rabbitService, ILogger logger, CommandFacade commandFacade)
        {
            _rabbitService = rabbitService;
            _logger = logger;
            _commandFacade = commandFacade;
        }

        public EntryPoint Consume(string exchange, string queue, IRabbitMessageHandler handler, string routingKey, string type, bool durable)
        {
            _rabbitService.Subscribe(exchange, queue, handler, routingKey, type, durable);
            return this;
        }

        public void Start()
        {
            new Thread(() =>
            {
                while (true)
                {
                    // string messageId;
                    // lock (_lock)
                    // {
                    //     messageId = $"message{_counter++}";
                    // }
                    // Payload payload = new Payload()
                    // {
                    //     Body = $"test {DateTime.Now}",
                    //     MessageId = messageId
                    // };
                    // _logger.LogInformation($"Publishing payload[{payload}] to exchange=APExchange with direct routing and key=event.AddPlayer");
                    // _rabbitService.Publish(new List<Payload>(){payload}, "APexchange", "event.addPlayer", type: "direct", durable: true);
                    // _logger.LogInformation($"Published payload[{payload}] to exchange=APExchange with direct routing and key=event.AddPlayer");
                    // // Console.WriteLine($"{payload}");
                    Thread.Sleep(10);
                }
            }).Start();
        }
    }
}