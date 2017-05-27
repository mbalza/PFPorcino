
<%@ page import="pfporcino.Estado; pfporcino.Lote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lote.label', default: 'Lote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lote" class="content scaffold-show" role="main">
			<h1>Lote</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lote">


				<g:if test="${loteInstance?.identificacion}">
					<li class="fieldcontain">
						<span id="identificacion-label" class="property-label"> Identificación </span>

						<span class="property-value" aria-labelledby="identificacion-label"><g:fieldValue bean="${loteInstance}" field="identificacion"/></span>

					</li>
				</g:if>

                <g:if test="${loteInstance?.etapaActual}">
                    <li class="fieldcontain">
                        <span id="etapaActual-label" class="property-label"><g:message code="lote.etapaActual.label" default="Etapa Actual" /></span>

                        <span class="property-value" aria-labelledby="etapaActual-label"><g:fieldValue bean="${loteInstance}" field="etapaActual"/></span>

                    </li>
                </g:if>

				<g:if test="${loteInstance?.cantidadCerdosActual}">
				<li class="fieldcontain">
					<span id="cantidadCerdosActual-label" class="property-label"><g:message code="lote.cantidadCerdosActual.label" default="Cantidad Cerdos Actual" /></span>
					
						<span class="property-value" aria-labelledby="cantidadCerdosActual-label"><g:fieldValue bean="${loteInstance}" field="cantidadCerdosActual"/></span>
					
				</li>
				</g:if>

                <g:if test="${loteInstance?.madre}">
                    <li class="fieldcontain">
                        <span id="madre-label" class="property-label"><g:message code="lote.madre.label" default="Madre" /></span>

                        <span class="property-value" aria-labelledby="madre-label"><g:link controller="madre" action="show" id="${loteInstance?.madre?.id}">${loteInstance?.madre?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${loteInstance?.padre}">
                    <li class="fieldcontain">
                        <span id="padre-label" class="property-label"><g:message code="lote.padre.label" default="Padre" /></span>

                        <span class="property-value" aria-labelledby="padre-label"><g:link controller="padre" action="show" id="${loteInstance?.padre?.id}">${loteInstance?.padre?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>


                <g:if test="${loteInstance?.cerdos}">
				<li class="fieldcontain">
					<span id="cerdos-label" class="property-label"><g:message code="lote.cerdos.label" default="Cerdos" /></span>
					
						<g:each in="${loteInstance.cerdos.sort{it.identificacion}.findAll{it.estadoActual == 'Vivo' as pfporcino.Estado}}" var="c">
						<span class="property-value" aria-labelledby="cerdos-label"><g:link controller="cerdo" action="show" params="${c.getPK()}" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

			</ol>
			<g:form url="[resource:loteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${loteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
