using System.Data;
using ApiApuestas.model;
using core;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    
    [ApiController]
    [Route("/api/evento/{event_id}/")]
    public class EventController : ControllerBase{

        private readonly BetFacade _betFacade;

        public EventController(BetFacade betFacade)
        {
            _betFacade = betFacade;
        }

        [HttpPost]
        [Route("/asignar_participante/")]
        public IActionResult addPlayer([FromRoute] int eventId, [FromBody] AddPlayerDto requestDto)
        {
            IActionResult result = Ok();
            
            _betFacade.addPlayer(eventId, requestDto.quota, requestDto.position);
            
            return result;
        }

        [HttpPost]
        [Route("~/api/evento/")]
        public IActionResult createEvent([FromBody] CreateEventDto requestDto)
        {
            IActionResult result = Ok();

            _betFacade.createEvent(requestDto.type, requestDto.description, requestDto.date);
            
            return result;
        } 

        [HttpPost]
        [Route("/terminar/")]
        public IActionResult terminateEvent([FromRoute] int eventId, [FromBody] int playerId)
        {
            IActionResult result = Ok();

            _betFacade.terminateEvent(eventId, playerId);
            
            return result;
        }

        [HttpPost]
        [Route("/apostar/")]
        public IActionResult bet([FromRoute] int eventId, [FromBody] BetDto betDto)
        {
            IActionResult result = Ok();

            _betFacade.bet(eventId, betDto.playerId, betDto.amount, betDto.winner);
            
            return result;
        }
        
    }
}