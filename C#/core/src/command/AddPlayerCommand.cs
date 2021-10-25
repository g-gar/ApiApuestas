
using core.repository;
using dto;
using framework;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class AddPlayerCommand : Command<AddPlayerDto> {

        private readonly IEventRepository _eventRepository;

        public AddPlayerCommand(IEventRepository eventRepository, ILogger logger) : base(logger)
        {
            _eventRepository = eventRepository;
        }
        protected override void execute(AddPlayerDto dto) => _eventRepository.addPlayer(dto.EventId, dto.Quota, dto.Position);
        public override bool checkPreconditions(AddPlayerDto dto) => true;
    }
}