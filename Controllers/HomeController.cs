using System.Net;
using System.Threading.Tasks;
using System.Security;
using System.Threading;
using System.Runtime.InteropServices.ComTypes;
using System.Resources;
using System;
using Newtonsoft.Json;
using System.Diagnostics;
using System.IO.Compression;
using TP7_PreguntadORT.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.Reflection.Metadata;
using System.Runtime.Intrinsics.X86;
using System.Reflection.PortableExecutable;


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
        Juego.IniciarServidor();
        return View();
    }

    public IActionResult IniciarSesion(string usuario, string contrasena)
    {
        Juego.IniciarServidor();
        int log = Juego.IniciarSesion(usuario, contrasena);

        CookieOptions logStatus = new CookieOptions { Expires = DateTime.Now.AddDays(7) };
        Response.Cookies.Append("logStatus", log.ToString(), logStatus);

        if (log != 1) { return RedirectToAction("Index", "Home"); }

        Usuario user = Juego.ObtenerUsuario(usuario, 0);
        Juego.CrearCookies(HttpContext, user);

        return RedirectToAction("Multijugador", "Home");
    }

    public IActionResult CrearCuenta(string usuario, string contrasena)
    {
        Juego.CrearCuenta(usuario, contrasena);
        return RedirectToAction("IniciarSesion", "Home", new { usuario = usuario, contrasena = contrasena });
    }

    public IActionResult CrearPartida(int idUsuarioVS){
        Juego.CrearPartida(Juego.ObtenerIdUsuarioCookie(HttpContext), idUsuarioVS);
        return RedirectToAction("Multijugador", "Home");
    }

    public IActionResult CerrarSesion()
    {
        foreach (var cookie in Request.Cookies.Keys) { Response.Cookies.Delete(cookie); }
        return RedirectToAction("Index", "Home");
    }

    public IActionResult Multijugador()
    {
        Juego.IniciarServidor();

        ViewBag.UsuarioLOG = Juego.ObtenerIdUsuarioCookie(HttpContext);
        ViewBag.Partidas = Juego.ObtenerPartidas(Juego.ObtenerIdUsuarioCookie(HttpContext));
        ViewBag.Usuarios = Juego.ObtenerUsuarios();
        ViewBag.Progresos = Juego.ObtenerProgresos();
        ViewBag.Categorias = Juego.ObtenerCategorias();
        ViewBag.Preguntas = Juego.ObtenerPreguntasUsadas(HttpContext);
        ViewBag.Context = HttpContext;
        return View();
    }

    public IActionResult Ruleta(int idPartida)
    {
        Juego.IniciarServidor();
        Partida partida = Juego.ObtenerPartida(idPartida);
        Usuario user1 = Juego.ObtenerUsuario("", partida.idUsuario1);
        Usuario user2 = Juego.ObtenerUsuario("", partida.idUsuario2);

        ViewBag.Partida = partida;
        ViewBag.Progresos = Juego.ObtenerProgresos();

        ViewBag.Usuario1 = user1;
        ViewBag.Usuario2 = user2;

        ViewBag.Context = HttpContext;

        ViewBag.Categorias = Juego.ObtenerCategorias();
        return View();
    }

    public IActionResult Pregunta(int idPartida, int idCategoria)
    {
        Juego.IniciarServidor();

        ViewBag.Pregunta = Juego.ObtenerProximaPregunta(HttpContext, idCategoria);
        ViewBag.Categoria = BD.ObtenerCategoria(idCategoria);
        ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta);

        ViewBag.Partida = Juego.ObtenerPartida(idPartida);
        return View();
    }

    [HttpPost]
    public IActionResult TerminarPregunta(int idPartida, int idPregunta, int correcta)
    {   
        Partida partida = Juego.ObtenerPartida(idPartida);
        int temp = Juego.EliminarPregunta(HttpContext, idPartida, idPregunta, correcta);
        if (temp == 1) {
            Usuario? oponente = null;
            int idUsuarioCookie = Juego.ObtenerIdUsuarioCookie(HttpContext);
            if (idUsuarioCookie == partida.idUsuario2){
                oponente = Juego.ObtenerUsuario("", partida.idUsuario1);
            } else if (idUsuarioCookie == partida.idUsuario1){
                oponente = Juego.ObtenerUsuario("", partida.idUsuario2);
            }
            return RedirectToAction("Fin", new {oponente = oponente.Nombre});
        } else if (temp == 0){
            return RedirectToAction("Multijugador", "Home");
        }
        else { 
            return RedirectToAction("Ruleta", new {idPartida}); 
        }
    }

    public IActionResult Fin(string oponente = "empty"){
        ViewBag.Oponente = oponente;
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
