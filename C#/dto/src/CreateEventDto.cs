using framework;

namespace dto{
    public class CreateEventDto : Dto {
        public int Type { get; set; }
        public string Description { get; set; }
        public object Date { get; set; } //TODO: change to datetime object
    }
}