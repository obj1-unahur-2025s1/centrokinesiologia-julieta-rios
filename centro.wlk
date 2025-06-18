import pacientes.*
import aparatos.*

object centro{
    const aparatos = []
    const pacientes = #{}
    method agregarPaciente(unPaciente){
        pacientes.add(unPaciente)
    }
    method agregarAparato(unAparato){
        aparatos.add(unAparato)
    }
    method coloresDeAparatos() = aparatos.map{a=>a.color()}.asSet()
    method pacientesMenoresA8Años() = pacientes.filter{p=>p.edad() < 8}
    method cantNoCumplenRutina() = pacientes.count{p=>!p.puedeHacerRutina()}
    method optimasCondiciones() = aparatos.any{a=>a.necesitaMantenimiento()}
    method estaComplicado() = aparatos.size() / 2 <= self.necesitanMantenimiento() 
    method necesitanMantenimiento() = aparatos.count{a=>a.necesitaMantenimiento()}
    method visitaTecnico(){
        aparatos.forEach{a=>a.hacerMantenimiento()}
    }
}