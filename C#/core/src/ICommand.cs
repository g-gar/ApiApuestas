using Microsoft.Extensions.Logging;

namespace core {
    public interface ICommand<out T>{

        public bool checkPreconditions();
        public T? executeCommand();

    }
}