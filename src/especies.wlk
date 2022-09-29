class EspecieFauna {
	const property pesoReferencia
	const property coeficiente

}

class EspecieFlora {
	const property alturaReferencia=10
}

class Animal {
	const property especie
	var peso
	const formaLocomocion
	var estaVivo=true
	
	method biomasa()= (peso**2).div(especie.coeficiente())
	method esGrande()= peso>especie.pesoReferencia()*2
	method esPequenio()=peso < especie.pesoReferencia().div(2)
	method esMediano()= !(self.esGrande() or self.esPequenio())
	method estarEnIncendio(){
		if (formaLocomocion.seSalva(self)){
			peso=peso-(peso*0.10)
		}
		else{
			estaVivo=false
		}
	}
	method estaVivo()=estaVivo
	method peso()=peso
}

class Planta {
	const property especie
	var  altura
	var  estaVivo=true
	
	method biomasa()= altura*2
	method esGrande()=altura>especie.alturaReferencia()
	method esPequenio()=!self.esGrande()
	method esMediano()=false
	method estarEnIncendio(){
		if (self.esPequenio()){
			estaVivo=false
		}
		else{
			altura= altura-5
		}
	}
	method estaVivo()=estaVivo
	method altura()=altura
}


object volar {method seSalva(animal) = animal.esGrande()}
object nadar {method seSalva(_) = true}
object correr{method seSalva(animal)=animal.esMediano()}
object quedarseQuieto{method seSalva(_)= false}