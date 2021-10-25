using System;
using System.Collections.Generic;
using System.IO;
using core;
using core.command;
using core.repository;
using dto;
using framework;
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
using rabbitmq.model;
using repository;

namespace rabbitmq{
    

    internal class Program {
        
        private static IServiceProvider serviceProvider { get; set; }
        private static IConfiguration configuration { get; set; }

        public static EntryPoint configureServices(string[] args)
        {
            configuration = new ConfigurationBuilder()
                .SetBasePath($"{Directory.GetParent(AppContext.BaseDirectory).FullName}/configuration/")
                .AddJsonFile("appsettings.json", false)
                .AddJsonFile("rabbitmq.json", true)
                .Build();
            // configuration.GetSection("ConnectionFactory").Bind(new ConnectionFactory());

            var loggerFactory = LoggerFactory.Create(builder =>
            {
                builder
                    .AddConfiguration(configuration.GetSection("Logging"))
                    .AddGelf();
            });
            
            serviceProvider = new ServiceCollection()
                .AddSingleton(configuration)
                .AddSingleton(configuration.GetSection("ConnectionFactory").Get<ConnectionFactory>())
                // .AddSingleton<ILogger>(loggerFactory.CreateLogger<Program>())
                .AddSingleton<ILogger>(LoggerFactory.Create(builder => builder.AddConfiguration(configuration.GetSection("Logging")).AddConsole()).CreateLogger<Program>())
                .ConfigureRepositoryDependencyInjection()
                .ConfigureCoreDependencyInjection()
                .AddSingleton<IRabbitService, RabbitService<DefaultRabbitPublisher, DefaultRabbitConsumer>>()
                .AddTransient<EntryPoint>()
                .AddTransient<AddPlayerMessageHandler>()
                .AddTransient<RegisterEventMessageHandler>()
                .AddTransient<TerminateEventMessageHandler>()
                .AddTransient<CreateBetMessageHandler>()
                .AddTransient<RegisterUserMessageHandler>()
                .BuildServiceProvider();
            return serviceProvider.GetService<EntryPoint>();
        }

        public static void Main(string[] args)
        {
            configureServices(args)
                // TODO: load from configuration/rabbitmq.json
                .registerConsumer(new ConsumerConfiguration()
                {
                    exchange = "APexchange", 
                    queue = "addPlayer", 
                    handler = serviceProvider.GetService<AddPlayerMessageHandler>(), 
                    routingKey = "event.addPlayer", 
                    type = "direct", 
                    durable = true
                })
                .registerConsumer(new ConsumerConfiguration()
                {
                    exchange = "REexchange", 
                    queue = "registerEvent", 
                    handler = serviceProvider.GetService<RegisterEventMessageHandler>(), 
                    routingKey = "event.registerEvent", 
                    type = "direct", 
                    durable = true
                })
                .registerConsumer(new ConsumerConfiguration()
                {
                    exchange = "TEexchange", 
                    queue = "terminateEvent", 
                    handler = serviceProvider.GetService<TerminateEventMessageHandler>(), 
                    routingKey = "event.terminateEvent", 
                    type = "direct", 
                    durable = true
                })
                .registerConsumer(new ConsumerConfiguration()
                {
                    exchange = "CBexchange", 
                    queue = "createBet", 
                    handler = serviceProvider.GetService<CreateBetMessageHandler>(), 
                    routingKey = "event.createBet", 
                    type = "direct", 
                    durable = true
                })
                .registerConsumer(new ConsumerConfiguration()
                {
                    exchange = "RUexchange", 
                    queue = "registerUser", 
                    handler = serviceProvider.GetService<RegisterUserMessageHandler>(), 
                    routingKey = "user.registerUser", 
                    type = "direct", 
                    durable = true
                })
                .Start();
        }
    }
}