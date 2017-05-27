
<%@ page import="pfporcino.VacunaLote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacunaLote.label', default: 'VacunaLote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vacunaLote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vacunaLote" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vacunaLote">
			
				<g:if test="${vacunaLoteInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="vacunaLote.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${vacunaLoteInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacunaLoteInstance?.empleado}">
				<li class="fieldcontain">
					<span id="empleado-label" class="property-label"><g:message code="vacunaLote.empleado.label" default="Empleado" /></span>
					
						<span class="property-value" aria-labelledby="empleado-label"><g:link controller="empleado" action="show" id="${vacunaLoteInstance?.empleado?.id}">${vacunaLoteInstance?.empleado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacunaLoteInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="vacunaLote.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${vacunaLoteInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacunaLoteInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="vacunaLote.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${vacunaLoteInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacunaLoteInstance?.lote}">
				<li class="fieldcontain">
					<span id="lote-label" class="property-label"><g:message code="vacunaLote.lote.label" default="Lote" /></span>
					
						<span class="property-value" aria-labelledby="lote-label"><g:link controller="lote" action="show" id="${vacunaLoteInstance?.lote?.id}">${vacunaLoteInstance?.lote?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vacunaLoteInstance?.vacuna}">
				<li class="fieldcontain">
					<span id="vacuna-label" class="property-label"><g:message code="vacunaLote.vacuna.label" default="Vacuna" /></span>
					
						<span class="property-value" aria-labelledby="vacuna-label"><g:link controller="vacuna" action="show" id="${vacunaLoteInstance?.vacuna?.id}">${vacunaLoteInstance?.vacuna?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vacunaLoteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vacunaLoteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
