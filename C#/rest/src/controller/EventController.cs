using System.Data;
using core;
using dto;
using framework;
using Microsoft.AspNetCore.Mvc;

namespace ApiApuestas.controller{
    
    [ApiController]
    [Route("/api/evento/{event_id}/")]
    public class EventController : ControllerBase{

        private readonly Command<AddPlayerDto> addPlayerCommand;
        private readonly Command<CreateEventDto> createEventCommand;
        private readonly Command<TerminateEventDto> terminateEventCommand;
        private readonly Command<CreateBetDto> createBetCommand;

        public EventController(Command<AddPlayerDto> addPlayerCommand, Command<CreateEventDto> createEventCommand, Command<TerminateEventDto> terminateEventCommand, Command<CreateBetDto> createBetCommand)
        {
            this.addPlayerCommand = addPlayerCommand;
            this.createEventCommand = createEventCommand;
            this.terminateEventCommand = terminateEventCommand;
            this.createBetCommand = createBetCommand;
        }

        [HttpPost]
        [Route("/asignar_participante/")]
        public IActionResult addPlayer(AddPlayerDto dto) => Ok(addPlayerCommand.executeCommand(dto)) ?? Problem();

        [HttpPost]
        [Route("~/api/evento/")]
        public IActionResult createEvent(CreateEventDto dto) => Ok(createEventCommand.executeCommand(dto)) ?? Problem();

        [HttpPost]
        [Route("/terminar/")]
        public IActionResult terminateEvent(TerminateEventDto dto) => Ok(terminateEventCommand.executeCommand(dto)) ?? Problem();

        [HttpPost]
        [Route("/apostar/")]
        public IActionResult bet(CreateBetDto dto) => Ok(createBetCommand.executeCommand(dto)) ?? Problem();

    }
}