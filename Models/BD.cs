using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Threading;
using System.ComponentModel;
using System.Data.SqlTypes;
using Dapper;
using System.Data.SqlClient;


public static class BD
{
    private static string _connectionString = "Server=localhost;DataBase=PreguntadORT;Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias()
    {
        string sql = "SELECT * FROM Categorias;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Categoria>(sql).ToList();
        }
    }

    //Temp
    public static Dificultad ObtenerDificultad(int id)
    {
        string sql = "SELECT * FROM Dificultades WHERE idDificultad = @idDificultad;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Dificultad>(sql, new { idDificultad = id }).SingleOrDefault();
        }
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        string sql = "SELECT * FROM Dificultades;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Dificultad>(sql).ToList();
        }
    }

    public static List<Pregunta> ObtenerPreguntas(int idDificultad)
    {
        string sql = "exec sp_ObtenerPreguntas @iddificultad;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Pregunta>(sql, new { iddificultad = idDificultad }).ToList();
        }
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {
        string sql = "exec sp_ObtenerRespuestas @idPregunta;";
        List<Respuesta> respuestas = new List<Respuesta>();

        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            foreach (Pregunta pregunta in preguntas)
            {
                respuestas.AddRange(db.Query<Respuesta>(sql, new { idPregunta = pregunta.idPregunta }).ToList());
            }
        }

        return respuestas;
    }

    public static Respuesta ObtenerRespuesta(int idRespuesta)
    {
        string sql = "SELECT * FROM Respuestas WHERE idRespuesta = @idrespuesta";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Respuesta>(sql, new { idrespuesta = idRespuesta }).SingleOrDefault();
        }
    }

    public static List<Usuario> ObtenerUsuarios()
    {
        string sql = "SELECT * FROM Usuarios;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Usuario>(sql).ToList();
        }
    }

    public static void AgregarPregunta(Pregunta pregunta)
    {
        string sql = "exec sp_AgregarPregunta @idcategoria, @iddificultad, @enunciado, @foto;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new { idcategoria = pregunta.idCategoria, iddificultad = pregunta.idDificultad, enunciado = pregunta.Enunciado, foto = pregunta.Foto });
        }
    }

    public static void AgregarUsuario(Usuario usuario)
    {
        string sql = "exec sp_AgregarUsuario @Nombre, @Contrasena";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new { Nombre = usuario.Nombre, Contrasena = usuario.Contrasena});
        }
    }

}