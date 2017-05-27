
<%@ page import="pfporcino.Empleado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'empleado.label', default: 'Empleado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-empleado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-empleado" class="content scaffold-show" role="main">
			<h1>Empleado</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list empleado">
			
				<g:if test="${empleadoInstance?.apellidos}">
				<li class="fieldcontain">
					<span id="apellidos-label" class="property-label"><g:message code="empleado.apellidos.label" default="Apellidos" /></span>
					
						<span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${empleadoInstance}" field="apellidos"/></span>
					
				</li>
				</g:if>

				<g:if test="${empleadoInstance?.nombres}">
					<li class="fieldcontain">
						<span id="nombres-label" class="property-label"><g:message code="empleado.nombres.label" default="Nombres" /></span>

						<span class="property-value" aria-labelledby="nombres-label"><g:fieldValue bean="${empleadoInstance}" field="nombres"/></span>

					</li>
				</g:if>

				<g:if test="${empleadoInstance?.tipoDocumento}">
					<li class="fieldcontain">
						<span id="tipoDocumento-label" class="property-label"><g:message code="empleado.tipoDocumento.label" default="Tipo Documento" /></span>

						<span class="property-value" aria-labelledby="tipoDocumento-label"><g:fieldValue bean="${empleadoInstance}" field="tipoDocumento"/></span>

					</li>
				</g:if>

				<g:if test="${empleadoInstance?.numDocumento}">
					<li class="fieldcontain">
						<span id="numDocumento-label" class="property-label"><g:message code="empleado.numDocumento.label" default="Num Documento" /></span>

						<span class="property-value" aria-labelledby="numDocumento-label"><g:fieldValue bean="${empleadoInstance}" field="numDocumento"/></span>

					</li>
				</g:if>

				<g:if test="${empleadoInstance?.ciudad}">
				<li class="fieldcontain">
					<span id="ciudad-label" class="property-label"><g:message code="empleado.ciudad.label" default="Ciudad" /></span>
					
						<span class="property-value" aria-labelledby="ciudad-label"><g:fieldValue bean="${empleadoInstance}" field="ciudad"/></span>
					
				</li>
				</g:if>

				<g:if test="${empleadoInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="empleado.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${empleadoInstance}" field="direccion"/></span>
					
				</li>
				</g:if>

			
				<g:if test="${empleadoInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="empleado.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${empleadoInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			

			
			</ol>
			<g:form url="[resource:empleadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${empleadoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
