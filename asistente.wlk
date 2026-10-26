import entrada.Entrada
import productora.productora

class Asistente{
    const tipoAbono
    const historialDeEntradas = []
    var dineroDisponible

    // Verifica si puede comprar una entrada y sus efectos
    method comprarEntrada(banda, fecha) {
        if (dineroDisponible > 0) {
            const entrada = productora.generarEntrada(banda, fecha)  // Obtiene la entrada de la productora
            self.abonarEntrada(entrada)                             // Realiza el abono de la entrada a la productora
            historialDeEntradas.add(entrada)                       // Añade la entrada al historial
            
            return entrada  // Muestra la nueva entrada 
        } else {
            return "No tiene los fondos para comprar la entrada"  // Notifica que no puede comprar la nueva entrada
        }
    }


    // Determina el abono final de la entrada
    method abonarEntrada(entrada) {
        const descuento = productora.descuentoEntrada(tipoAbono)                          // Obtengo el descuento segun el tipo de abono
        const abono = entrada.precioAlPublico() - entrada.precioAlPublico() * descuento  // Calculo del abono final
        productora.cobrarEntrada(abono)                                                 // Abona el valor final de la entrada
        dineroDisponible -= abono                                                      // Resta el valor del abono al dinero disponible
    }

}