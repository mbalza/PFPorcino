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
    
    <div class="alert alert-warning" role="alert">
        <asset:image src="ICONS/Artboard 2 copy 6.png" alt="Grails"/> <strong>Warning!</strong> Test <a href="#" class="alert-link">link</a>.
    </div>

    <div class="alert alert-info">
        <strong>Info</strong> Alert body ...
    </div>

    <div class="alert alert-success">
        <strong>Success</strong> Alert body ...
    </div>

    <div class="alert alert-danger">
        <strong>Danger</strong> Alert body ...
    </div>

    <div class="alert alert-warning" role="alert">
        <strong>Warning!</strong> Better check yourself, you're <a href="#" class="alert-link">not looking too good</a>.
    </div>
</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <h1 class="centeredh1">Etapas</h1>
    <div class="alert alert-warning" role="alert">
        <asset:image src="ICONS/Artboard 2 copy 6.png" alt="Grails"/> <strong>Warning!</strong> Better check yourself, you're <a href="#" class="alert-link">not looking too good</a>.
    </div>
</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <h1 class="centeredh1">Vacunas</h1>
    <g:if test="${listaLoteVacunaFaltante && listaLoteVacunaFutura}">
        <g:each in="${listaLoteVacunaFaltante}" status="i" var="vacunaFaltante">
            <div class="alert alert-danger">
                <strong>ATRASADA: ${vacunaFaltante.vacuna} - ${vacunaFaltante.numDiasPasados} días - ${vacunaFaltante.lote}</strong>
            </div>
        </g:each>

        <g:each in="${listaLoteVacunaFutura}" status="i" var="vacunaFutura">
            <g:if test="${vacunaFutura.numDiasFaltantes == 0}">
                <div class="alert alert-warning">
                    Hoy debe aplicar <strong>${vacunaFutura.vacuna} - ${vacunaFutura.lote}</strong>
                </div>
            </g:if>
            <g:elseif test="${vacunaFutura.numDiasFaltantes == 1}">
                <div class="alert alert-info">
                    Mañana debe aplicar <strong>${vacunaFutura.vacuna} - ${vacunaFutura.lote}</strong>
                </div>
            </g:elseif>
            <g:else>
                <div class="alert alert-info">
                    Pasado mañana debe aplicar <strong>${vacunaFutura.vacuna} - ${vacunaFutura.lote}</strong>
                </div>
            </g:else>
        </g:each>
    </g:if>
    <g:else>

    </g:else>

    
</div>

</body>
</html>