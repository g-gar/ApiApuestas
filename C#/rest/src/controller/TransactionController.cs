using System.ComponentModel;
using core;
using dto;
using framework;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    [ApiController]
    [Route("/api/transaccion/")]
    public class TransactionController : ControllerBase{
        private readonly Command<CreateTransactionDto, int> createTransactionCommand;

        public TransactionController(Command<CreateTransactionDto, int> createTransactionCommand)
        {
            this.createTransactionCommand = createTransactionCommand;
        }

        [HttpPost]
        [Route("/")]
        public IActionResult create(CreateTransactionDto dto) => Ok(createTransactionCommand.executeCommand(dto)) ?? Problem();

    }
}