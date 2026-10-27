import entrada.Entrada
import productora.productora

class Asistente{
    const tipoAbono
    var descuento = 0
    const historialDeEntradas = []
    var dineroDisponible

    // Devuelve el descuento segun el tipo de abono
    method descuento() = if (tipoAbono == "vip") descuento else 0

    // Aumenta un 1% el descuento si el abono es vip
    method bonificar() {
        if (tipoAbono == "vip") descuento += 0.01
    }

    // Verifica si puede comprar una entrada y sus efectos
    method comprarEntrada(banda, fecha) {
        // Si no tiene los fondos suficientes, lanza una excepción
        if(dineroDisponible <= 0)
            throw new ExcepcionFondosInsuficientes(message = "No dispone de los fondos para comprar la entrada")

        const entrada = new Entrada(banda = banda, fechaConcierto = fecha)  // Genera la entrada para la banda. Punto corregido en clase
        self.abonarEntrada(entrada)                             // Realiza el abono de la entrada a la productora
        historialDeEntradas.add(entrada)                       // Añade la entrada al historial       
    }

    // Determina el abono final de la entrada
    method abonarEntrada(entrada) {
        const abono = entrada.precioAlPublico() * (1 - self.descuento())  // Calculo del abono final
        productora.cobrarEntrada(entrada)                        // La productora registra la venta
        dineroDisponible -= abono                               // Resta el valor del abono al dinero disponible
    }

    // Devuelve todas las entradas del año anterior
    method entradasAnioAnterior(){
        const fechaHoy = new Date()
        const anioPasado = fechaHoy.year() - 1  // Obtiene el año anterior

        // Filtra las entradas que sean del año anterior
        return historialDeEntradas.filter({entrada => entrada.esDelAnio(anioPasado)})

    } 

    // Devuelve todas las bandas que alguna vez visitó
    method bandasVisitadas() = historialDeEntradas.map({entrada => entrada.banda().nombre()}).asSet()

}

// Excepción para los fondos insuficientes
class ExcepcionFondosInsuficientes inherits Exception{}