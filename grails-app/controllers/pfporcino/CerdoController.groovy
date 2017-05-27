package pfporcino



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CerdoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cerdo.list(params), model:[cerdoInstanceCount: Cerdo.count()]
    }

    def show = {
        def cerdoInstance = Cerdo.get(new Cerdo(params))
        if (!cerdoInstance){
            flash.message = "Cerdo no encontrado con ${params}"
            redirect(action:index())
        }else{
            respond cerdoInstance
        }
    }

    def create() {
        respond new Cerdo(params)
    }

    @Transactional
    def save(Cerdo cerdoInstance) {
        if (cerdoInstance == null) {
            notFound()
            return
        }

        if (cerdoInstance.hasErrors()) {
            respond cerdoInstance.errors, view:'create'
            return
        }

        cerdoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cerdo.label', default: 'Cerdo'), cerdoInstance.id])
                redirect cerdoInstance
            }
            '*' { respond cerdoInstance, [status: CREATED] }
        }
    }

    def edit(Cerdo cerdoInstance) {
        respond cerdoInstance
    }

    @Transactional
    def update(Cerdo cerdoInstance) {
        if (cerdoInstance == null) {
            notFound()
            return
        }

        if (cerdoInstance.hasErrors()) {
            respond cerdoInstance.errors, view:'edit'
            return
        }

        cerdoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cerdo.label', default: 'Cerdo'), cerdoInstance.id])
                redirect cerdoInstance
            }
            '*'{ respond cerdoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cerdo cerdoInstance) {

        if (cerdoInstance == null) {
            notFound()
            return
        }

        cerdoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cerdo.label', default: 'Cerdo'), cerdoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cerdo.label', default: 'Cerdo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
