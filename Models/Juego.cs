using System.Runtime.InteropServices;
using System;
using BCrypt.Net;
using System.Security;
using Newtonsoft.Json;
using System.Resources;
using System.Threading;
using System.ComponentModel;
using System.IO.Compression;
using System.Threading.Tasks;
using System.Reflection.Metadata;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices.ComTypes;


public static class Juego
{
    private static List<Pregunta> _preguntas = new List<Pregunta>();
    private static List<Respuesta> _respuestas = new List<Respuesta>();
    private static List<Dificultad> _dificultades = new List<Dificultad>();
    private static List<Categoria> _categorias = new List<Categoria>();
    private static List<Progreso> _progresos = new List<Progreso>();
    private static List<Usuario> _usuarios = new List<Usuario>();
    private static Random _random = new Random();

    public static void IniciarServidor()
    {
        _preguntas = BD.ObtenerPreguntas();
        _respuestas = BD.ObtenerRespuestas(_preguntas);
        _dificultades = BD.ObtenerDificultades();
        _categorias = BD.ObtenerCategorias();
        _progresos = BD.ObtenerProgresos();
        _usuarios = BD.ObtenerUsuarios();
    }

    public static int IniciarSesion(string usuario, string contrasena)
    {
        foreach (Usuario user in _usuarios)
        {
            if (user.Nombre == usuario)
            {
                if (BCrypt.Net.BCrypt.Verify(contrasena, user.Contrasena))
                {
                    return 1;
                }
                else { return -1; }
            }
        }
        return -2;
    }

    public static void CrearCuenta(string usuario, string contrasena)
    {
        string hashContrasena = BCrypt.Net.BCrypt.HashPassword(contrasena);
        BD.AgregarUsuario(new Usuario(usuario, hashContrasena));
    }

    public static void CrearPartida(int idUsuario, int idUsuarioVS){
        BD.CrearPartida(idUsuario, idUsuarioVS);
    }

    public static void CrearCookies(HttpContext context, Usuario user)
    {
        // Creo la cookie con el statuss del log
        // -2: Usuario no encontrado
        // -1: Contraseña incorrecta
        // 1: Logeado correctamente
        Juego.ActualizarPreguntasUsadas(context, new List<Pregunta>());
        CookieOptions idUser = new CookieOptions { Expires = DateTime.Now.AddDays(7) };
        context.Response.Cookies.Append("idUser", user.idUsuario.ToString(), idUser);

        List<Respuesta> _respuestas = BD.ObtenerRespuestas(Juego.ObtenerPreguntas());
    }

    public static List<Pregunta> ObtenerPreguntas()
    {
        return _preguntas;
    }

    public static void DescartarPregunta(HttpContext context, Pregunta pregunta)
    {
        List<Pregunta> _preguntasUsadas = Juego.ObtenerPreguntasUsadas(context);
        _preguntasUsadas.Add(pregunta);
        Juego.ActualizarPreguntasUsadas(context, _preguntasUsadas);
    }

    public static List<Pregunta> ObtenerPreguntasUsadas(HttpContext context)
    {
        string _preguntasUsadasJson = context.Request.Cookies["_preguntasUsadas"];
        return JsonConvert.DeserializeObject<List<Pregunta>>(_preguntasUsadasJson);
    }

    public static void ActualizarPreguntasUsadas(HttpContext context, List<Pregunta> _preguntasUsadasLista)
    {
        string _preguntasUsadasJson = JsonConvert.SerializeObject(_preguntasUsadasLista);
        CookieOptions _preguntasUsadasCookie = new CookieOptions { Expires = DateTime.Now.AddDays(7) };
        context.Response.Cookies.Append("_preguntasUsadas", _preguntasUsadasJson, _preguntasUsadasCookie);

    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return _dificultades;
    }

    public static Categoria ObtenerCategoria(int idCategoria){
        return BD.ObtenerCategoria(idCategoria);
    }

    public static List<Categoria> ObtenerCategorias()
    {
        return _categorias;
    }

    public static List<Progreso> ObtenerProgresos()
    {
        return _progresos;
    }

