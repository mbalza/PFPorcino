package pfporcino



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PadreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Padre.list(params), model:[padreInstanceCount: Padre.count()]
    }

    def show(Padre padreInstance) {
        respond padreInstance
    }
    /*def show={
        respond Padre.get(params.id)
    }*/

    def create() {
        respond new Padre(params)
    }

    @Transactional
    def save(Padre padreInstance) {
        if (padreInstance == null) {
            notFound()
            return
        }

        if (padreInstance.hasErrors()) {
            respond padreInstance.errors, view:'create'
            return
        }

        padreInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'padre.label', default: 'Padre'), padreInstance.id])
                redirect padreInstance
            }
            '*' { respond padreInstance, [status: CREATED] }
        }
    }

    def edit(Padre padreInstance) {
        respond padreInstance
    }

    @Transactional
    def update(Padre padreInstance) {
        if (padreInstance == null) {
            notFound()
            return
        }

        if (padreInstance.hasErrors()) {
            respond padreInstance.errors, view:'edit'
            return
        }

        padreInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Padre.label', default: 'Padre'), padreInstance.id])
                redirect padreInstance
            }
            '*'{ respond padreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Padre padreInstance) {

        if (padreInstance == null) {
            notFound()
            return
        }

        padreInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Padre.label', default: 'Padre'), padreInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'padre.label', default: 'Padre'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
