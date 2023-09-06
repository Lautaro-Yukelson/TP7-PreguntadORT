using System.Security.Cryptography;
using System.Data;
using System;
using Dapper;
using System.Linq;
using System.Threading;
using System.Data.Common;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;


public static class BD
{
    private static string _connectionString = "Server=localhost;DataBase=PreguntadORT;Trusted_Connection=True;";

    public static Categoria ObtenerCategoria(int idCategoria){
        string sql = "SELECT * FROM Categorias WHERE idCategoria = @idC";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            return db.QueryFirstOrDefault<Categoria>(sql, new {idC = idCategoria});
        }
    }

    public static List<Categoria> ObtenerCategorias()
    {
        string sql = "SELECT * FROM Categorias;";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Categoria>(sql).ToList();
        }
    }

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

    public static Pregunta ObtenerPregunta(int idP)
    {
        string sql = "exec sp_ObtenerPregunta @idPregunta";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.QueryFirstOrDefault<Pregunta>(sql, new { idPregunta = idP });
        }
    }

    public static List<Pregunta> ObtenerPreguntas()
    {
        string sql = "SELECT * FROM Preguntas";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Pregunta>(sql).ToList();
        }
    }
    public static Respuesta ObtenerRespuesta(int idRespuesta)
    {
        string sql = "SELECT * FROM Respuestas WHERE idRespuesta = @idrespuesta";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Respuesta>(sql, new { idrespuesta = idRespuesta }).SingleOrDefault();
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

    public static Usuario ObtenerUsuario(int idUsuario)
    {
        string sql = "exec ¨sp_ObtenerUsuario @idusuario";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.QueryFirstOrDefault<Usuario>(sql, new { idusuario = idUsuario });
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

    public static Partida ObtenerPartida(int idPartida)
    {
        string sql = "exec sp_ObtenerPartida @idP";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.QueryFirstOrDefault<Partida>(sql, new { idP = idPartida });
        }
    }

    public static List<Partida> ObtenerPartidas(int idUsuario)
    {
        string sql = "exec sp_ObtenerPartidas @idusuario";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Partida>(sql, new { idusuario = idUsuario }).ToList();
        }
    }

    public static Progreso ObtenerProgreso(int idP)
    {
        string sql = "exec sp_ObtenerProgreso @idProgreso";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.QueryFirstOrDefault<Progreso>(sql, new { idProgreso = idP });
        }
    }

    public static List<Progreso> ObtenerProgresos()
    {
        string sql = "SELECT * FROM Progresos";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            return db.Query<Progreso>(sql).ToList();
        }
    }

    public static void ActualizarTurno(int idPartida, int idUsuario)
    {
        string sql = "exec sp_ActualizarTurno @idP, @idU";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new { idP = idPartida, idU = idUsuario });
        }
    }

    public static void ActualizarArte(int idProgreso){
        string sql = "UPDATE Progresos SET Arte = 1 WHERE idProgreso = @idP";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idP = idProgreso});
        }
    }

    public static void ActualizarCiencia(int idProgreso){
        string sql = "UPDATE Progresos SET Ciencia = 1 WHERE idProgreso = @idP";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idP = idProgreso});
        }
    }
    
    public static void ActualizarDeporte(int idProgreso){
        string sql = "UPDATE Progresos SET Deporte = 1 WHERE idProgreso = @idP";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idP = idProgreso});
        }
    }

    public static void ActualizarEntretenimiento(int idProgreso){
        string sql = "UPDATE Progresos SET Entretenimiento = 1 WHERE idProgreso = @idP";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idP = idProgreso});
        }
    }

    public static void ActualizarGeografia(int idProgreso){
        string sql = "UPDATE Progresos SET Geografia = 1 WHERE idProgreso = @idP";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idP = idProgreso});
        }
    }

    public static void ActualizarHistoria(int idProgreso){
        string sql = "UPDATE Progresos SET Historia = 1 WHERE idProgreso = @idP";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idP = idProgreso});
        }
    }

    public static void AgregarUsuario(Usuario usuario)
    {
        string sql = "exec sp_AgregarUsuario @Nombre, @Contrasena";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new { Nombre = usuario.Nombre, Contrasena = usuario.Contrasena });
        }
    }

    public static void CrearPartida(int idU, int idUV){
        string sql = "exec sp_CrearPartida @idUsuario, @idUsuarioVS";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idUsuario = idU, idUsuarioVS = idUV});
        }
    }

    public static void EliminarPartida(int idPartida){
        string sql = "sp_EliminarPartida @idP";
        using (SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {idP = idPartida});
        }
    }
}