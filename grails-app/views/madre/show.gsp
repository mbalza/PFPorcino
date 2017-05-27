
<%@ page import="pfporcino.Madre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'madre.label', default: 'Madre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-madre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-madre" class="content scaffold-show" role="main">
			<h1>Ver Madre</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list madre">


                <g:if test="${madreInstance?.id}">
                    <li class="fieldcontain">
                        <span id="id-label" class="property-label"><g:message code="madre.fechaEntrada.label" default="Identificación" /></span>

                        <span class="property-value" aria-labelledby="id-label">${madreInstance.id}</span>

                    </li>
                </g:if>

				<g:if test="${madreInstance?.fechaEntrada}">
				<li class="fieldcontain">
					<span id="fechaEntrada-label" class="property-label"><g:message code="madre.fechaEntrada.label" default="Fecha Entrada" /></span>
					
						<span class="property-value" aria-labelledby="fechaEntrada-label"><g:formatDate format="dd-MM-yyyy" date="${madreInstance?.fechaEntrada}" /></span>
					
				</li>
				</g:if>

				<g:if test="${madreInstance?.lotes}">
				<li class="fieldcontain">
					<span id="lotes-label" class="property-label"><g:message code="madre.lotes.label" default="Lotes" /></span>
					
						<g:each in="${madreInstance.lotes}" var="l">
						<span class="property-value" aria-labelledby="lotes-label"><g:link controller="lote" action="show" id="${l.id}"> ${l?.encodeAsHTML()} </g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${madreInstance?.partosTotales}">
				<li class="fieldcontain">
					<span id="partosTotales-label" class="property-label"><g:message code="madre.partosTotales.label" default="Partos Totales" /></span>
					
						<span class="property-value" aria-labelledby="partosTotales-label"><g:fieldValue bean="${madreInstance}" field="partosTotales"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:madreInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${madreInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
