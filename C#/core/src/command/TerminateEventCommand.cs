using core.repository;
using dto;
using framework;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class TerminateEventCommand : Command<TerminateEventDto>{

        private readonly IEventRepository _eventRepository;

        public TerminateEventCommand(IEventRepository eventRepository, ILogger logger) : base(logger)
        {
            _eventRepository = eventRepository;
        }
        protected override void execute(TerminateEventDto dto) => _eventRepository.terminateEvent(dto.EventId, dto.WinnerId );
        public override bool checkPreconditions(TerminateEventDto dto) => true;
    }
}