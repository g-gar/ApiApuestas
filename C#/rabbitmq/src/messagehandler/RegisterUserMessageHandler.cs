using System;
using core;
using dto;
using framework;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace rabbitmq.messagehandler{
    public class RegisterUserMessageHandler : AbstractRabbitMessageHandler {
        
        private readonly Command<CreateUserDto> command;

        public RegisterUserMessageHandler(ILogger logger, Command<CreateUserDto> commandFacade) : base(logger)
        {
            this.command = commandFacade;
        }

        public override void execute(Payload payload) => this.command.executeCommand(JsonConvert.DeserializeObject<CreateUserDto>(payload.Body) ?? throw new InvalidOperationException());
        
    }
}