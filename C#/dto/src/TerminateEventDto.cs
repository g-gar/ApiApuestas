using framework;

namespace dto{
    public class TerminateEventDto : Dto {
        public int EventId { get; set; }
        public int WinnerId { get; set; }
    }
}