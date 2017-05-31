
<%@ page import="pfporcino.Madre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'madre.label', default: 'Madre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-madre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="list-madre" class="content scaffold-list" role="main">
			<h1>Madres</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="id" title="${message(code: 'madre.dateCreated.label', default: 'Identificación')}" />

						<g:sortableColumn property="fechaEntrada" title="${message(code: 'madre.fechaEntrada.label', default: 'Fecha Entrada')}" />
					
						<g:sortableColumn property="partosTotales" title="${message(code: 'madre.partosTotales.label', default: 'Partos Totales')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${madreInstanceList}" status="i" var="madreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${madreInstance.id}">${madreInstance.identificacion}</g:link></td>
					
						<td><g:formatDate format="dd-MM-yyyy" date="${madreInstance.fechaEntrada}" /></td>
					
						<td>${fieldValue(bean: madreInstance, field: "partosTotales")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${madreInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
