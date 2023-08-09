function contador(objeto, tiempo, intervalo){
    window.setInterval(function(){
        if(tiempo >= 0){
            objeto.textContent = tiempo + "''";
            tiempo--;
        }
    }, intervalo * 1000);
}

document.addEventListener("DOMContentLoaded", () => {
    let objeto = document.getElementById("contador")
    contador(objeto, 29, 1);
})