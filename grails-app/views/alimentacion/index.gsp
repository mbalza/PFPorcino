
<%@ page import="pfporcino.Alimentacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alimentacion.label', default: 'Alimentacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{--<a href="#list-alimentacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="list-alimentacion" class="content scaffold-list" role="main">
			<h1>Registro Alimentación</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="fecha" title="Fecha" />

						<g:sortableColumn property="cantidad" title="Cantidad" />

						<g:sortableColumn property="formula" title="Fórmula" />

						<g:sortableColumn property="lote" title="Lote" />

						<g:sortableColumn property="empleado" title="Empleado" />

						<g:sortableColumn property="lastUpdated" title="Fecha de Registro" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${alimentacionInstanceList}" status="i" var="alimentacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:formatDate format="yyyy-dd-MM" date="${alimentacionInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: alimentacionInstance, field: "cantidad")} kg</td>

						<td>${fieldValue(bean: alimentacionInstance, field: "formula")}</td>

						<td>${fieldValue(bean: alimentacionInstance, field: "lote")}</td>

						<td>${fieldValue(bean: alimentacionInstance, field: "empleado")}</td>

						<td>${fieldValue(bean: alimentacionInstance, field: "lastUpdated")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${alimentacionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
