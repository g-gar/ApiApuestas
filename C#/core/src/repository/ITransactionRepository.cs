namespace core.repository{
    public interface ITransactionRepository{
        public int create(int userId, int type, double amount);
    }
}