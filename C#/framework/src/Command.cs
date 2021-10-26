using System;
using Microsoft.Extensions.Logging;

namespace framework {
    public abstract class Command<T, R> : ICommand<T, R> where T : class, Dto {
        protected readonly ILogger _logger;
        protected readonly LogLevel _logLevel;
        protected string _startTemplate;
        protected string _endTemplate;
        protected R? _result;

        protected Command(ILogger logger, LogLevel logLevel = LogLevel.Information, string startTemplate = "[{Typename}] started execution with args=[{Parameters}]", string endTemplate = "[{Typename}] terminated execution with args=[{Parameters}] and result=[{result}]")
        {
            _logger = logger;
            _logLevel = logLevel;
            _startTemplate = startTemplate;
            _endTemplate = endTemplate;
        }

        protected void beginExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);
        protected void endExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);

        protected abstract R execute(T arg);

        public abstract bool checkPreconditions(T arg);

        public R? executeCommand(T arg)
        {
            _result = default(R?);
            beginExecute(_logLevel, _startTemplate, arg);
            if (checkPreconditions(arg))
            {
                _result = execute(arg);
            }
            endExecute(_logLevel, _endTemplate, arg);
            return _result;
        }
    }
    
    public abstract class Command<T>: ICommand<T, Void> where T: class, Dto {
        protected readonly ILogger _logger;
        protected readonly LogLevel _logLevel;
        protected readonly string _startTemplate;
        protected readonly string _endTemplate;

        protected Command(ILogger logger, LogLevel logLevel = LogLevel.Information, string startTemplate = "[{Typename}] started execution with args=[{Parameters}]", string endTemplate = "[{Typename}] terminated execution with args=[{Parameters}]")
        {
            _logger = logger;
            _logLevel = logLevel;
            _startTemplate = startTemplate;
            _endTemplate = endTemplate;
        }
        
        protected void beginExecute(LogLevel level, string template, T arg) => _logger.Log(level, template, this.GetType().FullName, arg);
        protected void endExecute(LogLevel level, string template, T arg) => _logger.Log(level, template, this.GetType().FullName, arg);

        protected abstract void execute(T arg);

        public abstract bool checkPreconditions(T arg);

        public Void? executeCommand(T arg)
        {
            beginExecute(_logLevel, _startTemplate, arg);
            if (checkPreconditions(arg))
            {
                execute(arg);
            }
            endExecute(_logLevel, _endTemplate, arg);
            return default(Void);
        }
    }

    public abstract class Command : ICommand<Void> {
        protected readonly ILogger _logger;
        protected readonly LogLevel _logLevel;
        protected readonly string _startTemplate;
        protected readonly string _endTemplate;

        protected Command(ILogger logger, LogLevel logLevel = LogLevel.Information, string startTemplate = "[{Typename}] started execution with args=[{Parameters}]", string endTemplate = "[{Typename}] terminated execution with args=[{Parameters}]")
        {
            _logger = logger;
            _logLevel = logLevel;
            _startTemplate = startTemplate;
            _endTemplate = endTemplate;
        }
        
        protected void beginExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);
        protected void endExecute(LogLevel level, string template, params object[] args) => _logger.Log(level, template, this.GetType().FullName, args);

        protected abstract void execute();

        public abstract bool checkPreconditions();

        public Void? executeCommand()
        {
            beginExecute(_logLevel, _startTemplate, Array.Empty<object>());
            if (checkPreconditions())
            {
                execute();
            }
            endExecute(_logLevel, _endTemplate, Array.Empty<object>());
            return default(Void);
        }
    }
}