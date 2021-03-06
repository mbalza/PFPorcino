package pfporcino

class InicioController {

    def index() {
        ArrayList listaLoteVacunaFaltante = new ArrayList()
        ArrayList listaLoteVacunaFutura = new ArrayList()
        ArrayList listaLoteCambioFaltante = new ArrayList()
        ArrayList listaLoteCambioFuturo = new ArrayList()
        Lote.list().each {
            int diasEtapaActual = new Date() - EtapaLote.findByEtapaAndLote(it.etapaActual, it).encabezado.fecha
            if (diasEtapaActual > it.etapaActual.numeroDias){
                listaLoteCambioFaltante.add([lote: it, numDiasPasados: diasEtapaActual-it.etapaActual.numeroDias, etapaSiguiente: Etapa.get(it.etapaActual.id+1)])
            }else if (it.etapaActual.numeroDias-diasEtapaActual < 2){
                listaLoteCambioFuturo.add([lote: it, numDiasFaltantes: it.etapaActual.numeroDias-diasEtapaActual, etapaSiguiente: Etapa.get(it.etapaActual.id+1)])
            }
            int dias = new Date() - EtapaLote.findByLoteAndEtapa(it, Etapa.get(1)).encabezado.fecha
            println("--------------------------------------------------------")
            println("Número de días desde que el lote "+it.id+" nació: "+dias)
            def vacunasSupuestas = VacunaEspecificacion.findAll{numeroDias < dias}
            def vacunasFuturas = VacunaEspecificacion.findAll{numeroDias >= dias && numeroDias <= dias + 2}
            if (vacunasSupuestas){
                vacunasSupuestas.each { vacuna ->
                    def fueAplicada = VacunaLote.findByLoteAndVacuna(it, vacuna)
                    if (fueAplicada){
                        println("Vacuna "+vacuna.vacuna.Nombre+" fue aplicada al lote "+it.id)
                    }else{
                        listaLoteVacunaFaltante.add([lote: it, vacuna: vacuna.vacuna.Nombre, numDiasPasados: dias-vacuna.numeroDias, etapa: it.etapaActual.id])
                        println("Vacuna "+vacuna.vacuna.Nombre+" falta por aplicar al lote "+it.id)
                    }
                }
            }
            if (vacunasFuturas){
                vacunasFuturas.each { vacuna ->
                    def fueAplicada = VacunaLote.findByLoteAndVacuna(it, vacuna)
                    if (fueAplicada){
                        println("Vacuna "+vacuna.vacuna.Nombre+" fue aplicada al lote "+it.id)
                    }else{
                        listaLoteVacunaFutura.add([lote: it, vacuna: vacuna.vacuna.Nombre, numDiasFaltantes: (vacuna.numeroDias-dias), etapa: it.etapaActual.id])
                        println("Vacuna "+vacuna.vacuna.Nombre+" debe ser aplicada al lote "+it.id+" en "+(vacuna.numeroDias-dias)+" dias.")
                    }
                }
            }
        }

        [listaLoteVacunaFaltante: listaLoteVacunaFaltante.sort{- it.numDiasPasados}, listaLoteVacunaFutura: listaLoteVacunaFutura.sort{it.numDiasFaltantes}, listaLoteCambioFaltante: listaLoteCambioFaltante, listaLoteCambioFuturo: listaLoteCambioFuturo]
    }
}
