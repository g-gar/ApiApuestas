using System;

namespace core.repository{
    public interface ITransactionRepository : IDisposable {
        public int create(int userId, int type, double amount);
    }
}