package pfporcino

class PesoEstadoDetalle implements Serializable{

    static belongsTo = [cerdo: Cerdo, encabezado: PesoEstadoEncabezado]
    float peso
    Estado estado
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {

        id composite: ['cerdo','encabezado']
    }
}
