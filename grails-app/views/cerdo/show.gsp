
<%@ page import="pfporcino.Cerdo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cerdo.label', default: 'Cerdo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cerdo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cerdo" class="content scaffold-show" role="main">
			<h1> Cerdo </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cerdo">

				<g:if test="${cerdoInstance?.identificacion}">
					<li class="fieldcontain">
						<span id="identificacion-label" class="property-label"><g:message code="cerdo.identificacion.label" default="Identificacion" /></span>

						<span class="property-value" aria-labelledby="identificacion-label"><g:fieldValue bean="${cerdoInstance}" field="identificacion"/></span>

					</li>
				</g:if>

                <g:if test="${cerdoInstance?.lote}">
                    <li class="fieldcontain">
                        <span id="lote-label" class="property-label"><g:message code="cerdo.lote.label" default="Lote" /></span>

                        <span class="property-value" aria-labelledby="lote-label"><g:link controller="lote" action="show" id="${cerdoInstance?.lote?.id}">${cerdoInstance?.lote?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

				<g:if test="${cerdoInstance?.estadoActual}">
				<li class="fieldcontain">
					<span id="estadoActual-label" class="property-label"><g:message code="cerdo.estadoActual.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estadoActual-label"><g:fieldValue bean="${cerdoInstance}" field="estadoActual"/></span>
				</li>
				</g:if>
			
				<g:if test="${cerdoInstance?.pesoActual}">
				<li class="fieldcontain">
					<span id="pesoActual-label" class="property-label"><g:message code="cerdo.pesoActual.label" default="Peso" /></span>
					
						<span class="property-value" aria-labelledby="pesoActual-label"><g:fieldValue bean="${cerdoInstance}" field="pesoActual"/> kg </span>
				</li>
				</g:if>

                <g:if test="${cerdoInstance?.lote?.madre}">
                    <li class="fieldcontain">
                        <span id="madre-label" class="property-label"><g:message code="cerdo.pesoActual.label" default="Madre" /></span>

                        <span class="property-value" aria-labelledby="madre-label"> ${cerdoInstance?.lote?.madre} </span>
                    </li>
                </g:if>

                <g:if test="${cerdoInstance?.lote?.padre}">
                    <li class="fieldcontain">
                        <span id="padre-label" class="property-label"><g:message code="cerdo.pesoActual.label" default="Padre" /></span>

                        <span class="property-value" aria-labelledby="padre-label"> ${cerdoInstance?.lote?.padre} </span>
                    </li>
                </g:if>
			
			</ol>
		</div>
	</body>
</html>
