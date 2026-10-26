import entrada.Entrada

object productora{
    var dineroRecaudado = 0
    var property impuestoEntradas = 100
    var descuento = 0.1

    // Modifica el porcentaje de descuento de las entradas
    method nuevoDescuento(porcentaje){
        descuento = porcentaje
    }

    // Define el descuento de la entrada segun el tipo de abono
    method descuentoEntrada(tipoAbono) {
        if(tipoAbono == "vip")    // Si es 'vip', hay dto
            return descuento
        else                     // Caso contrario, no hay
            return 0
    }

    // Añade el valor del abono al dinero recaudado
    method cobrarEntrada(abono){
        dineroRecaudado += abono
    }
}