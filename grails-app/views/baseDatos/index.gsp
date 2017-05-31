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
    <h1 class="centeredh1">Cerdos por etapa </h1>
    <h1 class="centeredh1">Nacimiento: ${ pfporcino.Etapa.findById(1).numeroCerdos}</h1>
    <h1 class="centeredh1">Destete: ${ pfporcino.Etapa.findById(2).numeroCerdos}</h1>
    <h1 class="centeredh1">Pre-ceba: ${ pfporcino.Etapa.findById(3).numeroCerdos}</h1>
    <h1 class="centeredh1">Salida: ${ pfporcino.Etapa.findById(4).numeroCerdos}</h1>

</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <h1 class="centeredh1">Indicador2</h1>
    <br>
    <br>
    <br>
    <br>
    <h1 class="centeredh1">Indicador5</h1>
</div>

<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <h1 class="centeredh1">Indicador3</h1>
    <br>
    <br>
    <br>
    <br>
    <h1 class="centeredh1">Indicador6</h1>
</div>

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