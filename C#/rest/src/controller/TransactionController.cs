using core;
using dto;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    [ApiController]
    [Route("/api/transaccion/")]
    public class TransactionController : ControllerBase {

        private readonly CommandFacade _commandFacade;

        public TransactionController(CommandFacade commandFacade)
        {
            _commandFacade = commandFacade;
        }
        
        [HttpPost]
        [Route("/")]
        public IActionResult create(CreateTransactionDto dto)
        {
            IActionResult result = Ok();

            int transactionId = _commandFacade.createTransaction(dto.UserId, dto.Type, dto.Amount);

            return result;
        }
        
    }
}