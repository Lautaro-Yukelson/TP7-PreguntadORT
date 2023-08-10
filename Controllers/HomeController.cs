﻿using System.IO.Compression;
using System.Reflection.PortableExecutable;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP7_PreguntadORT.Models;

namespace TP7_PreguntadORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        ViewBag.Categorias = Juego.ObtenerCategorias();
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        return View();
    }

    [HttpPost]
    public IActionResult Comenzar(string username, int dificultad){
        Juego.InicializarJuego();
        Juego.CargarPartida(username, dificultad);
        return RedirectToAction("Juego", "Home");
    }

    public IActionResult Jugar(){
        ViewBag.Categorias = Juego.ObtenerCategorias();
        return View();
    }

    public IActionResult Pregunta(int idCategoria){
        ViewBag.Pregunta = Juego.ObtenerProximaPregunta(idCategoria);
        if (ViewBag.Pregunta != null){
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta);
            return View();
        } else {
            return RedirectToAction("Fin", "Home");
        } 
        return View();
    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
        bool correcto = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return RedirectToAction("Jugar", "Home");
    }

    public IActionResult Fin(){
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}