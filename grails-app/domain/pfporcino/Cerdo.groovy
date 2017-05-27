package pfporcino

enum Estado{
    Vivo,
    Muerto,
    Momia
}

class Cerdo implements Serializable{

    String identificacion
    float pesoActual
    Estado estadoActual
    Date dateCreated
    Date lastUpdated
    static belongsTo = [lote: Lote]

    @Override
    String toString() {
        return identificacion
    }

    static constraints = {
    }

    static mapping = {
        id composite: ['identificacion','lote']
    }
    
    def getPK(){
        ["identificacion":identificacion, "lote":lote]
    }
}
