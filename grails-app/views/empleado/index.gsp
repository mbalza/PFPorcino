
<%@ page import="pfporcino.Empleado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'empleado.label', default: 'Empleado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-empleado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-empleado" class="content scaffold-list" role="main">
			<h1>Empleados</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="apellidos" title="${message(code: 'empleado.apellidos.label', default: 'Apellidos')}" />

                        <g:sortableColumn property="nombres" title="${message(code: 'empleado.nombres.label', default: 'Nombres')}" />
					
						<g:sortableColumn property="ciudad" title="${message(code: 'empleado.ciudad.label', default: 'Ciudad')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'empleado.direccion.label', default: 'Direccion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${empleadoInstanceList}" status="i" var="empleadoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" params="${empleadoInstance.getPK()}">${fieldValue(bean: empleadoInstance, field: "apellidos")}</g:link></td>

                        <td>${fieldValue(bean: empleadoInstance, field: "nombres")}</td>
					
						<td>${fieldValue(bean: empleadoInstance, field: "ciudad")}</td>
					
						<td>${fieldValue(bean: empleadoInstance, field: "direccion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${empleadoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
