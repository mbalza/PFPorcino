
<%@ page import="pfporcino.Lote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lote.label', default: 'Lote')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-lote" class="content scaffold-list" role="main">
			<h1>Lotes</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="id" title="Identificación" />

                        <g:sortableColumn property="etapaActual" title="Etapa" />

						<g:sortableColumn property="cantidadCerdosActual" title="No. Cerdos" />

                        <g:sortableColumn property="pesoPromedio" title="Peso Promedio" />

                        <g:sortableColumn property="madre" title="Madre" />

                        <g:sortableColumn property="padre" title="Padre" />

                        <g:sortableColumn property="lastUpdated" title="Fecha de Registro" />

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${loteInstanceList}" status="i" var="loteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${loteInstance.id}">${fieldValue(bean: loteInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: loteInstance, field: "etapaActual")}</td>

						<td>${loteInstance.cantidadCerdosActual}</td>

                        <td>${loteInstance.pesoPromedio} kg</td>

						<td>${fieldValue(bean: loteInstance, field: "madre")}</td>
					
						<td>${fieldValue(bean: loteInstance, field: "padre")}</td>

						<td>${fieldValue(bean: loteInstance, field: "lastUpdated")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${loteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
