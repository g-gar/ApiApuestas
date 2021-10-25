namespace framework {
    
    public interface ICommand {
    
    }
    public interface ICommand<in T, out R> : ICommand where T : Dto {

        public bool checkPreconditions(T arg);
        public R? executeCommand(T arg);

    }

    public interface ICommand<out R> : ICommand {

        public bool checkPreconditions();
        public R? executeCommand();

    }
}