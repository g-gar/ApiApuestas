using ApiApuestas.model;
using core;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    [ApiController]
    [Route("/api/user/")]
    public class UserController : ControllerBase {
        
        private readonly BetFacade _betFacade;

        public UserController(BetFacade betFacade)
        {
            _betFacade = betFacade;
        }

        [HttpPost]
        [Route("/")]
        public IActionResult create([FromBody] CreateUserDto requestDto)
        {
            IActionResult result = Ok();

            _betFacade.register(requestDto.username, requestDto.dni, requestDto.password);

            return result;
        }
    }
}