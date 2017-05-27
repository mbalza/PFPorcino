<%--
  Created by IntelliJ IDEA.
  User: Martín
  Date: 07/05/2017
  Time: 7:28 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'lote.label', default: 'Lote')}" />
    <title>Salida</title>
</head>
<body>
%{--<a href="#create-lote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>--}%
<div id="create-lote" class="content scaffold-create" role="main">
    <h1>Salida</h1>

    <g:if test="${flash.error}">
        <div class="errors mio" role="status">${flash.error}</div>
    </g:if>
    <g:hasErrors bean="${loteInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${loteInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form class="form-inline" url="[action:'actualizarCerdos']" >
        <g:field type="hidden" name="tituloEtapa" value="Salida"/>
        <fieldset class="form">
            <g:render template="formCambioEtapa"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="Siguiente" />
        </fieldset>
    </g:form>
</div>
</body>
</html>