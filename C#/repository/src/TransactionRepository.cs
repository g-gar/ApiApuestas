using System;
using core.repository;

namespace repository{
    public class TransactionRepository : ITransactionRepository {
        
        private readonly IDbConnectionPool dbConnectionPool;

        public TransactionRepository(IDbConnectionPool dbConnectionPool)
        {
            this.dbConnectionPool = dbConnectionPool;
        }

        public int create(int userId, int type, double amount)
        {
            return default(int);
        }
        
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            
        }
        ~TransactionRepository()
        {
            Dispose(false);
        }
    }
}