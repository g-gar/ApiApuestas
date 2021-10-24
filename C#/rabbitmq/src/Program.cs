using System;
using System.IO;
using Gelf.Extensions.Logging;
using Messaging.Core.Interfaces;
using Messaging.Core.Models;
using Messaging.Core.Services;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using RabbitMQ.Client;

namespace rabbitmq{
    

    internal class Program {
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
            
            IServiceProvider serviceProvider = new ServiceCollection()
                .AddTransient<IRabbitService, RabbitService<DefaultRabbitPublisher, DefaultRabbitConsumer>>()
                .AddSingleton<IConfiguration>(configuration)
                .AddSingleton(configuration.GetSection("ConnectionFactory").Get<ConnectionFactory>())
                .AddSingleton<ILogger>(loggerFactory.CreateLogger<Program>())
                .AddSingleton<EntryPoint>()
                .BuildServiceProvider();
            return serviceProvider.GetService<EntryPoint>();
        }

        public static void Main(string[] args)
        {
            Program.configureServices(args).Start();
        }
    }
}