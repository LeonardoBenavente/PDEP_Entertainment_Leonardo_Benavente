object productora{
    var dineroRecaudado = 0
    var property impuestoEntradas = 100
    const bandasDisponibles = #{}
    const asistentes = #{}
    const entradasVendidas = []

    // Se guarda el valor del precio al público (sponsor lo cubren) y se guarda la entrada
    method cobrarEntrada(entrada){
        dineroRecaudado += entrada.precioAlPublico()
        entradasVendidas.add(entrada)
    }

    // Agrega una banda a la lista de disponibles
    method agregarBanda(banda){
        bandasDisponibles.add(banda)
    }

    // Agrega un asistente
    method agregarAsistente(asistente){
        asistentes.add(asistente)
    }

    // Bonifica a todos los asistentes que sean vips
    method bonificarVips(){
        asistentes.forEach({asistente => asistente.bonificar()})
    }

    // *** Métodos finales ***

    // Define la ganancia total como la plata recaudada menos el presupuesto de las bandas
    method gananciaTotal() = dineroRecaudado - bandasDisponibles.sum({banda => banda.presupuesto()})

    // Devuelve la cantidad de entradas vendidas
    method entradasVendidas() = entradasVendidas.size()

    // Define la banda más popular
    method bandaMasPopular() = bandasDisponibles.max({banda => self.entradasVendidasDe(banda)})

    // Obtiene la cantidad de entradas vendidas de una banda en particular
    method entradasVendidasDe(banda) = entradasVendidas.count({entrada => entrada.banda() == banda})
}
