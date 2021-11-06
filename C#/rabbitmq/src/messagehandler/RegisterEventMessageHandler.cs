using System;
using core;
using dto;
using framework;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace rabbitmq.messagehandler {
    public class RegisterEventMessageHandler : AbstractRabbitMessageHandler {
        private readonly Command<CreateEventDto> command;

        public RegisterEventMessageHandler(ILogger logger, Command<CreateEventDto> command) : base(logger)
        {
            this.command = command;
        }

        public override void execute(Payload payload) => this.command.executeCommand(JsonConvert.DeserializeObject<CreateEventDto>(payload.Body) ?? throw new InvalidOperationException());
    }
}