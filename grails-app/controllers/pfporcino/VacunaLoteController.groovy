package pfporcino



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VacunaLoteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VacunaLote.list(params), model:[vacunaLoteInstanceCount: VacunaLote.count()]
    }

    def show(VacunaLote vacunaLoteInstance) {
        respond vacunaLoteInstance
    }

    def create() {
        respond new VacunaLote(params)
    }

    @Transactional
    def save() {
        println("save > params: " + params)
        Binding binding = new Binding()
        GroovyShell shell = new GroovyShell(binding)
        HashMap mapa = shell.evaluate(params.empleado)
        Empleado empleado = Empleado.get(new Empleado(mapa))
        params.empleado = empleado
        VacunaLote vacunaLoteInstance = new VacunaLote([fecha: params.fecha, empleado: params.empleado])
        switch(params.etapa){
            case "Nacimiento":
                vacunaLoteInstance.lote = Lote.get(params.loteNacimiento)
                break

            case "Destete":
                vacunaLoteInstance.lote = Lote.get(params.loteDestete)
                break

            case "Pre-ceba":
                vacunaLoteInstance.lote = Lote.get(params.lotePreCeba)
                break

            case "Salida":
                vacunaLoteInstance.lote = Lote.get(params.loteSalida)
                break

            default:

                break
        }
        Date fechaNacimiento = EtapaLote.findByLoteAndEtapa(vacunaLoteInstance.lote, Etapa.get(1)).encabezado.fecha
        int diasVida = vacunaLoteInstance.fecha - fechaNacimiento
        println(diasVida)
        Vacuna vacunalol = Vacuna.get(params.vacuna)
        VacunaEspecificacion vacuna = VacunaEspecificacion.findByCerdoTipoAndVacunaAndNumeroDias(CerdoTipo.Lote, vacunalol, diasVida)
        if(!vacuna){
            //explota en la cara del tipo diciendo no vacuna para ese lote en esa fecha
            flash.error = "No hay vacunas que aplicar al lote " + vacunaLoteInstance.lote + " para la fecha seleccionada."
            render(view: "create")
        }
        else if(VacunaLote.findByLoteAndVacuna(vacunaLoteInstance.lote, vacuna))
        {
            //Explota en la cara del tipo diciendo ya fue aplicada
            flash.error = "La vacuna " + vacuna.vacuna.getNombre() + " ya fue aplicada al lote " + vacunaLoteInstance.lote
            render(view: "create")
        }
        else
        {
            vacunaLoteInstance.vacuna = vacuna
            vacunaLoteInstance.validate()
            if (vacunaLoteInstance == null){
                notFound()
                return
            }

            if (vacunaLoteInstance.hasErrors()) {
                respond vacunaLoteInstance.errors, view:'create'
                return
            }
            vacunaLoteInstance.save(flush: true)

            request.withFormat {
                form multipartForm {
                    flash.message = "¡Vacunación registrada exitosamente!"
                    redirect (action: "index")
                }
                '*' { respond vacunaLoteInstance, [status: CREATED] }
            }
        }
    }

    def edit(VacunaLote vacunaLoteInstance) {
        respond vacunaLoteInstance
    }

    @Transactional
    def update(VacunaLote vacunaLoteInstance) {
        if (vacunaLoteInstance == null) {
            notFound()
            return
        }

        if (vacunaLoteInstance.hasErrors()) {
            respond vacunaLoteInstance.errors, view:'edit'
            return
        }

        vacunaLoteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VacunaLote.label', default: 'VacunaLote'), vacunaLoteInstance.id])
                redirect vacunaLoteInstance
            }
            '*'{ respond vacunaLoteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VacunaLote vacunaLoteInstance) {

        if (vacunaLoteInstance == null) {
            notFound()
            return
        }

        vacunaLoteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VacunaLote.label', default: 'VacunaLote'), vacunaLoteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vacunaLote.label', default: 'VacunaLote'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
