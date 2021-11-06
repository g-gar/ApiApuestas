using core.repository;
using dto;
using framework;
using Microsoft.Extensions.Logging;

namespace core.command{
    public class AuthenticateUserCommand : Command<AuthenticateUserDto, bool> {

        private readonly IUserRepository _userRepository;

        public AuthenticateUserCommand(IUserRepository userRepository, ILogger logger) : base(logger)
        {
            _userRepository = userRepository;
        }
        
        protected override bool execute(AuthenticateUserDto dto) => _userRepository.authenticate(dto.Username, dto.Password);
        public override bool checkPreconditions(AuthenticateUserDto dto) => true;
    }
}