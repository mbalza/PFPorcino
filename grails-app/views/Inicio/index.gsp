<%--
  Created by IntelliJ IDEA.
  User: Martín
  Date: 16/05/2017
  Time: 11:14 PM
--%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Inicio</title>
</head>

<body>

<div class="content">
    <h1 class="centeredH1">Notificaciones</h1>
</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <h1 class="centeredh1">Alimentación</h1>

    <div class="alert alert-success">
        <asset:image src="ICONS/19_happy.png" alt="Grails"/> No hay alertas.
    </div>

</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <h1 class="centeredh1">Etapas</h1>

    <g:if test="${listaLoteCambioFaltante && listaLoteCambioFuturo}">
        <g:each in="${listaLoteCambioFaltante}" status="i" var="cambioFaltante">
            <g:if test="${cambioFaltante.numDiasPasados == 1}">
                <g:link action="etapas" controller="lote">
                    <asset:image src="ICONS/16_alertab.png" alt="Grails"/> <strong> ${cambioFaltante.lote} debio pasar a ${cambioFaltante.etapaSiguiente} hace ${cambioFaltante.numDiasPasados} día.</strong>
                </g:link>
            </g:if>
            <g:else>
                <g:link action="etapas" controller="lote">
                    <asset:image src="ICONS/16_alertab.png" alt="Grails"/> <strong> ${cambioFaltante.lote} debio pasar a ${cambioFaltante.etapaSiguiente} hace ${cambioFaltante.numDiasPasados} días.</strong>
                </g:link>
            </g:else>
        </g:each>

        <g:each in="${listaLoteCambioFuturo}" status="i" var="cambioFuturo">
            <g:if test="${cambioFuturo.numDiasFaltantes == 0}">
                <div class="alert alert-warning">
                    <g:link action="etapas" controller="lote">
                        <asset:image src="ICONS/18_alerta.png" alt="Grails"/> <strong>${cambioFuturo.lote} debe pasar a  ${cambioFuturo.etapaSiguiente} hoy.</strong>
                    </g:link>
                </div>
            </g:if>
            <g:else>
                <div class="alert alert-info">
                <g:link action="etapas" controller="lote">
                    <asset:image src="ICONS/18_infob.png" alt="Grails"/> Mañana  <strong>${cambioFuturo.lote} pasa a  ${cambioFuturo.siguienteEtapa}</strong>
                </g:link>
                </div>
            </g:else>
        </g:each>

    </g:if>


    <div class="alert alert-info">
        <asset:image src="ICONS/18_infob.png" alt="Grails"/> Mañana el <strong>Lote 5</strong> pasa a <strong>Pre-Ceba</strong>
    </div>
</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <h1 class="centeredh1">Vacunas</h1>
    <g:if test="${listaLoteVacunaFaltante && listaLoteVacunaFutura}">
        <g:each in="${listaLoteVacunaFaltante}" status="i" var="vacunaFaltante">
            <div class="alert alert-danger">
                <g:if test="${vacunaFaltante.numDiasPasados == 1}">
                    <g:link action="create" controller="vacunaLote">
                    <asset:image src="ICONS/16_alertab.png" alt="Grails"/> <strong>ATRASADA: ${vacunaFaltante.vacuna}-${vacunaFaltante.numDiasPasados}día-${vacunaFaltante.lote}</strong>
                    </g:link>
                </g:if>
                <g:else>
                    <g:link action="create" controller="vacunaLote">
                    <asset:image src="ICONS/16_alertab.png" alt="Grails"/> <strong>ATRASADA: ${vacunaFaltante.vacuna}-${vacunaFaltante.numDiasPasados}días-${vacunaFaltante.lote}</strong>
                    </g:link>
                </g:else>
            </div>
        </g:each>

        <g:each in="${listaLoteVacunaFutura}" status="i" var="vacunaFutura">
            <g:if test="${vacunaFutura.numDiasFaltantes == 0}">
                <div class="alert alert-warning">
                    <g:link action="create" controller="vacunaLote">
                    <asset:image src="ICONS/18_alerta.png" alt="Grails"/> Hoy aplicar <strong>${vacunaFutura.vacuna} - ${vacunaFutura.lote}</strong>
                    </g:link>
                </div>
            </g:if>
            <g:elseif test="${vacunaFutura.numDiasFaltantes == 1}">
                <div class="alert alert-info">
                <g:link action="create" controller="vacunaLote">
                    <asset:image src="ICONS/18_infob.png" alt="Grails"/> Mañana aplicar <strong>${vacunaFutura.vacuna} - ${vacunaFutura.lote}</strong>
                </g:link>
                </div>
            </g:elseif>
            <g:else>
                <div class="alert alert-info">
                <g:link action="create" controller="vacunaLote">
                    <asset:image src="ICONS/18_infob.png" alt="Grails"/> Pasado mañana aplicar <strong>${vacunaFutura.vacuna} - ${vacunaFutura.lote}</strong>
                </g:link>
                </div>
            </g:else>
        </g:each>
    </g:if>
    <g:else>

    </g:else>

    
</div>

</body>
</html>