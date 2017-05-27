<%--
  Created by IntelliJ IDEA.
  User: Martín
  Date: 02/05/2017
  Time: 11:53 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'lote.label', default: 'Lote')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <g:javascript>
        var URL = "${createLink(controller: 'lote', action: 'agregarCerdoTabla')}";
    </g:javascript>
    <g:javascript library="agregarCerdos" />

</head>
<body>
<a href="#create-lote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"> Inicio </a></li>
        <li><g:link class="list" action="index"> Lotes </g:link></li>
    </ul>
</div>
<div id="create-lote" class="content scaffold-create" role="main">
    <h1>Nacimiento</h1>

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
    <div class="fieldcontain">
        <label for="identificacion">
            Identificación
        </label>
        <g:textField name="identificacion" readonly="" value="${loteInstance?.identificacion}" />
        <input id="encabezado" type="hidden" value="${etapaLote?.encabezado?.id}">

    </div>

    <div class="fieldcontain">
        <label for="fecha">
            Fecha
        </label>
        <g:formatDate format="yyyy-MM-dd" date="${etapaLote?.encabezado?.fecha}"  />
    </div>

    <div class="fieldcontain">
        <label for="madre">
            <g:message code="lote.madre.label" default="Madre" />
        </label>
        <g:textField name="madre" readonly="" value="${loteInstance?.madre?.identificacion}"/>

    </div>

    <div class="fieldcontain">
        <label for="padre">
            <g:message code="lote.padre.label" default="Padre" />
        </label>
        <g:textField name="padre" readonly="" value="${loteInstance?.padre?.identificacion}"/>

    </div>

    <div class="fieldcontain">
        <label for="empleado">
            <g:message code="lote.padre.label" default="Empleado que tomó los datos" />
        </label>
        <g:textField name="empleado" readonly="" value="${etapaLote?.encabezado?.empleado?.toString()}"/>
    </div>

    <h1>Agregar cerdo</h1>

    <div class="form-inline">
        <label  for="inlineFormInput">Identificacion</label>
        <g:field type="text" required="" class="form-control mb-2 mr-sm-2 mb-sm-0" name="idCerdo" placeholder=""/>

        <label  for="inlineFormInput">Peso</label>
        <g:field type="number" step="0.01" required="" min="0" class="form-control mb-2 mr-sm-2 mb-sm-0" name="peso" placeholder="Kg"/>

        <label for="inlineFormInputGroup">Estado</label>
        <g:select id="estado" class="form-control mb-2 mr-sm-2 mb-sm-0" name="estado" from="${pfporcino.Estado.values()}" required=""/>

        <button onclick="agregarCerdos()" class="btn btn-primary">+</button>
    </div>

    <br>
    %{--Tabla cerdos--}%
    <div id="tablaCerdos">
        <g:render template="tablaCerdos"/>
    </div>

    <div align="center">
        <g:link class="btn btn-primary" action="index"> Finalizar </g:link>
    </div>

</div>
</body>
</html>
