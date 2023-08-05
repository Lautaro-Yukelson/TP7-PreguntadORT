public class Categoria
{
    public int idCategoria { get; set; }
    public string Nombre { get; set; }
    public string Foto { get; set; }

    public Categoria() { }

    public Categoria(string nombre, string foto)
    {
        Nombre = nombre;
        Foto = foto;
    }
}