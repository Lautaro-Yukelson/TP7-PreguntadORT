public class Usuario
{
    public int idUsuario { get; set; }
    public string Nombre { get; set; }
    public string Contrasena { get; set; }

    public Usuario() { }

    public Usuario(string nombre, string contrasena)
    {
        Nombre = nombre;
        Contrasena = contrasena;
    }
}