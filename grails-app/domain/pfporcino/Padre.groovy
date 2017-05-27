package pfporcino

class Padre {
    String id
    static transients = ['identificacion']
    String identificacion
    Date fechaEntrada
    Date dateCreated
    Date lastUpdated
    static hasMany = [lotes: Lote]

    @Override
    String toString() {
        return id
    }

    static constraints = {
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
        return Padre.findById(identificacion)
    }
}
