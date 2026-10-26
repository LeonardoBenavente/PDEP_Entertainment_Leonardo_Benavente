import entrada.Entrada
import productora.productora

class Asistente{
    const tipoAbono
    const historialDeEntradas = []
    var dineroDisponible

    // Verifica si puede comprar una entrada y sus efectos
    method comprarEntrada(banda, fecha) {
        if (dineroDisponible > 0) {
            const entrada = new Entrada(nombreBanda = banda, fechaConcierto = fecha)  // Genera la entrada para la banda. Punto corregido en clase
            self.abonarEntrada(entrada)                             // Realiza el abono de la entrada a la productora
            historialDeEntradas.add(entrada)                       // Añade la entrada al historial
            
            return entrada  // Muestra la nueva entrada 
        } else {
            return "No tiene los fondos para comprar la entrada" // Reemplazarlo por el throw exception  // Notifica que no puede comprar la nueva entrada
        }
    }

    // Determina el abono final de la entrada
    method abonarEntrada(entrada) {
        const descuento = productora.descuentoEntrada(tipoAbono)    // Obtengo el descuento segun el tipo de abono
        const abono = entrada.precioAlPublico() - 
                      entrada.precioAlPublico() * descuento       // Calculo del abono final
        productora.cobrarEntrada(abono)                          // Abona el valor final de la entrada
        dineroDisponible -= abono                               // Resta el valor del abono al dinero disponible
    }

    // Devuelve todas las entradas del año anterior
    method entradasAnioAnterior(){
        const fechaHoy = new Date()
        const anioPasado = fechaHoy.year() - 1  // Obtiene el año anterior

        // Filtra las entradas que sean del año anterior
        return historialDeEntradas.filter({entrada => entrada.esDelAnio(anioPasado)})

    } 

    // Devuelve todas las bandas que alguna vez visito
    method bandasVisitadas() = historialDeEntradas.map({entrada => entrada.nombreBanda()}).asSet()

}