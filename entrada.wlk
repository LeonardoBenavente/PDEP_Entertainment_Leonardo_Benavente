import productora.productora

class Entrada {
    const banda
    const fechaConcierto
    const precioBase = 1000

    // Devuelve la banda
    method banda() = banda

    // Devuelve la fecha del concierto
    method fechaConcierto() = fechaConcierto

    // Devuelve el año del concierto
    method anioDelConcierto() = fechaConcierto.year()

    // Indica si el concierto es del año especificado
    method esDelAnio(anio) = self.anioDelConcierto() == anio

    // Calcula el precio al público de la entrada agregando el impuesto
    method precioAlPublico() = precioBase + productora.impuestoEntradas() 
}

