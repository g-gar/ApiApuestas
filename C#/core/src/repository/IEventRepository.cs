namespace core.repository{
    public interface IEventRepository{
        public void addPlayer(int eventId, double quota, int position);
        public void createEvent(int type, string description, object date);
        public void terminateEvent(int eventId, int playerWinnerId);
        public void bet(int eventId, int playerId, double amount, int winner);
    }
}