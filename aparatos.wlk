import pacientes.*

class Aparato{
  var property color = "blanco"
  method efectosDelUso(unPaciente) 
  method puedeSerUsado(paciente)
  method necesitaMantenimiento() 
  method recibirMantenimiento()
}

class Magneto inherits Aparato{
  var imantacion = 800
  override method efectosDelUso(unPaciente) {
    unPaciente.disminuirDolor(unPaciente.dolor()*0.1)
    imantacion = 0.max(imantacion - 1)
  }
  override method puedeSerUsado(paciente) = true
  override method necesitaMantenimiento() = imantacion < 100
  override method recibirMantenimiento() {
    imantacion = 800.min(imantacion + 500)
  }
}

class Bicicleta inherits Aparato{
  var desajustes = 0
  var perdidasDeAceite = 0
  override method efectosDelUso(unPaciente){
    if (unPaciente.dolor() > 30) desajustes += 1
    if (unPaciente.edad().between(30,50)) perdidasDeAceite += 1
    unPaciente.disminuirDolor(4)
    unPaciente.aumentarFortaleza(3)
  }
  override method puedeSerUsado(unPaciente) = unPaciente.edad() > 8
  override method necesitaMantenimiento() = desajustes >= 10 || perdidasDeAceite >= 5
  override method recibirMantenimiento(){
    desajustes = 0
    perdidasDeAceite = 0
  }
}

class Minitramp inherits Aparato{
  override method efectosDelUso(paciente){
    paciente.aumentarFortaleza(paciente.edad()*0.1)
  }
  override method puedeSerUsado(paciente) = paciente.dolor() < 20
  override method necesitaMantenimiento() = false
  override method recibirMantenimiento() {}
}
