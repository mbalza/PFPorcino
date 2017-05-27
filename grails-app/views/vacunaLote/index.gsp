
<%@ page import="pfporcino.VacunaLote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacunaLote.label', default: 'VacunaLote')}" />
		<title>Registro de Vacunación</title>
	</head>
	<body>
		<a href="#list-vacunaLote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		%{--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="list-vacunaLote" class="content scaffold-list" role="main">
			<h1>Registro de Vacunación</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

                        <g:sortableColumn property="fecha" title="Fecha" />

                        <g:sortableColumn property="vacuna" title="Vacuna" />

                        <g:sortableColumn property="lote" title="Lote" />

                        <g:sortableColumn property="empleado" title="Empleado" />

						<g:sortableColumn property="lastUpdated" title="Fecha de Registro" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vacunaLoteInstanceList}" status="i" var="vacunaLoteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:formatDate format="yyyy-dd-MM" date="${vacunaLoteInstance.fecha}" /></td>

                        <td>${fieldValue(bean: vacunaLoteInstance, field: "vacuna")}</td>

                        <td>${fieldValue(bean: vacunaLoteInstance, field: "lote")}</td>

						<td>${fieldValue(bean: vacunaLoteInstance, field: "empleado")}</td>
					
						<td><g:formatDate date="${vacunaLoteInstance.lastUpdated}" /></td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vacunaLoteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
