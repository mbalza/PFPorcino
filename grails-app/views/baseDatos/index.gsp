<%@ page import="pfporcino.Etapa" %>
<%--
  Created by IntelliJ IDEA.
  User: Martín
  Date: 29/05/2017
  Time: 6:06 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Inicio</title>
</head>

<body>

<div class="content">
    <h1 class="centeredH1">Base de Datos</h1>
</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <br>
    <h1 class="centeredh1">Total cerdos: ${totalFinca}</h1>
    <h1 class="centeredh1">Nacimiento: ${vivosNacimiento}</h1>
    <h1 class="centeredh1">Destete: ${vivosDestete}</h1>
    <h1 class="centeredh1">Pre-ceba: ${vivosPreceba}</h1>
    <h1 class="centeredh1">Salida: ${vivosSalida}</h1>

</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <br>
    <h1 class="centeredh1">Total Padres+Madres: ${totalPadres}</h1>
    <br>
    <br>
    <br>
    <br>

</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
</div>

<div class="fechaBD">
<g:form action="index">
        <label for="fecha">
            <g:message code="alimentacion.fecha.label" default="Fecha Inicial" />
        </label>
        <g:datePicker name="fechaInicial" precision="day"  value="${fechaInicial}"  />


        <label for="fecha">
            <g:message code="alimentacion.fecha.label" default="Fecha Final" />
        </label>
        <g:datePicker name="fechaFinal" precision="day"  value="${fechaFinal}"  />



        <g:submitButton name="create" class="save" value="Aceptar" />
</g:form>
</div>

<h1>Partos: ${partosRangoFecha}</h1>
<h1>Vivos: ${vivosNacimientos}</h1>
<h1>Muertos: ${muertosNacimientos}</h1>
<h1>Momias: ${momiasNacimientos}</h1>
<h1>Total: ${totalNacimientos}</h1>
<h1>Promedio cerdos vivos por parto: ${promedioCerdosParto}</h1>

<div class="etapas">
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/lote/index')}">  <span>LOTES</span></a>
    </div>
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/alimentacion/index')}"> <span>ALIMENTACIÓN</span></a>
    </div>
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/vacunaLote/index')}">  <span >VACUNAS</span></a>
    </div>
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/madre/index')}"> <span>MADRES</span></a>
    </div>
</div>



</body>
</html>