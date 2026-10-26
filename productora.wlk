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

    // Genera una entrada y la devuelva al asistente
    method generarEntrada(banda, fecha) {
      const entrada = new Entrada(nombreBanda = banda, fechaConcierto = fecha, impuesto = impuestoEntradas)
      return entrada
    }

    // Añade el valor del abono al dinero recaudado
    method cobrarEntrada(abono){
        dineroRecaudado += abono
    }
}