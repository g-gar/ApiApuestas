using System;
using framework;

namespace repository{
    public class DbConnectionPool : IDbConnectionPool {
        public R execute<T, R>(T dto, Func<Dto, R> fn) where T : class, Dto
        {
            return fn.Invoke(dto);
        }

        public void execute<T>(T dto, Action<T> fn) where T : class, Dto
        {
            fn.Invoke(dto);
        }

        public void execute(Action fn)
        {
            fn.Invoke();
        }
        
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            
        }
        ~DbConnectionPool()
        {
            Dispose(false);
        }
    }
}