let estadoJuego = {
	bomba: false,
	doble: false,
	tick: false,
	intentos: 1,
};

function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min) + min);
}

function contador(objeto, tiempo, intervalo) {
	window.setInterval(function () {
		if (tiempo >= 0) {
			objeto.textContent = tiempo + "''";
			tiempo--;
		}
	}, intervalo * 1000);
}

function ayuda(boton) {
	if (!estadoJuego[boton.dataset.tipo]) {
		estadoJuego[boton.dataset.tipo] = true;
		switch (boton.dataset.tipo) {
			case "bomba":
				let incorrectas = document.querySelectorAll(
					".opcion[data-correcta='False']"
				);
				let incorrectasArray = Array.from(incorrectas);

				if (incorrectasArray.length >= 2) {
					let indiceRandom = Math.floor(Math.random() * incorrectasArray.length);
					let indiceRandom2 = Math.floor(Math.random() * incorrectasArray.length);

					while (indiceRandom2 === indiceRandom) {
						indiceRandom2 = Math.floor(Math.random() * incorrectasArray.length);
					}

					incorrectasArray[indiceRandom].classList.add("noValida");
					incorrectasArray[indiceRandom].disabled = true;

					incorrectasArray[indiceRandom2].classList.add("noValida");
					incorrectasArray[indiceRandom2].disabled = true;
				}
				break;
			case "doble":
				estadoJuego["intentos"]++;
				break;
			case "tick":
				const respuestaCorrecta = document.querySelector(
					".opcion[data-correcta='True']"
				);
				clickOpcion(respuestaCorrecta);
				break;
		}
	}
}

function clickOpcion(boton) {
	estadoJuego["intentos"]--;
	if (boton.dataset.correcta == "True") {
		boton.classList.toggle("correcta");
		correcta.value = 1;
		setInterval;
		enviarOpcion();
	} else {
		boton.classList.toggle("incorrecta");
		correcta.value = 0;
		if (estadoJuego["intentos"] == 0) {
			enviarOpcion();
		}
	}
}

function enviarOpcion() {
	setTimeout(() => {
		enviar.click();
	}, 1000);
}

function advanceCharBy(char, distance) {
	oldCode = char.charCodeAt(0);
	newCode = 65 + (oldCode - 65 + 26 + distance) % 26;
	const newChar = String.fromCharCode(newCode);
	return newChar;
};