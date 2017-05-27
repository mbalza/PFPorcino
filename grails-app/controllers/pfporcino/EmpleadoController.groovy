package pfporcino



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmpleadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Empleado.list(params), model:[empleadoInstanceCount: Empleado.count()]
    }

    def show = {
        def empleadoInstance = Empleado.get(new Empleado(params))
        if(!empleadoInstance) {
            flash.message = "Empleado no encontrado con ${params}"
            redirect(action:index())
        }
        else{
            respond empleadoInstance
        }
    }


    def create() {
        respond new Empleado(params)
    }

    @Transactional
    def save(Empleado empleadoInstance) {
        if (Empleado.findByTipoDocumentoAndNumDocumento(params.tipoDocumento, params.numDocumento)){
            flash.error = "Ya existe un empleado con el documento: " + params.tipoDocumento + ": " + params.numDocumento
            render(view: "create", model: [empleadoInstance: empleadoInstance])
        }else{
            if (empleadoInstance == null) {
                notFound()
                return
            }

            if (empleadoInstance.hasErrors()) {
                respond empleadoInstance.errors, view:'create'
                return
            }

            empleadoInstance.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = "¡Empleado creado!"
                    redirect (action: "show", params: empleadoInstance.getPK())
                }
                '*' { respond empleadoInstance, [status: CREATED] }
            }
        }
    }

    def edit(Empleado empleadoInstance) {
        respond empleadoInstance
    }

    @Transactional
    def update(Empleado empleadoInstance) {
        if (empleadoInstance == null) {
            notFound()
            return
        }

        if (empleadoInstance.hasErrors()) {
            respond empleadoInstance.errors, view:'edit'
            return
        }

        empleadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Empleado.label', default: 'Empleado'), empleadoInstance.id])
                redirect empleadoInstance
            }
            '*'{ respond empleadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Empleado empleadoInstance) {

        if (empleadoInstance == null) {
            notFound()
            return
        }

        empleadoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Empleado.label', default: 'Empleado'), empleadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'empleado.label', default: 'Empleado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
