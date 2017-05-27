import pfporcino.CerdoTipo
import pfporcino.Etapa
import pfporcino.FormulaDetalle
import pfporcino.FormulaEncabezado
import pfporcino.MotivoPeso
import pfporcino.Producto
import pfporcino.Vacuna
import pfporcino.VacunaEspecificacion
import seguridad.*

class BootStrap {

    def init = { servletContext ->
        /**
         *Creación de usuarios con sus respectivos roles.
         */
        def user = new User(username: 'user', password: 'user').save(flush: true)
        def admin = new User(username: 'admin', password: 'admin').save(flush: true)

        def userRole = new Role(authority: "ROLE_USER").save(flush: true)
        def adminRole = new Role(authority: "ROLE_ADMIN").save(flush: true)

        new UserRole(user: user, role: userRole).save(flush: true)
        new UserRole(user: admin, role: adminRole).save(flush: true)

        /**
         * Creacion de las etapas
         */

        if (!Etapa.findAll()){
            new Etapa(nombre: "Nacimiento", numeroDias: 21).save(flush: true)
            new Etapa(nombre: "Destete", numeroDias: 49).save(flush: true)
            new Etapa(nombre: "Pre-ceba", numeroDias: 90).save(flush: true)
            new Etapa(nombre: "Salida", numeroDias: 0).save(flush: true)
        }


        /**
         * Creacion diferentes motivos para realiza un peso
         */

        if (!MotivoPeso.findAll()) {
            new MotivoPeso(nombre: "Cambio de etapa").save(flush: true)
            new MotivoPeso(nombre: "Peso de control").save(flush: true)
        }
        /**
         * Creación productos
         */
        if (!Producto.findAll()) {
            Producto soya = new Producto(nombre: "Soya").save(flush: true)
            Producto masterFood = new Producto(nombre: "Master Food").save(flush: true)
            Producto espagueti = new Producto(nombre: "Espagueti").save(flush: true)
            Producto maiz = new Producto(nombre: "Maiz").save(flush: true)
            Producto vitacerdo = new Producto(nombre: "Vitacerdo").save(flush: true)
            Producto melaza = new Producto(nombre: "Melaza").save(flush: true)
            Producto sal = new Producto(nombre: "Sal").save(flush: true)
            Producto promotor = new Producto(nombre: "Promotor").save(flush: true)
            Producto lisina = new Producto(nombre: "Lisina").save(flush: true)
            Producto lactancia = new Producto(nombre: "Lactancia").save(flush: true)
            Producto inicio = new Producto(nombre: "Inicio").save(flush: true)


            /**
             * Creación formulas
             */

            if (!FormulaEncabezado.findAll()) {
                FormulaEncabezado formulaInicio = new FormulaEncabezado(nombre: 'Inicio').save(flush: true)
                new FormulaDetalle(producto: inicio, encabezado: formulaInicio, porcentaje: 70).save(flush: true)
                new FormulaDetalle(producto: masterFood, encabezado: formulaInicio, porcentaje: 30).save(flush: true)

                FormulaEncabezado formulaGestacionActual = new FormulaEncabezado(nombre: 'Gestacion Actual').save(flush: true)
                new FormulaDetalle(producto: soya, encabezado: formulaGestacionActual, porcentaje: 11).save(flush: true)
                new FormulaDetalle(producto: maiz, encabezado: formulaGestacionActual, porcentaje: 58).save(flush: true)
                new FormulaDetalle(producto: espagueti, encabezado: formulaGestacionActual, porcentaje: 25).save(flush: true)
                new FormulaDetalle(producto: vitacerdo, encabezado: formulaGestacionActual, porcentaje: 2).save(flush: true)
                new FormulaDetalle(producto: melaza, encabezado: formulaGestacionActual, porcentaje: 3).save(flush: true)
                new FormulaDetalle(producto: sal, encabezado: formulaGestacionActual, porcentaje: 1).save(flush: true)

                FormulaEncabezado formulaLactancia = new FormulaEncabezado(nombre: 'Lactancia').save(flush: true)
                new FormulaDetalle(producto: soya, encabezado: formulaLactancia, porcentaje: 18.7).save(flush: true)
                new FormulaDetalle(producto: maiz, encabezado: formulaLactancia, porcentaje: 53.4).save(flush: true)
                new FormulaDetalle(producto: espagueti, encabezado: formulaLactancia, porcentaje: 22.8).save(flush: true)
                new FormulaDetalle(producto: vitacerdo, encabezado: formulaLactancia, porcentaje: 2).save(flush: true)
                new FormulaDetalle(producto: melaza, encabezado: formulaLactancia, porcentaje: 2).save(flush: true)
                new FormulaDetalle(producto: sal, encabezado: formulaLactancia, porcentaje: 1).save(flush: true)
                new FormulaDetalle(producto: lisina, encabezado: formulaLactancia, porcentaje: 0.1).save(flush: true)

                FormulaEncabezado formulaCeba = new FormulaEncabezado(nombre: 'Ceba').save(flush: true)
                new FormulaDetalle(producto: soya, encabezado: formulaCeba, porcentaje: 17.3).save(flush: true)
                new FormulaDetalle(producto: maiz, encabezado: formulaCeba, porcentaje: 31.6).save(flush: true)
                new FormulaDetalle(producto: masterFood, encabezado: formulaCeba, porcentaje: 23.0).save(flush: true)
                new FormulaDetalle(producto: espagueti, encabezado: formulaCeba, porcentaje: 23.0).save(flush: true)
                new FormulaDetalle(producto: vitacerdo, encabezado: formulaCeba, porcentaje: 2).save(flush: true)
                new FormulaDetalle(producto: melaza, encabezado: formulaCeba, porcentaje: 2).save(flush: true)
                new FormulaDetalle(producto: sal, encabezado: formulaCeba, porcentaje: 1).save(flush: true)
                new FormulaDetalle(producto: promotor, encabezado: formulaCeba, porcentaje: 0.1).save(flush: true)
                new FormulaDetalle(producto: lisina, encabezado: formulaCeba, porcentaje: 0.1).save(flush: true)

                FormulaEncabezado formulaLevante = new FormulaEncabezado(nombre: 'Levante').save(flush: true)
                new FormulaDetalle(producto: soya, encabezado: formulaLevante, porcentaje: 20.5).save(flush: true)
                new FormulaDetalle(producto: maiz, encabezado: formulaLevante, porcentaje: 29.8).save(flush: true)
                new FormulaDetalle(producto: masterFood, encabezado: formulaLevante, porcentaje: 22.3).save(flush: true)
                new FormulaDetalle(producto: espagueti, encabezado: formulaLevante, porcentaje: 22.3).save(flush: true)
                new FormulaDetalle(producto: vitacerdo, encabezado: formulaLevante, porcentaje: 2).save(flush: true)
                new FormulaDetalle(producto: melaza, encabezado: formulaLevante, porcentaje: 2).save(flush: true)
                new FormulaDetalle(producto: sal, encabezado: formulaLevante, porcentaje: 1).save(flush: true)
                new FormulaDetalle(producto: promotor, encabezado: formulaLevante, porcentaje: 0.1).save(flush: true)
                new FormulaDetalle(producto: lisina, encabezado: formulaLevante, porcentaje: 0.1).save(flush: true)
            }
        }

        /**
         * Creacion vacunas
         */

        if (!Vacuna.findAll()){

            new Vacuna(Nombre: "Vermifugación").save(flush: true)
            new Vacuna(Nombre: "Leptospira").save(flush: true)
            new Vacuna(Nombre: "Erisipeia").save(flush: true)
            new Vacuna(Nombre: "Aftosa").save(flush: true)
            new Vacuna(Nombre: "Peste porcina").save(flush: true)
            new Vacuna(Nombre: "Rinitis Atrofica").save(flush: true)
        }

        if (!VacunaEspecificacion.findAll()){
            new VacunaEspecificacion(vacuna: Vacuna.get(1), numeroDias: 21, cerdoTipo: 'Lote' as CerdoTipo).save(flush: true)
            new VacunaEspecificacion(vacuna: Vacuna.get(2), numeroDias: 28, cerdoTipo: 'Lote' as CerdoTipo).save(flush: true)
            new VacunaEspecificacion(vacuna: Vacuna.get(3), numeroDias: 28, cerdoTipo: 'Lote' as CerdoTipo).save(flush: true)
            new VacunaEspecificacion(vacuna: Vacuna.get(4), numeroDias: 42, cerdoTipo: 'Lote' as CerdoTipo).save(flush: true)
            new VacunaEspecificacion(vacuna: Vacuna.get(5), numeroDias: 42, cerdoTipo: 'Lote' as CerdoTipo).save(flush: true)
            new VacunaEspecificacion(vacuna: Vacuna.get(6), numeroDias: 7, cerdoTipo: 'Lote' as CerdoTipo).save(flush: true)
        }

/*        if (!Vacuna.findAll()){

            new Vacuna(Nombre: "Vermifugación", etapa: Etapa.get(2), numDiasDespEtapa: 0).save(flush: true)
            new Vacuna(Nombre: "Leptospira", etapa: Etapa.get(2), numDiasDespEtapa: 7).save(flush: true)
            new Vacuna(Nombre: "Erisipeia", etapa: Etapa.get(2), numDiasDespEtapa: 7).save(flush: true)
            new Vacuna(Nombre: "Aftosa", etapa: Etapa.get(2), numDiasDespEtapa: 21).save(flush: true)
            new Vacuna(Nombre: "Peste porcina", etapa: Etapa.get(2), numDiasDespEtapa: 21).save(flush: true)
            new Vacuna(Nombre: "Rinitis Atrofica", etapa: Etapa.get(1), numDiasDespEtapa: 7).save(flush: true)
        }*/



    }
    def destroy = {
    }
}