    public static Partida ObtenerPartida(int idPartida)
    {
        return BD.ObtenerPartida(idPartida);
    }

    public static List<Partida> ObtenerPartidas(int idUsuario)
    {
        return BD.ObtenerPartidas(idUsuario);
    }

    public static int ObtenerIdUsuarioCookie(HttpContext context)
    {
        return Int32.Parse(context.Request.Cookies["idUser"]);
    }

    public static List<Usuario> ObtenerUsuarios()
    {
        return _usuarios;
    }

    public static Usuario ObtenerUsuario(string NombreUsuario, int idUsuario)
    {
        List<Usuario> _usuarios = BD.ObtenerUsuarios();
        foreach (Usuario usuario in _usuarios)
        {
            if (usuario.Nombre == NombreUsuario) { return usuario; }
            if (usuario.idUsuario == idUsuario) { return usuario; }
        }
        return null;

    }

    public static Pregunta ObtenerProximaPregunta(HttpContext context, int idCategoria)
    {
        List<Pregunta> _preguntasPosibles = new List<Pregunta>();
        List<Pregunta> _preguntasUsadas = Juego.ObtenerPreguntasUsadas(context);

        foreach (Pregunta pregunta in _preguntas)
        {
            if (pregunta.idCategoria == idCategoria && !_preguntasUsadas.Contains(pregunta))
            {
                _preguntasPosibles.Add(pregunta);
            }
        }

        if (_preguntasPosibles.Count == 0) { return null; }

        return _preguntasPosibles[_random.Next(0, _preguntasPosibles.Count)];

    }

    public static List<Respuesta> ObtenerProximasRespuestas(Pregunta pregunta)
    {
        List<Pregunta> temp = new List<Pregunta>();
        temp.Add(pregunta);
        return BD.ObtenerRespuestas(temp);
    }

    public static int EliminarPregunta(HttpContext context, int idPartida, int idPregunta, int correcta)
    {
        int actPartida = 0;
        Pregunta? preguntaUsada = null;
        foreach (Pregunta pregunta in _preguntas) { if (pregunta.idPregunta == idPregunta) { preguntaUsada = pregunta; } }
        
        if (correcta == 1)
        {
            actPartida = Juego.ActualizarProgreso(idPartida, Juego.ObtenerIdUsuarioCookie(context), BD.ObtenerPregunta(idPregunta));
        } else {
            Partida partida = BD.ObtenerPartida(idPartida);
            int otroUsuarioId = (partida.Turno == partida.idUsuario1) ? partida.idUsuario2 : partida.idUsuario1;
            BD.ActualizarTurno(idPartida, otroUsuarioId);
        }
        Juego.DescartarPregunta(context, preguntaUsada);
        return actPartida;
    }

    public static int ActualizarProgreso(int idPartida, int idUsuario, Pregunta pregunta)
    {
        int idProgreso = 0;
        Partida partida = BD.ObtenerPartida(idPartida);

        if (partida.idUsuario1 == idUsuario) {
            idProgreso = partida.idProgreso1;
        } else {
            idProgreso = partida.idProgreso2;
        }

        Progreso prog = BD.ObtenerProgreso(idProgreso);

        switch (pregunta.idCategoria)
        {
            case 1:
                BD.ActualizarArte(idProgreso);
                prog.Arte = true;
                break;
            case 2:
                BD.ActualizarCiencia(idProgreso);
                prog.Ciencia = true;
                break;
            case 3:
                BD.ActualizarDeporte(idProgreso);
                prog.Deporte = true;
                break;
            case 4:
                BD.ActualizarEntretenimiento(idProgreso);
                prog.Entretenimiento = true;
                break;
            case 5:
                BD.ActualizarGeografia(idProgreso);
                prog.Geografia = true;
                break;
            case 6:
                BD.ActualizarHistoria(idProgreso);
                prog.Historia = true;
                break;
        }

        if (prog.Arte && prog.Ciencia && prog.Deporte && prog.Entretenimiento && prog.Geografia && prog.Historia){
            BD.EliminarPartida(idPartida);
            return 1;
        }
        return 0;
    }
}