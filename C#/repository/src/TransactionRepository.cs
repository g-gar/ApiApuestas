using core.repository;

namespace repository{
    public class TransactionRepository : ITransactionRepository {
        public void Dispose()
        {
    
        }

        public int create(int userId, int type, double amount)
        {
            return default(int);
        }
    }
}