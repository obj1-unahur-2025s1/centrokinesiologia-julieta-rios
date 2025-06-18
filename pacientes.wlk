import aparatos.*

class Paciente {
  const rutina = []
  const property edad
  var fortaleza
  var dolor
  method dolor() = dolor
  method fortaleza() = fortaleza
  method disminuirDolor(cantidad) {dolor = 0.max(dolor - cantidad)}
  method aumentarFortaleza(cantidad) {fortaleza += cantidad}
  method usar(unAparato){
    if(!self.puedeUsar(unAparato)) self.error("El paciente no puede usar ese aparato")
    unAparato.efectosDelUso(self)
  }
  method puedeUsar(unAparato) = unAparato.puedeSerUsado(self)
  method puedeHacerRutina() = rutina.all{r=>self.puedeUsar(r)}
  method realizarRutina() {
    if(!self.puedeHacerRutina()) self.error("El paciente no puede hacer la rutina")
    rutina.forEach{r=>self.usar(r)}
    }
}

class Resistente inherits Paciente{
    override method realizarRutina(){
        super()
        fortaleza = fortaleza + rutina.size()
    }
}

class Caprichoso inherits Paciente{
    method algunAparatoDeColor(unColor) = rutina.any{a=>a.color() == unColor}
    override method puedeHacerRutina() = super() and self.algunAparatoDeColor("rojo")
    override method realizarRutina() {
        super()
        super()
    }
}

class RapidaRecuperacion inherits Paciente{
    override method realizarRutina() {
        super()
        self.disminuirDolor(nivelDeDolor.cantidad())
    }
}

object nivelDeDolor{
    var property cantidad = 3
}