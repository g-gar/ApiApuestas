using System;
using System.Collections.Generic;
using System.Reflection;
using System.Threading;
using core;
using Messaging.Core.Interfaces;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using rabbitmq.model;

namespace rabbitmq{
    public class EntryPoint{
        
        private readonly ILogger _logger;
        private readonly IRabbitService _rabbitService;

        public EntryPoint(IRabbitService rabbitService, ILogger logger)
        {
            _rabbitService = rabbitService;
            _logger = logger;
        }

        public void Start()
        {
            new Thread(() =>
            {
                while (true)
                {
                    Payload payload = new Payload()
                    {
                        Body = $"test {DateTime.Now}"
                    };
                    _logger.LogInformation($"Publishing payload[{payload}] to exchange=APExchange with direct routing and key=event.AddPlayer");
                    _rabbitService.Publish(new List<Payload>(){payload}, "APexchange", "event.addPlayer", type: "direct", durable: true);
                    _logger.LogInformation($"Published payload[{payload}] to exchange=APExchange with direct routing and key=event.AddPlayer");
                    Console.WriteLine(payload.ToString());
                    Thread.Sleep(1000);
                }
            }).Start();
        }

        public EntryPoint registerConsumer(params ConsumerConfiguration[] consumerConfigurations)
        {
            foreach (ConsumerConfiguration c in consumerConfigurations)
            {
                _rabbitService.Subscribe(c.exchange, c.queue, c.handler, c.routingKey, c.type, c.durable);
            }

            return this;
        }
    }
}