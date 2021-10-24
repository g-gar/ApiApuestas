using System;
using System.Reflection;
using Microsoft.Extensions.Logging;

namespace core {
    public abstract class Command<T> : ICommand<T> {
        protected readonly ILogger _logger;
        protected string _startTemplate;
        protected string _endTemplate;
        protected T _result;

        protected Command(ILogger logger, string startTemplate = "[{Typename}] started execution with args=[{Parameters}]", string endTemplate = "[{Typename}] terminated execution with args=[{Parameters}] and result=[{result}]")
        {
            _logger = logger;
            _startTemplate = startTemplate;
            _endTemplate = endTemplate;
        }

        protected abstract void beginExecute();
        protected abstract void endExecute();
        protected void beginExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);
        protected void endExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);

        protected abstract T execute();

        public abstract bool checkPreconditions();

        public T? executeCommand()
        {
            _result = default(T);
            beginExecute();
            if (checkPreconditions())
            {
                _result = execute();
            }
            endExecute();
            return _result;
        }
    }

    public abstract class Command : ICommand<Void> {
        protected readonly ILogger _logger;
        protected readonly string _startTemplate;
        protected readonly string _endTemplate;

        protected Command(ILogger logger, string startTemplate = "[{Typename}] started execution with args=[{Parameters}]", string endTemplate = "[{Typename}] terminated execution with args=[{Parameters}]")
        {
            _logger = logger;
            _startTemplate = startTemplate;
            _endTemplate = endTemplate;
        }

        protected abstract void beginExecute();
        protected abstract void endExecute();
        protected void beginExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);
        protected void endExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);

        protected abstract void execute();

        public abstract bool checkPreconditions();

        public Void? executeCommand()
        {
            beginExecute();
            if (checkPreconditions())
            {
                execute();
            }
            endExecute();
            return default(Void);
        }
    }
}