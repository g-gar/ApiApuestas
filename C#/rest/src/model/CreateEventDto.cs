namespace ApiApuestas.model{
    public class CreateEventDto{
        public int type { get; set; }
        public string description { get; set; }
        public object date { get; set; } //TODO: change to datetime object
    }
}