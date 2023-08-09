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
    private static string _connectionString = "@Server=localhost;DataBase=PreguntadORT;Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias()
    {
        string sql = "SELECT * FROM Categorias;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Categoria>(sql).ToList();
        }
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        string sql = "SELECT * FROM Dificultades;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Dificultades>(sql).ToList();
        }
    }

    public static List<Pregunta> ObtenerPreguntas(int idDificultad, int idCategoria)
    {
        string sql = "exec sp_ObtenerPreguntas @iddificultad, @idcategoria;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Pregunta>(sql, new { iddificultad = idDificultad, idcategoria = idCategoria }).ToList();
        }
    }

    public static List<Respuesta> ObtenerRespuestas(Pregunta Preguntas)
    {
        string sql = "exec sp_ObtenerRespuestas @idPregunta;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Respuesta>(sql, new { idPregunta = pregunta.idPregunta }).ToList();
        }
    }

    public static Respuesta ObtenerRespuesta(int idRespuesta){
        string sql = "SELECT * FROM Respuestas WHERE idRespuesta = @idrespuesta";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Respuesta>(sql, new { idrespuesta = idRespuesta }).SingleOrDefault();
        }
    }

    public static List<Puntaje> ObtenerPuntajes()
    {
        string sql = "SELECT * FROM Puntajes;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Puntaje>(sql).ToList();
        }
    }

    public static void AgregarPregunta(Pregunta pregunta)
    {
        string sql = "exec sp_AgregarPregunta @idcategoria, @iddificultad, @enunciado, @foto;";
        using (SqlConnectiond db = new SqlConnectiond(_connectionString))
        {
            db.Execute(sql, new { idcategoria = pregunta.idCategoria, iddificultad = pregunta.iddificultad, enunciado = pregunta.enunciado, foto = pregunta.foto });
        }
    }

    public static void AgregarPuntaje(Puntaje puntaje)
    {
        string sql = "exec sp_AgregarPuntaje @nombre, @puntos, @fechahora";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new { nombre = puntaje.nombre, puntos = puntaje.puntos, fechahora = puntaje.fechahora });
        }
    }

}