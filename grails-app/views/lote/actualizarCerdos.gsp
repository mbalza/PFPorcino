<%--
  Created by IntelliJ IDEA.
  User: Martín
  Date: 06/05/2017
  Time: 6:17 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'lote.label', default: 'Lote')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-lote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-lote" class="content scaffold-create" role="main">
    <h1>${tituloEtapa}</h1>

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

<!-- Datos del formulario -->
    <div class="fieldcontain" >
        <label for="fecha">
            Fecha
        </label>
        <g:formatDate format="yyyy-MM-dd" date="${fecha}"  />
    </div>

    <div class="fieldcontain" >
        <label for="lote">
            <g:message code="lote.madre.label" default="Lote" />
        </label>
        <g:textField name="lote" readonly="" value="${lote}"/>
    </div>

    <div class="fieldcontain">
        <label for="empleado">
            <g:message code="lote.padre.label" default="Empleado que tomó los datos" />
        </label>
        <g:textField name="empleado" readonly="" value="${empleado.toString()}"/>
    </div>

    %{--Tabla cerdos--}%

    <g:form class="form-inline" action="saveCerdos" params="[empleado: empleado.PKS]">
        <div hidden> <g:datePicker name="fechap" precision="day" type="hidden" value="${fecha}"/> </div>
        <br>
        <g:field type="hidden" name="lote" value="${lote}"/>
        <g:field type="hidden" name="etapaCorrecta" value="${tituloEtapa}"/>
        <fieldset class="form">
                <g:render template="tablaActualizarCerdos"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="Actualizar Cerdos" />
        </fieldset>
    </g:form>


</div>
</body>
</html>
