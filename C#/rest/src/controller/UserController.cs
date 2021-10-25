using core;
using dto;
using framework;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    [ApiController]
    [Route("/api/user/")]
    public class UserController : ControllerBase{

        private readonly Command<CreateUserDto> createUserCommand;
        private readonly Command<AuthenticateUserDto, bool> authenticateUserCommand;
        
        public UserController(Command<CreateUserDto> createUserCommand, Command<AuthenticateUserDto, bool> authenticateUserCommand)
        {
            this.createUserCommand = createUserCommand;
            this.authenticateUserCommand = authenticateUserCommand;
        }

        [HttpPost]
        [Route("/")]
        public IActionResult create(CreateUserDto dto) => Ok(createUserCommand.executeCommand(dto)) ?? Problem();

        [HttpPost]
        [Route("/auth/")]
        public IActionResult authenticate(AuthenticateUserDto dto)
        {
            return Ok(authenticateUserCommand.executeCommand(dto)) ?? Problem("invalid authentication details");
        }
    }
}