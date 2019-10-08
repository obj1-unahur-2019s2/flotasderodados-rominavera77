import rodados.*

class Pedido {
	var property distancia 
	var property tiempoMaximo
	var property cantidadDePasajeros
	var property coloresIncompatibles = []
	var property registroDePedidos = []
	
	method velocidadRequerida(){ return  distancia/tiempoMaximo}
	
	method loPuedoHacer(auto){ 
		return auto.velocidadMaxima() > (self.velocidadRequerida() +10)
			   and auto.capacidad() >= cantidadDePasajeros
			   and not coloresIncompatibles.contains({auto => auto.esColorImposible()})
	}
	method relajar() = tiempoMaximo + 1
	method acelerar() = tiempoMaximo - 1
	method AgregarPedido(pedido) {return  registroDePedidos.add(pedido)}
	method QuitarPedido(pedido) { return registroDePedidos.remove(pedido)}
	
	// no me salió
	method esColorImposible(color) {
    	return registroDePedidos.all({ pedido => pedido.coloresIncompatibles()})
    } 		
    
    method pedidosMalos() {
    return registroDePedidos.filter({
      pedido => not flotaDeRodados.any({ auto => pedido.loPuedoHacer() })
    })
  }		
  
  	method pedidosMalos_variante() {
    	return registroDePedidos.filter({
      	pedido => not self.loPuedeHacerAlguno(pedido)})
  }
  
  method loPuedeHacerAlguno(pedido) {
    return flotaDeRodados.any({ josecito => pedido.loPuedoHacer(josecito) })
  }
  
  method relajarPedidos() {
    // cuando son acciones no va all, va forEach
    registroDePedidos.forEach({ pedido => pedido.relajar() })
  }
  
}


/*
 *  //cuáles de los pedidos que tiene registrados
  // no puede ser satisfecho por ninguno de los autos afectados a la dependencia.  
  method pedidosMalos() {
    return pedidos.filter({
      pedido => not flota.any({ josecito => pedido.loPuedoHacer(josecito) })
    })
  }

  method pedidosMalos_variante() {
    return pedidos.filter({
      pedido => not self.loPuedeHacerAlguno(pedido)
    })
  }
  method loPuedeHacerAlguno(pedido) {
    return flota.any({ josecito => pedido.loPuedoHacer(josecito) })
  }

  //dado un color, si es cierto que todos los pedidos registrados
  //lo tienen como color incompatible.
  method esColorImposible(color) {
    return pedidos.all({ pedido =>
      /* el color esté entre los colores incompatibles del pedido */
      /* esto lo tienen que completar ustedes, recuerden el contains */
    })
  }

  //También debe ser posible, enviando un mensaje al objeto que
  // representa a una dependencia, relajar todos los pedidos que tenga registrados.
  method relajarPedidos() {
    // cuando son acciones no va all, va forEach
    pedidos.forEach({ pedido => pedido.relajar() })
  }
 */