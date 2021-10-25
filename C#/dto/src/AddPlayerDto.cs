using framework;

namespace dto{
    public class AddPlayerDto : Dto {
        public int EventId { get; set; }
        public double Quota { get; set; }
        public int Position { get; set; }
    }
}