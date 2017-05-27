package pfporcino



import grails.test.mixin.*
import spock.lang.*

@TestFor(LoteController)
@Mock(Lote)
class LoteControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.loteInstanceList
            model.loteInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.loteInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def lote = new Lote()
            lote.validate()
            controller.save(lote)

        then:"The create view is rendered again with the correct model"
            model.loteInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            lote = new Lote(params)

            controller.save(lote)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/lote/show/1'
            controller.flash.message != null
            Lote.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def lote = new Lote(params)
            controller.show(lote)

        then:"A model is populated containing the domain instance"
            model.loteInstance == lote
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def lote = new Lote(params)
            controller.edit(lote)

        then:"A model is populated containing the domain instance"
            model.loteInstance == lote
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/lote/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def lote = new Lote()
            lote.validate()
            controller.update(lote)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.loteInstance == lote

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            lote = new Lote(params).save(flush: true)
            controller.update(lote)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/lote/show/$lote.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/lote/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def lote = new Lote(params).save(flush: true)

        then:"It exists"
            Lote.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(lote)

        then:"The instance is deleted"
            Lote.count() == 0
            response.redirectedUrl == '/lote/index'
            flash.message != null
    }
}
