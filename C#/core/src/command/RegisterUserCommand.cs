using core.repository;
using dto;
using framework;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class RegisterUserCommand : Command<CreateUserDto>{

        private readonly IUserRepository _userRepository;

        public RegisterUserCommand(IUserRepository userRepository, ILogger logger) : base(logger)
        {
            _userRepository = userRepository;
        }
        protected override void execute(CreateUserDto dto) => _userRepository.register(dto.Dni, dto.Username, dto.Password);
        public override bool checkPreconditions(CreateUserDto dto) => true;
    }
}