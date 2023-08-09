function contador(objeto, tiempo, intervalo){
    window.setInterval(function(){
        objeto.textContent = tiempo + "''";
        tiempo--;
    }, intervalo * 1000);
}

document.addEventListener("DOMContentLoaded", () => {
    let objeto = document.getElementById("contador")
    contador(objeto, 5, 1);
})