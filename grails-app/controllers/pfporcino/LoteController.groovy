package pfporcino

import org.apache.commons.logging.LogFactory

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LoteController {

    private static final log = LogFactory.getLog(this)
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        if (params.sort != "pesoPromedio"){
            params.max = Math.min(max ?: 10, 100)
            respond Lote.list(params), model:[loteInstanceCount: Lote.count()]
        }else{
            def lista = Lote.list().sort{a,b -> a.pesoPromedio <=> b.pesoPromedio}
            if (params.order == "desc"){
                lista = Lote.list().sort{b,a -> a.pesoPromedio <=> b.pesoPromedio}
            }
            respond lista.drop(params.int('offset')?:0).take(params.int('max')?:10), model:[loteInstanceCount: Lote.count()]
        }

    }

    def show(Lote loteInstance) {
        respond loteInstance
    }

    def etapas(){

    }

    def nacimiento() {

    }

    def destete() {
        def listaEtapaAnterior = Lote.findAllByEtapaActual(Etapa.get(1))
        [listaEtapaAnterior: listaEtapaAnterior]
    }

    def preCeba() {
        def listaEtapaAnterior = Lote.findAllByEtapaActual(Etapa.get(2))
        [listaEtapaAnterior: listaEtapaAnterior]
    }

    def salida() {
        def listaEtapaAnterior = Lote.findAllByEtapaActual(Etapa.get(3))
        [listaEtapaAnterior: listaEtapaAnterior]
    }

    def actualizarCerdos(){
        println("actualizarCerdos > params: " + params)
        def fecha = params.fecha
        def lote = params.lote

        //Obtener empleado
        Binding binding = new Binding()
        GroovyShell shell = new GroovyShell(binding)
        HashMap mapa = shell.evaluate(params.empleado)
        Empleado empleado = Empleado.get(new Empleado(mapa))

        def cerdoList = Lote.get(lote).cerdos.findAll{it.estadoActual==Estado.Vivo}
        cerdoList = cerdoList.sort{it.identificacion}
        [fecha: fecha, lote: lote, cerdoList: cerdoList, empleado: empleado, tituloEtapa: params.tituloEtapa]
    }

    @Transactional
    def saveCerdos(){
        println("saveCerdos > params: " + params)

        String etapaCorrecta = params.etapaCorrecta
        def lote = Lote.get(params.lote)
        def anteriorEtapa = Etapa.get(lote.etapaActual.id)
        def nuevaEtapa = Etapa.get(lote.etapaActual.id+1)

        if (nuevaEtapa.nombre.toLowerCase() == etapaCorrecta.toLowerCase()){
            lote.etapaActual = nuevaEtapa
            lote.cantidadCerdosActual = 0
            anteriorEtapa.numeroCerdos = anteriorEtapa.numeroCerdos - params.identificacion.size()

            //Obtener empleado
            Binding binding = new Binding()
            GroovyShell shell = new GroovyShell(binding)
            HashMap mapa = shell.evaluate(params.empleado)
            Empleado empleado = Empleado.get(new Empleado(mapa))

            PesoEstadoEncabezado pesoEstadoEncabezado = new PesoEstadoEncabezado(empleado: empleado, motivo: MotivoPeso.get(1), fecha: params.fechap)
            EtapaLote etapaLote = new EtapaLote(lote: lote, etapa: nuevaEtapa, encabezado: pesoEstadoEncabezado)

            pesoEstadoEncabezado.validate()
            etapaLote.validate()

            if (pesoEstadoEncabezado.hasErrors() || etapaLote.hasErrors()){
                println(pesoEstadoEncabezado.errors)
                println(etapaLote.errors)
            }else{
                pesoEstadoEncabezado.save flush:true
                etapaLote.save flush:true

                for (int i = 0; i < params.identificacion.size(); i++){
                    def cerdo = Cerdo.findByIdentificacionAndLote(params.identificacion[i], lote)
                    cerdo.pesoActual = Float.parseFloat(params.peso[i])
                    cerdo.estadoActual = params.estado[i] as Estado
                    PesoEstadoDetalle pesoEstadoDetalle = new PesoEstadoDetalle(cerdo: cerdo, encabezado: pesoEstadoEncabezado, pesoActual: Float.parseFloat(params.peso[i]), estado: (params.estado[i] as Estado))

                    if (cerdo.estadoActual == 'Vivo' as Estado){
                        etapaLote.numeroCerdos = etapaLote.numeroCerdos+1
                        lote.cantidadCerdosActual = lote.cantidadCerdosActual+1
                        nuevaEtapa.numeroCerdos = nuevaEtapa.numeroCerdos+1
                    }

                    cerdo.validate()
                    pesoEstadoDetalle.validate()
                    if (cerdo.hasErrors() || pesoEstadoDetalle.hasErrors()){
                        println(cerdo.errors)
                        println(pesoEstadoDetalle.errors)
                    }else{
                        cerdo.save flush:true
                        pesoEstadoDetalle.save flush:true
                    }
                }
                etapaLote.save flush:true
                lote.save flush:true
                nuevaEtapa.save flush:true
                anteriorEtapa.save flush:true
                flash.message = "¡Cambio de etapa correctamente registrado!"
                redirect(action: "index")
            }
        }else{
            flash.message = "Este lote ya se encontraba en " + etapaCorrecta
            redirect(action: "index")
        }

    }

    def agregarCerdos={
        println("agregarCerdos > params: " + params)
        Lote loteInstance = Lote.get(params.id)
        EtapaLote etapaLote = EtapaLote.findByEtapaAndLote(loteInstance.etapaActual, loteInstance)
        [loteInstance: loteInstance, etapaLote: etapaLote, cerdoInstanceList: loteInstance.cerdos.sort{it.identificacion}]
    }

    @Transactional
    def agregarCerdoTabla(){
        println("agregarCerdoTabla > params: " + params)
        def lote = Lote.get(params.lote)
        Cerdo hola = new Cerdo(identificacion: params.idCerdo, lote: lote)
        if (Cerdo.get(hola)){
            render(contentType: 'text/json') {[
                    'results': "Ya existe el cerdo con identificacion " + params.idCerdo,
                    'status': "Error"
            ]}
        }else{
            Cerdo cerdo = new Cerdo(identificacion: params.idCerdo, pesoActual: Float.parseFloat(params.peso), estadoActual: params.estado as Estado, lote: lote)
            def etapa = lote.etapaActual
            def etapaLote = EtapaLote.findByEtapaAndLote(etapa, lote)
            if (cerdo.estadoActual == 'Vivo' as Estado){
                lote.cantidadCerdosActual = lote.cantidadCerdosActual+1
                etapa.numeroCerdos = etapa.numeroCerdos+1
                etapaLote.numeroCerdos = etapaLote.numeroCerdos+1
            }
            PesoEstadoDetalle pesoEstadoDetalle = new PesoEstadoDetalle(cerdo: cerdo, encabezado: PesoEstadoEncabezado.get(params.encabezado), pesoActual: Float.parseFloat(params.peso), estado: (params.estado as Estado))
            cerdo.validate()
            pesoEstadoDetalle.validate()
            if (cerdo.hasErrors() || pesoEstadoDetalle.hasErrors()){
                println(cerdo.errors)
                println(pesoEstadoDetalle.errors)
                render(contentType: 'text/json') {[
                        'results': "Failed",
                        'status': "Error"
                ]}
            }else{
                cerdo.save flush:true
                pesoEstadoDetalle.save flush:true
                lote.save flush:true
                etapa.save flush:true
                etapaLote.save flush:true

                def htmlTablaCerdos = g.render(template: "/lote/tablaCerdos", model: [cerdoInstanceList: cerdo.lote.cerdos.sort{it.identificacion}]).toString()

                render(contentType: 'text/json') {[
                        'results': htmlTablaCerdos,
                        'status': "OK"
                ]}
            }
        }
    }

    @Transactional
    def save (){
        println("save > params: " + params)
        def madre = Madre.get(params.madre.id)
        Lote loteInstance = new Lote(identificacion: params.identificacion, madre: madre, padre: Padre.get(params.padre.id), etapaActual: Etapa.get(1))
        madre.partosTotales = madre.partosTotales+1
        Binding binding = new Binding()
        GroovyShell shell = new GroovyShell(binding)
        HashMap mapa = shell.evaluate(params.empleado)
        Empleado empleado = Empleado.get(new Empleado(mapa))

        PesoEstadoEncabezado pesoEstadoEncabezado = new PesoEstadoEncabezado(empleado: empleado, motivo: MotivoPeso.get(1), fecha: params.fecha)
        EtapaLote etapaLote = new EtapaLote(lote: loteInstance, etapa: Etapa.get(1), encabezado: pesoEstadoEncabezado)
        /*loteInstance.etapaActual = Etapa.get(1)*/

        if (Lote.get(params.identificacion)){
            flash.error = "Ya existe un lote con la identificacion: " + params.identificacion
            render(view: "nacimiento", model: [loteInstance: loteInstance, pesoEstadoEncabezado: pesoEstadoEncabezado, empleado: empleado])
        }else{
            loteInstance.validate()
            empleado.validate()
            pesoEstadoEncabezado.validate()
            etapaLote.validate()
            if (loteInstance.hasErrors() || empleado.hasErrors() || pesoEstadoEncabezado.hasErrors() || etapaLote.hasErrors()){
                println("loteInstance: " + loteInstance.errors)
                render(view: "nacimiento", model: [loteInstance: loteInstance, pesoEstadoEncabezado: pesoEstadoEncabezado, empleado: empleado])
            }else{
                loteInstance.save flush:true
                pesoEstadoEncabezado.save flush:true
                etapaLote.save flush:true
                redirect(action: agregarCerdos, id: loteInstance.id)
            }
        }



        /*if (loteInstance == null) {
            notFound()
            return
        }

        if (loteInstance.hasErrors()) {
            respond loteInstance.errors, view:'create'
            return
        }

        loteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lote.label', default: 'Lote'), loteInstance.id])
                redirect loteInstance
            }
            '*' { respond loteInstance, [status: CREATED] }
        }*/
    }

    def edit(Lote loteInstance) {
        respond loteInstance
    }

    @Transactional
    def update(Lote loteInstance) {
        if (loteInstance == null) {
            notFound()
            return
        }

        if (loteInstance.hasErrors()) {
            respond loteInstance.errors, view:'edit'
            return
        }

        loteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Lote.label', default: 'Lote'), loteInstance.id])
                redirect loteInstance
            }
            '*'{ respond loteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Lote loteInstance) {

        if (loteInstance == null) {
            notFound()
            return
        }

        loteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Lote.label', default: 'Lote'), loteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lote.label', default: 'Lote'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
