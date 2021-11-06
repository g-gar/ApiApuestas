using framework;

namespace dto{
    public class CreateBetDto : Dto {
        public int EventId { get; set; }
        public double Amount { get; set; }
        public int Winner { get; set; }
        public int UserId { get; set; }
    }
}