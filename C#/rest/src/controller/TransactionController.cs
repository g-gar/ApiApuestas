using ApiApuestas.model;
using core;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    [ApiController]
    [Route("/api/transaccion/")]
    public class TransactionController : ControllerBase {

        private readonly BetFacade _betFacade;

        public TransactionController(BetFacade betFacade)
        {
            _betFacade = betFacade;
        }
        
        [HttpPost]
        [Route("/")]
        public IActionResult create([FromBody] CreateTransactionDto requestDto)
        {
            IActionResult result = Ok();

            int transactionId = _betFacade.createTransaction(requestDto.userId, requestDto.type, requestDto.amount);

            return result;
        }
        
    }
}