<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'lote.label', default: 'Lote')}" />
    <title>Etapas</title>
</head>


<body>
<div class="etapas">
    <div class="etapast">
        <a href="${createLink(uri: '/lote/nacimiento')}"> <asset:image src="ICONS/iconitos-20.png" alt="Grails"/> Nacimiento</a>
    </div>
    <div class="etapast">
        <a href="${createLink(uri: '/lote/destete')}"> <asset:image src="ICONS/iconitos-21.png" alt="Grails"/> Destete</a>
    </div>
    <div class="etapast">
        <a href="${createLink(uri: '/lote/preCeba')}"> <asset:image src="ICONS/iconitos-22.png" alt="Grails"/> Pre-Ceba</a>
    </div>
    <div class="etapast">
        <a href="${createLink(uri: '/lote/salida')}"> <asset:image src="ICONS/iconitos-23.png" alt="Grails"/> Salida</a>
    </div>

</div>


</body>
</html>