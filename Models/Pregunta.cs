public class Pregunta
{
    public int idPregunta { get; set; }
    public int idCategoria { get; set; }
    public int idDificultad { get; set; }
    public string Enunciado { get; set; }
    public string Foto { get; set; }

    public Pregunta() { }

    public Pregunta(int idcategoria, int iddificultad, string enunciado, string foto)
    {
        idCategoria = idcategoria;
        idDificultad = iddificultad;
        Enunciado = enunciado;
        Foto = foto;
    }
}