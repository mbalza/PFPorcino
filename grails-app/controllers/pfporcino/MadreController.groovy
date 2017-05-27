package pfporcino



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MadreController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Madre.list(params), model:[madreInstanceCount: Madre.count()]
    }

    def show(Madre madreInstance) {
        respond madreInstance
    }

    def create() {
        respond new Madre(params)
    }

    @Transactional
    def save(Madre madreInstance) {
        if (madreInstance == null) {
            notFound()
            return
        }

        if (madreInstance.hasErrors()) {
            respond madreInstance.errors, view:'create'
            return
        }

        madreInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'madre.label', default: 'Madre'), madreInstance.id])
                redirect madreInstance
            }
            '*' { respond madreInstance, [status: CREATED] }
        }
    }

    def edit(Madre madreInstance) {
        respond madreInstance
    }

    @Transactional
    def update(Madre madreInstance) {
        if (madreInstance == null) {
            notFound()
            return
        }

        if (madreInstance.hasErrors()) {
            respond madreInstance.errors, view:'edit'
            return
        }

        madreInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Madre.label', default: 'Madre'), madreInstance.id])
                redirect madreInstance
            }
            '*'{ respond madreInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Madre madreInstance) {

        if (madreInstance == null) {
            notFound()
            return
        }

        madreInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Madre.label', default: 'Madre'), madreInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'madre.label', default: 'Madre'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
