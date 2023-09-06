public class Dificultad
{
    public int idDificultad { get; set; }
    public string Nombre { get; set; }
    public double Multiplicador { get; set; }
    public int PorcentajeCorrecto { get; set; }

    public Dificultad() { }

    public Dificultad(string nombre, double multiplicador, int porcentajecorrecto)
    {
        Nombre = nombre;
        Multiplicador = multiplicador;
        PorcentajeCorrecto = porcentajecorrecto;
    }
}