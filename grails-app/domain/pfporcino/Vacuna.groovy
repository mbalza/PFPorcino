package pfporcino

class Vacuna {

    String Nombre
    Date dateCreated
    Date lastUpdated

    @Override
    String toString() {
        return Nombre
    }

    static constraints = {
    }
}
