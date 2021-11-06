using core.repository;
using dto;
using framework;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class CreateBetCommand : Command<CreateBetDto> {

        private readonly IEventRepository _eventRepository;

        public CreateBetCommand(IEventRepository eventRepository, ILogger logger) : base(logger)
        {
            _eventRepository = eventRepository;
        }
        
        protected override void execute(CreateBetDto dto) => _eventRepository.createBet(dto.EventId, dto.UserId, dto.Amount, dto.Winner);
        public override bool checkPreconditions(CreateBetDto dto) => true;
    }
}