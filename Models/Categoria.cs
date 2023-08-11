public class Categoria
{
    public int idCategoria { get; set; }
    public string Nombre { get; set; }
    public string Foto { get; set; }
    public string ColorFondo { get; set; }

    public Categoria() { }

    public Categoria(string nombre, string foto, string colorfondo)
    {
        Nombre = nombre;
        Foto = foto;
        ColorFondo = colorfondo;
    }
}