using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using core.repository;
using Messaging.Core.Interfaces;
using Microsoft.Extensions.Logging;


// TODO: find a better way to work with reflection here
namespace core{
    public class BetFacade{
        private IEventRepository _eventRepository;
        private ITransactionRepository _transactionRepository;
        private IUserRepository _userRepository;
        private ILogger _logger;
        private IRabbitService _rabbitService;

        public BetFacade(IEventRepository eventRepository, ITransactionRepository transactionRepository, IUserRepository userRepository, ILogger logger, IRabbitService rabbitService)
        {
            _eventRepository = eventRepository;
            _transactionRepository = transactionRepository;
            _userRepository = userRepository;
            _logger = logger;
            _rabbitService = rabbitService;
        }

        public void addPlayer(int eventId, double quota, int position)
        {
            execute(_eventRepository, "addPlayer", eventId, quota, position);
        }

        public void createEvent(int type, string description, object date)
        {
            execute(_eventRepository, "createEvent", description, date);
        }

        public void terminateEvent(int eventId, int playerWinnerId)
        {
            execute(_eventRepository, "terminateEvent", eventId, playerWinnerId);
        }

        public void bet(int eventId, int playerId, double amount, int winner)
        {
            execute(_eventRepository, "bet", eventId, playerId, amount, winner);
        }

        public int createTransaction(int userId, int type, double amount)
        {
            return execute<int>(_transactionRepository, "create", userId, type, amount);
        }

        public void register(string dni, string username, string password)
        {
            execute(_userRepository, "register", dni, username, password);
        }

        public bool authenticate(string username, string password)
        {
            return execute<bool>(_userRepository, "authenticate", username, password);
        }

        private R execute<R>(object instance, string methodName, params object[] args)
        {
            R result = default(R);
            MethodInfo method = instance.GetType().GetMethod(methodName);
            _logger.LogInformation("[{0}.{1}] started with args=[{2}]", method.GetType().FullName, method.Name, args);
            result = (R) method.Invoke(instance, args);
            _logger.LogInformation("[{0}.{1}] finished with args=[{2}]", method.GetType().FullName, method.Name, args);
            return result;
        }

        private void execute(object instance, string methodName, params object[] args)
        {
            MethodInfo method = instance.GetType().GetMethod(methodName);
            _logger.LogInformation("[{0}.{1}] started with args=[{2}]", method.GetType().FullName, method.Name, args);
            method.Invoke(instance, args);
            _logger.LogInformation("[{0}.{1}] finished with args=[{2}]", method.GetType().FullName, method.Name, args);
        }
    }
}