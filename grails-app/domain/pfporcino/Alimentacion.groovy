package pfporcino

import java.text.SimpleDateFormat

class Alimentacion implements Serializable{

    static belongsTo = [lote: Lote, formula: FormulaEncabezado, empleado: Empleado]
    Date fecha
    float cantidad
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        id composite: ['lote','fecha']
    }

    def getPK(){
        ["lote": lote, "fecha": new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(fecha)]
    }
}
