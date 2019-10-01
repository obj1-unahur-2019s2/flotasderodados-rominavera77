import rodados.*

class Pedido {
	var property distancia 
	var property tiempoMaximo
	var property cantidadDePasajeros
	var property coloresIncompatibles = #{}
	
	method velocidadRequerida(){ return  distancia/tiempoMaximo}
	method puedeSatisfacerPedido(auto){ 
		return auto.velocidadMaxima() > (self.velocidadRequerida() +10)
			   and auto.capacidad() == cantidadDePasajeros
			   and not coloresIncompatibles.contains(auto.color())
	}
	method relajar() = tiempoMaximo + 1
	method acelerar() = tiempoMaximo - 1

}
