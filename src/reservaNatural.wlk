import especies.*

object reserva {
	const habitats = []
	
	method agregarHabitat(habitat){habitats.add(habitat)}
	method habitadConMayorBiomasa()=habitats.max({h=>h.biomasaTotal()})
	method biomasaTotal()=habitats.sum({h=>h.biomasaTotal()})
	method habitatsNoEstanEnEquilibrio()=habitats.filter({h=>!h.estaEnEquilibrio()})
	method estaEnTodosLosHabitats(especieAComparar)=habitats.all({h=>h.estaEnLaReserva(especieAComparar)})
}

class Habitat {
	const seresVivos = []
	
	method agregarSerVivo(serVivo)=seresVivos.add(serVivo)
	method biomasaTotal()=seresVivos.sum({s=>s.biomasa()})
	method cantidadDeEjemplaresPequenos()=seresVivos.count({s=>s.esPequenio()})
	method cantidadDeEjemplaresGrandes()=seresVivos.count({s=>s.esGrande()})
	method hayAlgunMediano()=seresVivos.any({s=>s.esMediano()})
	method estaEnEquilibrio()=
	self.cantidadDeEjemplaresGrandes()<self.cantidadDeEjemplaresPequenos().div(3) && 
	self.hayAlgunMediano()
	method estaEnLaReserva(especieAComparar)=seresVivos.any({s=>s.especie()==especieAComparar})
	method producirIncendio(){
		seresVivos.forEach({s=>s.estarEnIncendio()})
		self.removerTodosLosMuertos(self.todosLosMuertos())
	}
	method removerTodosLosMuertos(lista){
		seresVivos.removeAll(lista)
	}
	method todosLosMuertos()=seresVivos.filter({s=>!s.estaVivo()})
	method sacarDeLaReserva(serVivo){seresVivos.remove(serVivo)}
}
