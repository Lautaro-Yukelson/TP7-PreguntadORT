using System.IO.Compression;
using System.Runtime.InteropServices.WindowsRuntime;
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
    public IActionResult Comenzar(string username, int dificultad, int categoria){
        Juego.InicializarJuego();
        Juego.CargarPartida(username, dificultad, categoria);
        return RedirectToAction("Juego", "Home");
    }

    public IActionResult Juego(){
        ViewBag.Pregunta = Juego.ObtenerProximaPregunta();
        if (ViewBag.pregunta != null){
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta);
        } else {
            return RedirectToAction("Fin", "Home");
        }
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
