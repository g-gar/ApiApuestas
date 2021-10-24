namespace core.repository{
    public interface IUserRepository{
        public void register(string dni, string username, string password);
        public bool authenticate(string username, string password);
    }
}