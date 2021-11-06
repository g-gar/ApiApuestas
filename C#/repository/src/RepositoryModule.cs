using core.repository;
using Microsoft.Extensions.DependencyInjection;

namespace repository{
    public static class RepositoryModule{

        public static IServiceCollection ConfigureRepositoryDependencyInjection(this IServiceCollection serviceCollection)
        {
            return serviceCollection
                .AddSingleton<IEventRepository, EventRepository>()
                .AddSingleton<ITransactionRepository, TransactionRepository>()
                .AddSingleton<IUserRepository, UserRepository>();
        }
        
    }
}