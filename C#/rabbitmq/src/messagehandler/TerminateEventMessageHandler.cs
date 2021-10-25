using System;
using core;
using dto;
using framework;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace rabbitmq.messagehandler{
    public class TerminateEventMessageHandler : AbstractRabbitMessageHandler {
        private readonly Command<TerminateEventDto> command;

        public TerminateEventMessageHandler(ILogger logger, Command<TerminateEventDto> command) : base(logger)
        {
            this.command = command;
        }

        public override void execute(Payload payload) => this.command.executeCommand(JsonConvert.DeserializeObject<TerminateEventDto>(payload.Body) ?? throw new InvalidOperationException());
    }
}