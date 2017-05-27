package pfporcino

class Lote {
    String id
    static transients = ['identificacion']
    String identificacion
    static belongsTo = [madre: Madre, padre: Padre]
    Etapa etapaActual
    int cantidadCerdosActual = 0
    Date dateCreated
    Date lastUpdated
    static hasMany = [cerdos: Cerdo, vacunas: VacunaLote]

    @Override
    String toString() {
        return id
    }

    def getPesoPromedio(){
        def cerdosVivos = this.cerdos.findAll{it.estadoActual == 'Vivo' as Estado}
        if (cerdosVivos){
            def totalPeso = cerdosVivos.sum{it.pesoActual}
            def numCerdos = cerdosVivos.size()
            def promedioPeso = totalPeso/numCerdos
            return promedioPeso.round(2)
        }else{
            return 0
        }

    }

    static constraints = {
        id nullable: false, blank: false, unique: true
    }

    static mapping = {
        id generator : 'assigned', column: 'identificacion' , type: 'string'
    }
    public void setIdentificacion(String identificacion){
        id = identificacion
    }
    public String getIdentificacion(){
        return id
    }
    static findByIdentificacion(String identificacion){
        return Madre.findById(identificacion)
    }
}
