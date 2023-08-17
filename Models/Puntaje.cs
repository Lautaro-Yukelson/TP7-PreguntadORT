public class Puntaje
{
    public int idUsuario { get; set; }
    public string Nombre { get; set; }
    public int Puntos { get; set; }
    public DateTime FechaHora { get; set; }

    public Puntaje() { }

    public Puntaje(string nombre, int puntos, DateTime fechahora)
    {
        Nombre = nombre;
        Puntos = puntos;
        FechaHora = fechahora;
    }
}