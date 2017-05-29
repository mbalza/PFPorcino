<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alimentacion.label', default: 'Alimentacion')}" />
		<title>Alimentación Lote</title>
		<g:javascript library="alimentacionCreate" />
	</head>
	<body>
		%{--<a href="#create-alimentacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%
		<div id="create-alimentacion" class="content scaffold-create" role="main">
			<h1>ALIMENTACIÓN LOTE</h1>
            <g:if test="${flash.error}">
                <div class="errors mio" role="status">${flash.error}</div>
            </g:if>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${alimentacionInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${alimentacionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:alimentacionInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Aceptar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
