using System;

namespace core.repository{
    public interface IEventRepository : IDisposable {
        public void addPlayer(int eventId, double quota, int position);
        public void createEvent(int type, string description, object date);
        public void terminateEvent(int eventId, int playerWinnerId);
        public void createBet(int eventId, int playerId, double amount, int winner);
    }
}