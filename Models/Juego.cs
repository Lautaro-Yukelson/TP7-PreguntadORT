using System;
using System.ComponentModel;
using System.IO.Compression;
using System.Collections.Generic;
using System.Runtime.InteropServices.ComTypes;

public static class Juego
{
    private static string _username { get; set; }
    private static int _dificultad { get; set; }
    private static Dificultad _dif { get; set; }
    private static double _puntajeActual { get; set; }
    private static int _cantidadPreguntasCorrectas { get; set; }
    private static int _puntosDefault { get; set; }

    private static List<Pregunta> _preguntas = new List<Pregunta>();
    private static List<Respuesta> _respuestas = new List<Respuesta>();
    private static List<Categoria> _categorias = new List<Categoria>();
    private static List<Dificultad> _dificultades = new List<Dificultad>();
    private static Random _random = new Random();

    public static void InicializarJuego()
    {
        _username = "";
        _puntajeActual = 0;
        _cantidadPreguntasCorrectas = 0;
        _puntosDefault = 10;
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

    public static string ObtenerUsuario()
    {
        return _username;
    }

    public static double ObtenerPuntajeActual()
    {
        return _puntajeActual;
    }

    public static void CargarPartida(string username, int dificultad)
    {
        _username = username;
        _dificultad = dificultad;
        _dif = BD.ObtenerDificultad(dificultad);
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
        List<Pregunta> __preguntas = new() { pregunta };
        return BD.ObtenerRespuestas(__preguntas);
    }

    public static void EliminarPregunta(int idPregunta, int correcta)
    {
        Pregunta? preguntaAEliminar = null;
        foreach (Pregunta pregunta in _preguntas)
        {
            if (pregunta.idPregunta == idPregunta)
            {
                preguntaAEliminar = pregunta;
            }
        }
        _preguntas.Remove(preguntaAEliminar);
        if (correcta == 1)
        {
            _puntajeActual += _puntosDefault * _dif.Multiplicador;
            _cantidadPreguntasCorrectas++;
        }
    }
}