package pfporcino

class Empleado implements Serializable{

    String nombres
    String apellidos
    String tipoDocumento
    String numDocumento
    String telefono
    String direccion
    String ciudad
    Date dateCreated
    Date lastUpdated

    @Override
    String toString() {
        return nombres +" "+ apellidos
    }

    static constraints = {
        telefono nullable: true

    }

    static mapping = {

        id composite: ['tipoDocumento','numDocumento']
    }

    def getPK(){
        ["tipoDocumento":tipoDocumento, "numDocumento":numDocumento]
    }

    def getPKS(){
        "[tipoDocumento: '${tipoDocumento}', numDocumento: '${numDocumento}']"
    }

}
