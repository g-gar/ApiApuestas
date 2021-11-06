using System;
using core;
using dto;
using framework;
using Messaging.Core.Models;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using RabbitMQ.Client.Impl;

namespace rabbitmq.messagehandler {
    public class AddPlayerMessageHandler : AbstractRabbitMessageHandler{

        private readonly Command<AddPlayerDto> _command;

        public AddPlayerMessageHandler(ILogger logger, Command<AddPlayerDto> command) : base(logger)
        {
            _command = command;
        }

        public override void execute(Payload payload) => _command.executeCommand(JsonConvert.DeserializeObject<AddPlayerDto>(payload.Body) ?? throw new InvalidOperationException());
    }
}