using core.command;
using dto;
using framework;
using Microsoft.Extensions.DependencyInjection;

namespace core{
    public static class CoreModule {
        public static IServiceCollection ConfigureCoreDependencyInjection(this IServiceCollection serviceCollection)
        {
            return serviceCollection
                .AddTransient<Command<AddPlayerDto>, AddPlayerCommand>()
                .AddTransient<Command<AuthenticateUserDto, bool>, AuthenticateUserCommand>()
                .AddTransient<Command<CreateBetDto>, CreateBetCommand>()
                .AddTransient<Command<CreateEventDto>, CreateEventCommand>()
                .AddTransient<Command<CreateTransactionDto, int>, CreateTransactionCommand>()
                .AddTransient<Command<CreateUserDto>, RegisterUserCommand>()
                .AddTransient<Command<TerminateEventDto>, TerminateEventCommand>();
        }
    }
}