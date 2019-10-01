class ChevroletCorsa {
  	var property color
  	
  	method capacidad() {return 4}
  	method velocidadMaxima() { return 150 } 
  	method peso() { return 1300 }
}

class RenaultKwid {
  	var tieneTanqueAdicional
	method capacidad() {
    	if (tieneTanqueAdicional) {return 3} 
    	else {return 4}  
  	}
  	method velocidadMaxima(){
  		if (tieneTanqueAdicional) {return 120}
  		else {return 110}
  	}
  	method peso(){ 
  		if (tieneTanqueAdicional) { return 1200 + 150}
  		else { return 1200}
  	}
  	method color() { return azul }
}


object trafic {
  	var property motor
  	var property interior
	
  	method peso() {return 4000 + motor.peso() + interior.peso()}
  	method color() { return blanco}
  	
  	
}

// una opción: clase Motor
class Motor {
	var property bataton 
	method peso(){
		if (bataton) { return 500}
		else { return 800}
	}
	method velocidadMaxima(){
		if (bataton) { return 80}
		else { return 130}
	}
}

class Interior {
	var property popular
	
	method capacidad(){ 
		if (popular) {return 12}
		else { return 5}
	}
	method peso(){
		if (popular) { return 1000}
		else { return 700}
	}
}

// otra opción: un objeto x cada motor
/*object bataton {
  method peso() { return 500 }
}
object pulenta {
  // ...
}*/

class AutoEspecial {
	var property peso
	var property color
	var property capacidad
	var property velocidadMaxima
}


// sería como el depósito, maneja una colección de rodados
class Dependencia {
	var property empleados = []
	var property flotaDeRodados = []
	
	method agregarAFlota(rodado){ flotaDeRodados.add(rodado)}
	method quitarDeFlota(rodado) { flotaDeRodados.remove(rodado)}
	method pesoTotalFlota() { 
		return flotaDeRodados.sum({rodado => rodado.peso()})
	}
	method estaBienEquipada() {
		return flotaDeRodados.size() >= 3 
		and flotaDeRodados.all({rodado => rodado.velocidadMaxima() >= 100})
	}
	method capacidadTotalEnColor(color){ 
		var flotaColor = flotaDeRodados.filter({rodado => rodado.color() == color})
		return flotaColor.sum({ rodado => rodado.capacidad()})
	}
	method colorDelRodadoMasRapido(){ 
		return flotaDeRodados.max({rodado => rodado.velocidadMaxima()}).color()
	}
	method capacidadFaltante(){
		return 	flotaDeRodados.sum({rodado => rodado.capacidad()}) - empleados.size()
	}
	method esGrande(){
		return flotaDeRodados.size() >= 5 and empleados.size() >= 40
	}
	
	
	
	
	
	
}

// recordamos: los colores con objetos vacíos, no como String
object azul {}
object rojo {}
object verde {}
object blanco {}


// un ejemplo de cómo configurar la trafic en un test
/*test "pruebo la trafic" {
  trafic.motor(bataton)
}*/