using System;
using core.repository;
using dto;
using Microsoft.Extensions.Logging;

namespace repository{
    public class EventRepository : IEventRepository{

        private readonly ILogger logger;
        private readonly IDbConnectionPool dbConnectionPool;

        public EventRepository(IDbConnectionPool dbConnectionPool, ILogger logger)
        {
            this.dbConnectionPool = dbConnectionPool;
            this.logger = logger;
        }

        public void addPlayer(int eventId, double quota, int position)
        {
            dbConnectionPool.execute(new AddPlayerDto()
            {
                EventId = eventId,
                Quota = quota,
                Position = position
            }, dto => logger.LogInformation($"{dto}"));
        }

        public void createEvent(int type, string description, object date)
        {
            
        }

        public void terminateEvent(int eventId, int playerWinnerId)
        {
            
        }

        public void createBet(int eventId, int playerId, double amount, int winner)
        {
            
        }
        
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            
        }
        ~EventRepository()
        {
            Dispose(false);
        }
    }
}