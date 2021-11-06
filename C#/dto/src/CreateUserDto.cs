using framework;

namespace dto{
    public class CreateUserDto : Dto {
        public string Username { get; set; }
        public string Dni { get; set; }
        public string Password { get; set; }
    }
}