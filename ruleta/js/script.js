function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min) + min);
}

function girar() {
	let valor = getRandomInt(0, 360);
	calcular(valor);

	function calcular(valor) {
		var m = 360 / 7 / 2;
		ruleta.style.transform = "rotate(" + (0 - valor) + "deg)";
		setTimeout(() => {
			switch (true) {
				case valor > 0 && valor <= m:
					alert("Historia");
					break;
				case valor > m && valor <= m * 3:
					alert("Deportes");
					break;
				case valor > m * 3 && valor <= m * 5:
					alert("Arte");
					break;
				case valor > m * 5 && valor <= m * 7:
					alert("Entretenimiento");
					break;
				case valor > m * 7 && valor <= m * 9:
					alert("Corona");
					break;
				case valor > m * 9 && valor <= m * 11:
					alert("Geografia");
					break;
				case valor > m * 11 && valor <= m * 13:
					alert("Ciencias");
					break;
				default:
					alert("Historia");
					break;
			}
		}, 2500);
	}
}

const ruleta = document.querySelector("#ruleta");
const boton = document.querySelector("#boton");
boton.addEventListener("click", girar);
