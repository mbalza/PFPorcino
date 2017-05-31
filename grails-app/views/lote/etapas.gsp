<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'lote.label', default: 'Lote')}" />
    <title>Etapas</title>
</head>


<body>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div class="etapas">
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/lote/nacimiento')}"> <asset:image src="ICONS/1_nacimiento.png" alt="Grails"/> <span>NACIMIENTO</span></a>
    </div>
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/lote/destete')}"> <asset:image src="ICONS/2_destete.png" alt="Grails"/> <span>DESTETE</span></a>
    </div>
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/lote/preCeba')}"> <asset:image src="ICONS/3_pre_ceba.png" alt="Grails"/> <span >PRECEBA</span></a>
    </div>
    <div class="etapast">
        <a class="etapasc" href="${createLink(uri: '/lote/salida')}"> <asset:image src="ICONS/4_salida.png" alt="Grails"/> <span>SALIDA</span></a>
    </div>
</div>


</body>
</html>