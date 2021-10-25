using System;

namespace core.repository{
    public interface IUserRepository : IDisposable {
        public void register(string dni, string username, string password);
        public bool authenticate(string username, string password);
    }
}