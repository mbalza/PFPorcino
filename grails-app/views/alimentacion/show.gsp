
<%@ page import="pfporcino.Alimentacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alimentacion.label', default: 'Alimentacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alimentacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alimentacion" class="content scaffold-show" role="main">
			<h1>Alimentación</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alimentacion">
			
				<g:if test="${alimentacionInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="alimentacion.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${alimentacionInstance}" field="cantidad"/> kg</span>
					
				</li>
				</g:if>
			

				<g:if test="${alimentacionInstance?.empleado}">
				<li class="fieldcontain">
					<span id="empleado-label" class="property-label"><g:message code="alimentacion.empleado.label" default="Empleado" /></span>
					
						<span class="property-value" aria-labelledby="empleado-label"><g:link controller="empleado" action="show" id="${alimentacionInstance?.empleado?.id}">${alimentacionInstance?.empleado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alimentacionInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="alimentacion.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${alimentacionInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alimentacionInstance?.formula}">
				<li class="fieldcontain">
					<span id="formula-label" class="property-label"><g:message code="alimentacion.formula.label" default="Formula" /></span>
					
						<span class="property-value" aria-labelledby="formula-label"><g:link controller="formulaEncabezado" action="show" id="${alimentacionInstance?.formula?.id}">${alimentacionInstance?.formula?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			

				<g:if test="${alimentacionInstance?.lote}">
				<li class="fieldcontain">
					<span id="lote-label" class="property-label"><g:message code="alimentacion.lote.label" default="Lote" /></span>
					
						<span class="property-value" aria-labelledby="lote-label"><g:link controller="lote" action="show" id="${alimentacionInstance?.lote?.id}">${alimentacionInstance?.lote?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:alimentacionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${alimentacionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
