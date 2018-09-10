object gimenez {
	// la linea que sigue es equivalente a todo lo que está debajo.
	// le agrega al objeto: un atributo, el método para acceder, y el método para modificar.
//	var property sueldo = 15000

	var property sueldo = 15000
	var property totalCobrado = 0
	var property totalDeuda = 0
	var property totalDinero = 0
	method totalCobrado() {return totalCobrado}
	method sueldo(nuevoValor) { sueldo = nuevoValor }
	method cobrarSueldo(){
		totalCobrado += sueldo //Añade lo que cobra al total cobrado
		totalDinero = (totalDinero + sueldo - totalDeuda).max(0) 
		// Suma el sueldo al total actual, restando la deuda. Si el resultado es menor a cero, Gimenez no tiene nada
		// y el total queda en cero.
		totalDeuda = (totalDeuda - sueldo).max(0)
		//La deuda es reducida por el sueldo cobrado, hasta un máximo de cero 
		//(Estoy expresando la deuda como un número positivo que resta)
	}
	method gastar(cuanto){
		if (totalDinero < cuanto) {
			totalDeuda += cuanto - totalDinero //Sólo afecto la deuda si gasta más de lo que tiene
		}
		totalDinero = (totalDinero - cuanto).max(0) //Le resto al total el gasto, hasta un mínimo de cero
	}
}

object baigorria {
	var cantidadEmpanadasVendidas = 100
	var montoPorEmpanada = 15
	
	method venderEmpanada() {
		cantidadEmpanadasVendidas += 1
	}
 	
	method sueldo() = cantidadEmpanadasVendidas * montoPorEmpanada
	method cobrarSueldo() {}
}

object galvan {
	var dinero = 300000
	method dinero() { return dinero }
	method pagarA( empleado ) { 
		dinero -= empleado.sueldo()
		empleado.cobrarSueldo()
	}
}
