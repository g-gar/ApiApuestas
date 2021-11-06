using System;
using core;
using dto;
using framework;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace rabbitmq.messagehandler{
    public class CreateBetMessageHandler : AbstractRabbitMessageHandler {
        
        private readonly Command<CreateBetDto> command;

        public CreateBetMessageHandler(ILogger logger, Command<CreateBetDto> command) : base(logger)
        {
            this.command = command;
        }

        public override void execute(Payload payload) => this.command.executeCommand(JsonConvert.DeserializeObject<CreateBetDto>(payload.Body) ?? throw new InvalidOperationException());
        
    }
}