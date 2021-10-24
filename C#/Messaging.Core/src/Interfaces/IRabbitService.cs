using System;
using System.Collections.Generic;
using Messaging.Core.Models;

namespace Messaging.Core.Interfaces{
    public interface IRabbitService {
        void Publish(IEnumerable<Payload> payloads, string exchange, string routingKey = "", string type = "fanout", bool durable = false);
        void Get(string exchange, string queue, IRabbitMessageHandler messageHandler, string routingKey = "", string type = "fanout", bool durable = false);
        Guid Subscribe(string exchange, string queue, IRabbitMessageHandler messageHandler, string routingKey = "", string type = "fanout", bool durable = false, ushort? qos = null);
        void Unsubscribe(Guid consumerId);
    }
}