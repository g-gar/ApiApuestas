using core.repository;
using dto;
using framework;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class CreateEventCommand : Command<CreateEventDto>{
        
        private readonly IEventRepository _eventRepository;

        public CreateEventCommand(IEventRepository eventRepository, ILogger logger) : base(logger)
        {
            _eventRepository = eventRepository;
        }
        
        protected override void execute(CreateEventDto dto) => _eventRepository.createEvent(dto.Type, dto.Description, dto.Date);
        public override bool checkPreconditions(CreateEventDto dto) => true;
    }
}