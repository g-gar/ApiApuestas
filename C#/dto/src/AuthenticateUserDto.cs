using framework;

namespace dto{
    public class AuthenticateUserDto : Dto {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}