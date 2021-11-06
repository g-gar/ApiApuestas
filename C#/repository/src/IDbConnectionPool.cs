using System;
using framework;

namespace repository{
    public interface IDbConnectionPool : IDisposable {
        public R execute<T, R>(T dto, Func<Dto, R> fn) where T : class, Dto;
        public void execute<T>(T dto, Action<T> fn) where T : class, Dto;
        public void execute(Action fn);
    }
}