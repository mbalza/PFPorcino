package pfporcino

class InicioController {

    def index() {
        ArrayList listaLoteVacunaFaltante = new ArrayList()
        Lote.list().each {
            int dias = new Date() - EtapaLote.findByLoteAndEtapa(it, Etapa.get(1)).encabezado.fecha
            println("--------------------------------------------------------")
            println("Número de días desde que el lote "+it.id+" nació: "+dias)
            def vacunasSupuestas = VacunaEspecificacion.findAll{numeroDias < dias}
            if (vacunasSupuestas){
                vacunasSupuestas.each { vacuna ->
                    def fueAplicada = VacunaLote.findByLoteAndVacuna(it, vacuna)
                    if (fueAplicada){
                        println("Vacuna "+vacuna.vacuna.Nombre+" fue aplicada al lote "+it.id)
                    }else{
                        listaLoteVacunaFaltante.add([lote: it, vacuna: vacuna, numDiasPasados: dias-vacuna.numeroDias])
                        println("Vacuna "+vacuna.vacuna.Nombre+" falta por aplicar al lote "+it.id)
                    }
                }
            }
        }
        [listaLoteVacunaFaltante: listaLoteVacunaFaltante]
    }
}
