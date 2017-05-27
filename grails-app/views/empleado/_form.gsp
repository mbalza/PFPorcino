<%@ page import="pfporcino.Empleado" %>

<div class="fieldcontain ${hasErrors(bean: empleadoInstance, field: 'nombres', 'error')} required">
	<label for="nombres">
		<g:message code="empleado.nombres.label" default="Nombres" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombres" required="" value="${empleadoInstance?.nombres}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: empleadoInstance, field: 'apellidos', 'error')} required">
	<label for="apellidos">
		<g:message code="empleado.apellidos.label" default="Apellidos" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidos" required="" value="${empleadoInstance?.apellidos}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: empleadoInstance, field: 'tipoDocumento', 'error')} required">
    <label for="tipoDocumento">
        <g:message code="empleado.tipoDocumento.label" default="Tipo Documento" />
        <span class="required-indicator">*</span>
    </label>
    <g:select from="${['CC', 'TI', 'PP']}" name="tipoDocumento" required="" value="${empleadoInstance?.tipoDocumento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empleadoInstance, field: 'numDocumento', 'error')} required">
    <label for="numDocumento">
        <g:message code="empleado.numDocumento.label" default="Num Documento" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="numDocumento" required="" value="${empleadoInstance?.numDocumento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empleadoInstance, field: 'ciudad', 'error')} ">
	<label for="ciudad">
		<g:message code="empleado.ciudad.label" default="Ciudad" />
		<span class="indicator">*</span>
	</label>
	<g:textField name="ciudad" required="" value="${empleadoInstance?.ciudad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: empleadoInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="empleado.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${empleadoInstance?.direccion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: empleadoInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="empleado.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="telefono" type="tel" value="${empleadoInstance?.telefono}" required=""/>
</div>


