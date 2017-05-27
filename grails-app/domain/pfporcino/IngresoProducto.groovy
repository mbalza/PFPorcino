package pfporcino

class IngresoProducto implements Serializable{

    Date fecha
    static belongsTo = [producto: Producto]
    float cantidad
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        id composite: ['producto','fecha']
    }
}
