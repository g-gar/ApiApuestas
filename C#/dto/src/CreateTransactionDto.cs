using framework;

namespace dto{
    public class CreateTransactionDto : Dto {
        public int UserId { get; set; }
        public int Type { get; set; }
        public double Amount { get; set; }
    }
}