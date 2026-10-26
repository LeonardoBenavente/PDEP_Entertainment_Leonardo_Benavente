class Entrada {
    const nombreBanda
    const fechaConcierto
    const precioBase = 1000
    var impuesto  // el impuesto se define en 'productora'

    // Calula el precio final de la entrada agregando el impuesto
    method precioAlPublico() = precioBase + impuesto

}

