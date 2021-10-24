﻿using System;
using System.Collections.Generic;
using System.Text;
using Messaging.Core.Interfaces;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace test.model{
    public class LogPayloadsRabbitMessageHandler : IRabbitMessageHandler{
        
        private readonly ILogger _logger;
        public List<Payload> Payloads { get; set; }
        
        public LogPayloadsRabbitMessageHandler(ILogger logger)
        {
            _logger = logger;
            Payloads = new List<Payload>();
        }
        public void Handle(BasicGetResult result)
        {
            ProcessPayload(new Payload()
            {
                Body = Encoding.UTF8.GetString(result.Body),
                MessageId = result.BasicProperties.MessageId,
                CorrelationId = result.BasicProperties.CorrelationId,
                ReplyTo = result.BasicProperties.ReplyTo
            });
        }

        public void Handle(object model, BasicDeliverEventArgs result)
        {
            ProcessPayload(new Payload()
            {
                Body = Encoding.UTF8.GetString(result.Body),
                MessageId = result.BasicProperties.MessageId,
                CorrelationId = result.BasicProperties.CorrelationId,
                ReplyTo = result.BasicProperties.ReplyTo
            });
        }

        public void ProcessPayload(Payload payload)
        {
            Payloads.Add(payload);
            _logger.LogInformation($"Received payload {payload}");
        }
    }
}