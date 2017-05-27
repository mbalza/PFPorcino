package pfporcino

class EtapaLote implements Serializable{

    static belongsTo = [lote: Lote, etapa: Etapa, encabezado: PesoEstadoEncabezado]
    int numeroCerdos
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        id composite: ['lote','etapa']
    }
}
