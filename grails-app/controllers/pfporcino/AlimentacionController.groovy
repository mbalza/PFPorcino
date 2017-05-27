package pfporcino

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AlimentacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Alimentacion.list(params), model:[alimentacionInstanceCount: Alimentacion.count()]
    }

    def show = {
        params.fecha = params.fecha instanceof Date? params.fecha : new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse( params.fecha)
        println("show > params: " + params)
        def alimentacionInstance = Alimentacion.get(new Alimentacion(params))
        if(!alimentacionInstance) {
            println "no llegó al show"
            flash.message = "Registro de alimentacion no encontrado con ${params}"
            redirect(action:index())
        }
        else{
            respond alimentacionInstance
        }
    }

    def create() {
        respond new Alimentacion(params)
    }

    @Transactional
    def save() {
        println("save > params: " + params)
        Binding binding = new Binding()
        GroovyShell shell = new GroovyShell(binding)
        HashMap mapa = shell.evaluate(params.empleado1)
        Empleado empleado = Empleado.get(new Empleado(mapa))
        params.empleado = empleado
        Alimentacion alimentacionInstance = new Alimentacion([fecha: params.fecha, formula: params.formula, empleado: params.empleado, cantidad: params.cantidad ])
        switch(params.etapa){
            case "Nacimiento":
                alimentacionInstance.lote = Lote.get(params.loteNacimiento)
                break

            case "Destete":
                alimentacionInstance.lote = Lote.get(params.loteDestete)
                break

            case "Pre-ceba":
                alimentacionInstance.lote = Lote.get(params.lotePreCeba)
                break

            case "Salida":
                alimentacionInstance.lote = Lote.get(params.loteSalida)
                break

            default:

                break
        }

        if (Alimentacion.findByLoteAndFecha(alimentacionInstance.lote, params.fecha)) {
            flash.error = "Ya se registró alimentación para el lote '" + alimentacionInstance.lote + "' en la fecha " + new SimpleDateFormat("dd/MM/yyyy").format(alimentacionInstance.fecha)
            render(view: "create")
        }else{
            alimentacionInstance.validate()
            if (alimentacionInstance == null) {
                println "muere aquí"
                notFound()
                return
            }

            if (alimentacionInstance.hasErrors()) {
                println "muere o aquí, errores: " + alimentacionInstance.errors
                respond alimentacionInstance.errors, view:'create'
                return
            }

            alimentacionInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = "¡Alimentación registrada!"
                    redirect (action: "show", params: alimentacionInstance.getPK())
                }
                '*' { respond alimentacionInstance, [status: CREATED] }
            }
        }

    }

    def edit(Alimentacion alimentacionInstance) {
        respond alimentacionInstance
    }

    @Transactional
    def update(Alimentacion alimentacionInstance) {
        if (alimentacionInstance == null) {
            notFound()
            return
        }

        if (alimentacionInstance.hasErrors()) {
            respond alimentacionInstance.errors, view:'edit'
            return
        }

        alimentacionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Alimentacion.label', default: 'Alimentacion'), alimentacionInstance.id])
                redirect alimentacionInstance
            }
            '*'{ respond alimentacionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Alimentacion alimentacionInstance) {

        if (alimentacionInstance == null) {
            notFound()
            return
        }

        alimentacionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Alimentacion.label', default: 'Alimentacion'), alimentacionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'alimentacion.label', default: 'Alimentacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
