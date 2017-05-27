package pfporcino

enum CerdoTipo{
    Lote,
    Padre,
    Madre
}

class VacunaEspecificacion implements Serializable{

    static belongsTo = [vacuna: Vacuna]
    int numeroDias
    CerdoTipo cerdoTipo = CerdoTipo.Lote

    @Override
    String toString() {
        return this.vacuna.Nombre+" ("+numeroDias+" días)"
    }

    static constraints = {
    }

    static mapping = {
        id composite: ['vacuna','numeroDias','cerdoTipo']
    }
}
