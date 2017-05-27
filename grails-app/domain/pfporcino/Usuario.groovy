package pfporcino

class Usuario {
    String id
    static transients = ['usuario']
    String usuario
    String contraseña
    Date dateCreated
    Date lastUpdated

    static constraints = {
    }

    static mapping = {
        id generator : 'assigned', column: 'usuario' , type: 'string'
    }
    public void setUsuario(String usuario){
        id = usuario
    }
    public String getUsuario(){
        return id
    }
    static findByUsuario(String usuario){
        return Usuario.findById(usuario)
    }
}
