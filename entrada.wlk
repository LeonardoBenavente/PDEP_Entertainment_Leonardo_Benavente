class Entrada {
    const nombreBanda
    const fechaConcierto
    const precioBase = 1000
    var impuesto  // el impuesto se define en 'productora'

    // Devuelve el nombre de la banda
    method nombreBanda() = nombreBanda

    // Devuelve la fecha del concierto
    method fechaConcierto() = fechaConcierto

    // Devuelve el año del concierto
    method anioDelConcierto() = fechaConcierto.year()

    // Indica si el concierto es del año especificado
    method esDelAnio(anio) = self.anioDelConcierto() == anio

    // Calcula el precio al público de la entrada agregando el impuesto
    method precioAlPublico() = precioBase + impuesto
}

