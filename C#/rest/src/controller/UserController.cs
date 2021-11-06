using core;
using dto;
using framework;
using framework.extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using rest;

namespace ApiApuestas.controller{
    [ApiController]
    [Route("/api/user/")]
    public class UserController : ControllerBase{

        private readonly ILogger<Program> logger;
        private readonly Command<CreateUserDto> createUserCommand;
        private readonly Command<AuthenticateUserDto, bool> authenticateUserCommand;
        
        public UserController(Command<CreateUserDto> createUserCommand, Command<AuthenticateUserDto, bool> authenticateUserCommand, ILogger<Program> logger)
        {
            this.createUserCommand = createUserCommand;
            this.authenticateUserCommand = authenticateUserCommand;
            this.logger = logger;
        }

        [HttpPost]
        public IActionResult create([FromBody] CreateUserDto dto)
        {
            return Ok(createUserCommand.executeCommand(dto)) ?? Problem("Invalid user details");
        }

        [HttpPost]
        [Route("/auth/")]
        public IActionResult authenticate(AuthenticateUserDto dto)
        {
            return Ok(authenticateUserCommand.executeCommand(dto)) ?? Problem("invalid authentication details");
        }
    }
}