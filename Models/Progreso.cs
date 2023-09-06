public class Progreso
{
    public int idProgreso { get; set; }
    public bool Arte { get; set; }
    public bool Ciencia { get; set; }
    public bool Deporte { get; set; }
    public bool Entretenimiento { get; set; }
    public bool Geografia { get; set; }
    public bool Historia { get; set; }

    public Progreso() { }

    public Progreso(bool arte, bool ciencia, bool deporte, bool entretenimiento, bool geografia, bool historia)
    {
        Arte = arte;
        Ciencia = ciencia;
        Deporte = deporte;
        Entretenimiento = entretenimiento;
        Geografia = geografia;
        Historia = historia;
    }
}