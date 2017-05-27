
<%@ page import="pfporcino.Cerdo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cerdo.label', default: 'Cerdo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cerdo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cerdo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'cerdo.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="estadoActual" title="${message(code: 'cerdo.estadoActual.label', default: 'Estado Actual')}" />
					
						<g:sortableColumn property="identificacion" title="${message(code: 'cerdo.identificacion.label', default: 'Identificacion')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'cerdo.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="cerdo.lote.label" default="Lote" /></th>
					
						<g:sortableColumn property="pesoActual" title="${message(code: 'cerdo.pesoActual.label', default: 'Peso Actual')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cerdoInstanceList}" status="i" var="cerdoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cerdoInstance.id}">${fieldValue(bean: cerdoInstance, field: "dateCreated")}</g:link></td>
					
						<td>${fieldValue(bean: cerdoInstance, field: "estadoActual")}</td>
					
						<td>${fieldValue(bean: cerdoInstance, field: "identificacion")}</td>
					
						<td><g:formatDate date="${cerdoInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: cerdoInstance, field: "lote")}</td>
					
						<td>${fieldValue(bean: cerdoInstance, field: "pesoActual")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cerdoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
