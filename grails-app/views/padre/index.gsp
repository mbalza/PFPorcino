
<%@ page import="pfporcino.Padre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'padre.label', default: 'Padre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-padre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-padre" class="content scaffold-list" role="main">
			<h1>Padres</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'padre.identificacion.label', default: 'Identificacion')}" />
						<g:sortableColumn property="fechaEntrada" title="${message(code: 'padre.fechaEntrada.label', default: 'Fecha Entrada')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${padreInstanceList}" status="i" var="padreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${padreInstance.id}">${padreInstance.identificacion}</g:link></td>
						<td><g:formatDate format="dd-MM-yyyy" date="${padreInstance.fechaEntrada}" /></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${padreInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
