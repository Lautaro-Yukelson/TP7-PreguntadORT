public class Pregunta
{
    int idPregunta { get; set; }
    int idCategoria { get; set; }
    int idDificultad { get; set; }
    string Enunciado { get; set; }
    string Foto { get; set; }

    public Pregunta() { }

    public Pregunta(int idcategoria, int iddificultad, string enunciado, string foto)
    {
        idCategoria = idcategoria;
        idDificultad = iddificultad;
        Enunciado = enunciado;
        Foto = foto;
    }
}