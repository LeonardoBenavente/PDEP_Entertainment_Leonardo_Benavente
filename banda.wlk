class Banda{
    const nombre
    const canonBase = 1000000

    // Nombre
    method nombre() = nombre

    // Canon
    method canon() = canonBase 

    // Gastos extra
    method gastosExtra()

    // Popularidad
    method popularidad()

    // Calcula el valor del presupuesto
    method presupuesto() = self.canon() + self.gastosExtra() 

}

class Rock inherits Banda{
    const solosDeGuitarra

    // Las bandas de rock tienen gastos extras fijos de 10000
    override method gastosExtra() = 10000

    // Define la popularidad según la cantidad de solos de guitarra
    override method popularidad() = solosDeGuitarra * 100
    
}

class Trap inherits Banda{
    const tieneHielo

    // Modifico el valor que retorna al llamar a canon
    override method canon() = super() * self.popularidad()

    // Las bandas de trap no tienen gastos extra
    override method gastosExtra() = 0

    // Define la popularidad dependiendo si tienen hielos o no
    override method popularidad() = self.verificarHielos()

    // Verifica si la banda tiene hielos
    method verificarHielos(){
        if(tieneHielo)
            return 1000
        else
            return 0
    }
}

class Indie inherits Banda{
    const cantidadInstrumentos

    // Las bandas indie varian el gasto segun la cantidad de instrumentos
    override method gastosExtra() = cantidadInstrumentos * 500

    // La popularidad depende de la longitud del nombre
    override method popularidad() = nombre.length() * 3.14

}