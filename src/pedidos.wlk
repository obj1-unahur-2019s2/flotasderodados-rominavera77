import rodados.*

class Pedido {
	var property distancia 
	var property tiempoMaximo
	var property cantidadDePasajeros
	var property coloresIncompatibles = #{}
	var property registroDePedidos = []
	
	method velocidadRequerida(){ return  distancia/tiempoMaximo}
	method puedeSatisfacerPedido(auto){ 
		return auto.velocidadMaxima() > (self.velocidadRequerida() +10)
			   and auto.capacidad() == cantidadDePasajeros
			   and not coloresIncompatibles.contains(auto.color())
	}
	method relajar() = tiempoMaximo + 1
	method acelerar() = tiempoMaximo - 1
	method AgregarPedido(pedido) {return  registroDePedidos.add(pedido)}
	method QuitarPedido(pedido) { return registroDePedidos.remove(pedido)}
		
}
