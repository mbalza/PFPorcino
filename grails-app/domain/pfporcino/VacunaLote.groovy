package pfporcino

class VacunaLote implements Serializable{

    static belongsTo = [vacuna: VacunaEspecificacion, lote: Lote, empleado: Empleado]
    Date fecha
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        id composite: ['vacuna','lote']
    }
}
