using System;
using System.ComponentModel;
using System.IO.Compression;
using System.Collections.Generic;
using System.Runtime.InteropServices.ComTypes;

public static class Juego
{
    private static string _username { get; set; }
    private static int _dificultad { get; set; }
    private static double _puntajeActual { get; set; }
    private static int _cantidadPreguntasCorrectas { get; set; }
    private static int _puntosDefault { get; set; } = 10;

    private static List<Pregunta> _preguntas = new List<Pregunta>();
    private static List<Respuesta> _respuestas = new List<Respuesta>();
    private static List<Categoria> _categorias = new List<Categoria>();
    private static List<Dificultad> _dificultades = new List<Dificultad>();
    private static Random _random = new Random();

    public static void InicializarJuego()
    {
        _username = "";
        _dificultad = 1;
        _puntajeActual = 0;
        _cantidadPreguntasCorrectas = 0;
    }

    public static List<Categoria> ObtenerCategorias()
    {
        _categorias = BD.ObtenerCategorias();
        return _categorias;
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        _dificultades = BD.ObtenerDificultades();
        return _dificultades;
    }

    public static void CargarPartida(string username, int dificultad)
    {
        _username = username;
        _dificultad = dificultad;
        _preguntas = BD.ObtenerPreguntas(dificultad);
        _respuestas = BD.ObtenerRespuestas(_preguntas);
    }

    public static Pregunta ObtenerProximaPregunta(int idCategoria)
    {
        if (_preguntas.Count == 0) { return null; }
        List<Pregunta> _preguntasPosibles = new List<Pregunta>();
        foreach (Pregunta pregunta in _preguntas)
        {
            if (pregunta.idCategoria == idCategoria)
            {
                _preguntasPosibles.Add(pregunta);
            }
        }
        return _preguntasPosibles[_random.Next(0, _preguntasPosibles.Count)];
    }

    public static List<Respuesta> ObtenerProximasRespuestas(Pregunta pregunta)
    {
        List<Pregunta> __preguntas = new List<Pregunta>();
        __preguntas.Add(pregunta);
        return BD.ObtenerRespuestas(__preguntas);
    }

    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        Pregunta pregunta_encontrada = new Pregunta();
        Respuesta respuesta_encontrada = new Respuesta();
        Dificultad dificultad_encontrada = new Dificultad();

        foreach (Pregunta pregunta in _preguntas) { if (pregunta.idPregunta == idPregunta) { pregunta_encontrada = pregunta; } }
        foreach (Respuesta respuesta in _respuestas) { if (respuesta.idRespuesta == idRespuesta) { respuesta_encontrada = respuesta; } }
        foreach (Dificultad dificultad in _dificultades) { if (dificultad.idDificultad == pregunta_encontrada.idDificultad) { dificultad_encontrada = dificultad; } }

        _preguntas.Remove(pregunta_encontrada);

        if (respuesta_encontrada.Correcta)
        {
            _puntajeActual += _puntosDefault * dificultad_encontrada.Multiplicador;
            return true;
        }

        return false;
    }
}