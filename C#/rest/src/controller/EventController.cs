using System.Data;
using core;
using dto;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    
    [ApiController]
    [Route("/api/evento/{event_id}/")]
    public class EventController : ControllerBase{

        private readonly CommandFacade _commandFacade;

        public EventController(CommandFacade commandFacade)
        {
            _commandFacade = commandFacade;
        }

        [HttpPost]
        [Route("/asignar_participante/")]
        public IActionResult addPlayer(AddPlayerDto dto)
        {
            IActionResult result = Ok();
            
            _commandFacade.addPlayer(dto.EventId, dto.Quota, dto.Position);
            
            return result;
        }

        [HttpPost]
        [Route("~/api/evento/")]
        public IActionResult createEvent(CreateEventDto dto)
        {
            IActionResult result = Ok();

            _commandFacade.createEvent(dto.Type, dto.Description, dto.Date);
            
            return result;
        } 

        [HttpPost]
        [Route("/terminar/")]
        public IActionResult terminateEvent(TerminateEventDto dto)
        {
            IActionResult result = Ok();

            _commandFacade.terminateEvent(dto.EventId, dto.WinnerId);
            
            return result;
        }

        [HttpPost]
        [Route("/apostar/")]
        public IActionResult bet(CreateBetDto dto)
        {
            IActionResult result = Ok();

            _commandFacade.bet(dto.EventId, dto.UserId, dto.Amount, dto.Winner);
            
            return result;
        }
        
    }
}