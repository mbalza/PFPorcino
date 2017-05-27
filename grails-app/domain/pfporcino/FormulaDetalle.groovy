package pfporcino

class FormulaDetalle implements Serializable{

    static belongsTo = [producto: Producto, encabezado: FormulaEncabezado]
    float porcentaje
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        id composite: ['producto','encabezado']
    }
}
