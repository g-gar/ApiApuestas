using core;
using dto;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    [ApiController]
    [Route("/api/user/")]
    public class UserController : ControllerBase {
        
        private readonly CommandFacade _commandFacade;

        public UserController(CommandFacade commandFacade)
        {
            _commandFacade = commandFacade;
        }

        [HttpPost]
        [Route("/")]
        public IActionResult create(CreateUserDto dto)
        {
            IActionResult result = Ok();

            _commandFacade.register(dto.Username, dto.Dni, dto.Password);

            return result;
        }

        [HttpPost]
        [Route("/auth/")]
        public IActionResult authenticate(AuthenticateUserDto dto)
        {
            IActionResult result = Ok();

            bool valid = _commandFacade.authenticate(dto.Username, dto.Password);

            return result;
        }
    }
}