package pfporcino

class FormulaEncabezado {

    String nombre
    Date dateCreated
    Date lastUpdated
    static hasMany = [detalles: FormulaDetalle]

    @Override
    String toString() {
        return nombre
    }

    static constraints = {
    }

}
