using System;
using System.Buffers.Text;
using core.repository;
using Messaging.Core.Interfaces;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class AddPlayerCommand : Command {

        private readonly IEventRepository _eventRepository;
        private readonly int _eventId, _position;
        private readonly double _quota;

        public AddPlayerCommand(IEventRepository eventRepository, ILogger logger, int eventId, double quota, int position) : base(logger)
        {
            _eventRepository = eventRepository;
            _eventId = eventId;
            _quota = quota;
            _position = position;
        }

        protected override void beginExecute() => base.beginExecute(LogLevel.Information, _startTemplate, _eventId, _quota, _position);
        protected override void endExecute() => base.endExecute(LogLevel.Information, _endTemplate, _eventId, _quota, _position);
        protected override void execute() => _eventRepository.addPlayer(_eventId, _quota, _position);
        public override bool checkPreconditions() => true;
    }
}