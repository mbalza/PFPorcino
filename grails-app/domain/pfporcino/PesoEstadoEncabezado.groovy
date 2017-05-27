package pfporcino

class PesoEstadoEncabezado {

    static belongsTo = [empleado: Empleado, motivo: MotivoPeso]
    Date fecha
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }
}
