using System.IO.Compression;
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
    public IActionResult Comenzar(string username, int dificultad)
    {
        Juego.InicializarJuego();
        Juego.CargarPartida(username, dificultad);
        return RedirectToAction("Ruleta", "Home");
    }

    public IActionResult Ruleta()
    {
        ViewBag.Categorias = Juego.ObtenerCategorias();
        ViewBag.Usuario = Juego.ObtenerUsuario();
        return View();
    }

    [HttpPost]
    public IActionResult Pregunta(int idCategoria)
    {
        ViewBag.Pregunta = Juego.ObtenerProximaPregunta(idCategoria);
        List<Categoria> _categorias = Juego.ObtenerCategorias();
        foreach (Categoria categoria in _categorias) { if (categoria.idCategoria == idCategoria) { ViewBag.Categoria = categoria; } }
        if (ViewBag.Pregunta != null)
        {
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta);
            return View();
        }
        else
        {
            return RedirectToAction("Fin", "Home");
        }
    }

    [HttpPost]
    public IActionResult TerminarPregunta(int idPregunta, int correcta)
    {
        Juego.EliminarPregunta(idPregunta, correcta);
        return RedirectToAction("Ruleta", "Home");
    }

    public IActionResult Fin()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
