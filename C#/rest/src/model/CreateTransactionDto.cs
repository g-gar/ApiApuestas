namespace ApiApuestas.model{
    public class CreateTransactionDto{
        public int userId { get; set; }
        public int type { get; set; }
        public double amount { get; set; }
    }
}