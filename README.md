# PDEP_Entertainment_Leonardo_Benavente
TP Objetos Individual 26/10/2026

## Estructura

| Archivo | Contenido |
|---|---|
| `productora.wlk` | Objeto `productora`: impuesto, bandas, asistentes, entradas vendidas y reportes |
| `asistente.wlk` | Clase `Asistente` y la excepción `ExcepcionFondosInsuficientes` |
| `entrada.wlk` | Clase `Entrada` |
| `banda.wlk` | Superclase `Banda` y sus subclases `Rock`, `Trap` e `Indie` |
| `diagrama_solucion_LEONARDO_BENAVENTE` | Diagrama de clases |

## Decisiones de diseño

- **La productora es un objeto bien conocido (WKO).** Hay una sola productora en el dominio, así que no tiene sentido una clase. 
- **La entrada conoce a la banda (no solo su nombre).** Así la productora puede contar cuántas entradas vendió cada banda y obtener la banda más popular, y el asistente puede pedirle el nombre a la banda cuando lo necesita.
- **La popularidad y los gastos extra se calculan, no se guardan.** Dependen de otros datos (solos de guitarra, hielo, nombre, instrumentos), así que son métodos que son modificados utilizando override.
- **El descuento vip es propio de cada asistente.** El enunciado indica que es particular de cada uno, por eso el atributo está en `Asistente` y no en la productora. Bonificar aumenta ese descuento en 0.01.
- **La recaudación es al precio al público.** Según el enunciado, el descuento de los vip lo cubren los sponsors, así que la productora suma el precio completo de la entrada y el asistente paga el precio con su descuento.
- **Las bandas se agregan a la productora con `agregarBanda`.** No se agregan al vender una entrada porque la productora trabaja también con bandas que todavía no vendieron entradas, y su presupuesto igual se descuenta de la ganancia total.
- **La compra valida antes de hacer cambios.** Si el asistente no tiene saldo positivo se lanza la excepción al principio, así no queda ningún cambio a medias (ni dinero descontado ni entrada en el historial).


## Conceptos de la materia

### 1. Herencia
**Dónde:** `Rock`, `Trap` e `Indie` heredan de `Banda` (`banda.wlk`), y `ExcepcionFondosInsuficientes` hereda de `Exception`.
**Por qué:** todas las bandas comparten nombre, canon base y la forma de calcular el presupuesto (`canon() + gastosExtra()`). Esa lógica común se escribe una sola vez en la superclase y cada subclase define solo lo particular. Se eligió herencia y no composición porque el tipo de una banda no cambia durante la ejecución.

### 2. Clases abstractas y métodos abstractos
**Dónde:** `Banda` declara `gastosExtra()` y `popularidad()` sin contenido.
**Por qué:** no existe un comportamiento generico para estos. Al declararlos abstractos se obliga a cada subclase a implementarlos, y `Banda` no se puede instanciar.

### 3. Redefinición (override) y super
**Dónde:** cada subclase redefine `gastosExtra()` y `popularidad()`. `Trap` además redefine `canon()` usando `super()`: `override method canon() = super() * self.popularidad()`.
**Por qué:** el canon del trap es el canon normal multiplicado por su popularidad. Con `super()` se reutiliza el valor de la superclase en lugar de repetirlo. Si la popularidad es 0, la banda toca gratis.

### 4. Polimorfismo
**Dónde:** `productora.gananciaTotal()` le pide `presupuesto()` a todas sus bandas sin saber de qué tipo es cada una; a su vez, `presupuesto()` en `Banda` usa `self.canon()` y `self.gastosExtra()`, que cada subclase resuelve a su manera (method lookup).
**Por qué:** la productora trata a todas las bandas de la misma forma porque entienden los mismos mensajes. Si se agrega un nuevo tipo de banda, la productora no necesita cambiar.

### 5. Excepciones
**Dónde:** `Asistente.comprarEntrada()` lanza `ExcepcionFondosInsuficientes` si el saldo no es positivo.
**Por qué:** el enunciado pide notificar adecuadamente cuando no se puede comprar. Devolver un texto mezclaría tipos de retorno y permitiría seguir como si nada; la excepción corta la ejecución y no deja cambios a medias. Se creó una excepción propia para poder atraparla específicamente (`catch e : ExcepcionFondosInsuficientes`) sin atrapar otros errores.

### 6. Colecciones y orden superior
**Dónde:** `filter` (entradas del año anterior), `map` + `asSet` (bandas visitadas sin repetir), `sum` (presupuesto total), `count` (entradas de una banda), `max` (banda más popular), `forEach` (bonificar vips).
**Por qué:** los bloques permiten expresar qué se quiere obtener de la colección en lugar de recorrerla a mano. Se usan conjuntos (`#{}`) para las bandas y los asistentes porque no deben repetirse, y una lista para las entradas vendidas porque sí se repiten.

### 7. Objetos bien conocidos vs. clases
**Dónde:** `productora` es un WKO; `Asistente`, `Entrada` y las bandas son clases.
**Por qué:** de la productora hay una sola, mientras que hay muchos asistentes, entradas y bandas con el mismo comportamiento y distinto estado, por eso se usan clases como "molde" para instanciarlos.

### 8. Delegación y encapsulamiento
**Dónde:** el asistente no calcula el precio de la entrada sino que se lo pide (`entrada.precioAlPublico()`); la entrada le pide el impuesto a la productora; la productora le pide el presupuesto a cada banda y delega la bonificación en cada asistente (`asistente.bonificar()`).
**Por qué:** cada objeto es responsable de sus propios datos y los demás interactúan con él solo mediante mensajes, sin acceder a sus atributos.


