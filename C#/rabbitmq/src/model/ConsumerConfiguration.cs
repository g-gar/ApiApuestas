using Messaging.Core.Interfaces;

namespace rabbitmq.model{
    public class ConsumerConfiguration{
        public string exchange { get; set; }
        public string queue { get; set; }
        public string routingKey { get; set; }
        public bool durable { get; set; }
        public string type { get; set; }
        public IRabbitMessageHandler handler { get; set; }
    }
}