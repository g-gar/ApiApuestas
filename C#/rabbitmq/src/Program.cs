using System;
using System.IO;
using core;
using core.repository;
using Gelf.Extensions.Logging;
using Messaging.Core.Interfaces;
using Messaging.Core.Models;
using Messaging.Core.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using RabbitMQ.Client;
using rabbitmq;
using rabbitmq.messagehandler;

namespace rabbitmq{
    

    internal class Program {
        
        private static IServiceProvider serviceProvider { get; set; }
        public static EntryPoint configureServices(string[] args)
        {
            IConfiguration configuration = new ConfigurationBuilder()
                .SetBasePath($"{Directory.GetParent(AppContext.BaseDirectory).FullName}/configuration/")
                .AddJsonFile("appsettings.json", false)
                .AddJsonFile("rabbitmq.json", true)
                .Build();
            configuration.GetSection("ConnectionFactory").Bind(new ConnectionFactory());

            var loggerFactory = LoggerFactory.Create(builder =>
            {
                builder
                    .AddConfiguration(configuration.GetSection("Logging"))
                    .AddGelf();
            });
            
            serviceProvider = new ServiceCollection()
                .AddTransient<IRabbitService, RabbitService<DefaultRabbitPublisher, DefaultRabbitConsumer>>()
                .AddSingleton(configuration)
                .AddSingleton(configuration.GetSection("ConnectionFactory").Get<ConnectionFactory>())
                .AddSingleton<ILogger>(loggerFactory.CreateLogger<Program>())
                .AddSingleton<IEventRepository>()
                .AddSingleton<ITransactionRepository>()
                .AddSingleton<IUserRepository>()
                .AddSingleton<CommandFacade>()
                .AddSingleton<EntryPoint>()
                .BuildServiceProvider();
            return serviceProvider.GetService<EntryPoint>();
        }

        public static void Main(string[] args)
        {
            configureServices(args)
                .Consume(
                    "APexchange", 
                    "addPlayer", 
                    new AddPlayerMessageHandler(serviceProvider.GetService<ILogger>(), serviceProvider.GetService<CommandFacade>()), 
                    "event.addPlayer", 
                    "direct", 
                    true
                )
                .Consume(
                    "REexchange", 
                    "registerEvent", 
                    new RegisterEventMessageHandler(serviceProvider.GetService<ILogger>(), serviceProvider.GetService<CommandFacade>()), 
                    "event.registerEvent", 
                    "direct", 
                    true
                )
                .Consume(
                    "TEexchange", 
                    "terminateEvent", 
                    new TerminateEventMessageHandler(serviceProvider.GetService<ILogger>(), serviceProvider.GetService<CommandFacade>()), 
                    "event.terminateEvent", 
                    "direct", 
                    true
                )
                .Consume(
                    "CBexchange", 
                    "createBet", 
                    new CreateBetMessageHandler(serviceProvider.GetService<ILogger>(), serviceProvider.GetService<CommandFacade>()), 
                    "event.createBet", 
                    "direct", 
                    true
                )
                .Consume(
                    "RUexchange", 
                    "registerUser", 
                    new RegisterUserMessageHandler(serviceProvider.GetService<ILogger>(), serviceProvider.GetService<CommandFacade>()), 
                    "user.registerUser", 
                    "direct", 
                    true
                )
                .Start();
        }
    }
}