using core.repository;
using dto;
using framework;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class CreateTransactionCommand : Command<CreateTransactionDto, int>{

        private readonly ITransactionRepository _transactionRepository;

        public CreateTransactionCommand(ITransactionRepository transactionRepository, ILogger logger) : base(logger)
        {
            _transactionRepository = transactionRepository;
        }
        
        protected override int execute(CreateTransactionDto dto) => _transactionRepository.create(dto.UserId, dto.Type, dto.Amount);
        public override bool checkPreconditions(CreateTransactionDto dto) => true;
    }
}