<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vacunaLote.label', default: 'VacunaLote')}" />
		<title>Vacunas</title>
		<g:javascript library="alimentacionCreate" />
	</head>
	<body>
		%{--<a href="#create-vacunaLote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="create-vacunaLote" class="content scaffold-create" role="main">
			<h1>Registrar Vacuna</h1>
		    <g:if test="${flash.error}">
		    	<div class="errors mio" role="status">${flash.error}</div>
		    </g:if>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${vacunaLoteInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${vacunaLoteInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:vacunaLoteInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Registrar vacuna" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
