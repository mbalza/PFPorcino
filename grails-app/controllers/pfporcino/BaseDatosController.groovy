package pfporcino

import java.text.SimpleDateFormat
import java.text.DateFormat

class BaseDatosController {

    def index() {
        def vivosNacimiento = Etapa.findById(1).numeroCerdos
        def vivosDestete = Etapa.findById(2).numeroCerdos
        def vivosPreceba = Etapa.findById(3).numeroCerdos
        def vivosSalida = Etapa.findById(4).numeroCerdos

        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

        Date today = new Date();

        Date todayWithZeroTime = formatter.parse(formatter.format(today));

        Date fechaInicial = params.fechaInicial?: todayWithZeroTime-30
        Date fechaFinal = params.fechaFinal?: todayWithZeroTime
        def totalFinca = vivosNacimiento+vivosDestete+vivosPreceba
        def totalPadres = Padre.count + Madre.count
        def lotesNacimiento = EtapaLote.findAllByEtapa(Etapa.get(1))
        def partosRangoFecha = 0
        def vivosNacimientos = 0
        def muertosNacimientos = 0
        def momiasNacimientos = 0
        lotesNacimiento.each {
            if (it.encabezado.fecha >= fechaInicial && it.encabezado.fecha <= fechaFinal){
                partosRangoFecha += 1
                vivosNacimientos += PesoEstadoDetalle.findAllByEncabezado(it.encabezado).findAll{it.estado=='Vivo' as Estado}.size()
                muertosNacimientos += PesoEstadoDetalle.findAllByEncabezado(it.encabezado).findAll{it.estado=='Muerto' as Estado}.size()
                momiasNacimientos += PesoEstadoDetalle.findAllByEncabezado(it.encabezado).findAll{it.estado=='Momia' as Estado}.size()
            }
        }
        def totalNacimientos = vivosNacimientos+muertosNacimientos+momiasNacimientos
        double promedioCerdosParto = vivosNacimientos/partosRangoFecha
        promedioCerdosParto = promedioCerdosParto.round(2)

        [fechaInicial: fechaInicial, fechaFinal: fechaFinal, vivosNacimiento: vivosNacimiento, vivosDestete: vivosDestete, vivosPreceba: vivosPreceba, vivosSalida: vivosSalida, totalFinca: totalFinca, totalPadres: totalPadres, partosRangoFecha: partosRangoFecha, vivosNacimientos: vivosNacimientos, muertosNacimientos: muertosNacimientos, momiasNacimientos: momiasNacimientos, totalNacimientos: totalNacimientos, promedioCerdosParto: promedioCerdosParto]
    }
}
