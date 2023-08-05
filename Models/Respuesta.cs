public class Respuesta
{
    public int idRespuesta { get; set; }
    public int idPregunta { get; set; }
    public int Opcion { get; set; }
    public string Contenido { get; set; }
    public bool Correcta { get; set; }
    public string Foto { get; set; }

    public Respuesta() { }

    public Respuesta(int idpregunta, int opcion, string contenido, bool correcta, string foto)
    {
        idPregunta = idpregunta;
        Opcion = opcion;
        Contenido = contenido;
        Correcta = correcta;
        Foto = foto;
    }
}