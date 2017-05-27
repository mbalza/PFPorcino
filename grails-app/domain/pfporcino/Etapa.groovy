package pfporcino

class Etapa {
    String nombre
    int numeroCerdos = 0
    Date dateCreated
    Date lastUpdated
    int numeroDias
    static hasMany = [vacunas: Vacuna]

    @Override
    String toString() {
        return nombre
    }

    static constraints = {
        numeroCerdos display: false
    }
}
