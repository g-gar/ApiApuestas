using System;
using core.repository;

namespace repository{
    public class UserRepository : IUserRepository {

        private readonly IDbConnectionPool dbConnectionPool;

        public UserRepository(IDbConnectionPool dbConnectionPool)
        {
            this.dbConnectionPool = dbConnectionPool;
        }

        
        public void register(string dni, string username, string password)
        {
            
        }

        public bool authenticate(string username, string password)
        {
            return default(bool);
        }
        
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            
        }
        ~UserRepository()
        {
            Dispose(false);
        }
    }
}