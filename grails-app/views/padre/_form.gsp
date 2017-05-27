<%@ page import="pfporcino.Padre" %>




<div class="fieldcontain ${hasErrors(bean: padreInstance, field: 'identificacion', 'error')} required">
	<label for="identificacion">
		<g:message code="padre.identificacion.label" default="Identificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identificacion" required="" value="${padreInstance?.identificacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: padreInstance, field: 'fechaEntrada', 'error')} required">
	<label for="fechaEntrada">
		<g:message code="padre.fechaEntrada.label" default="Fecha Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaEntrada" precision="day"  value="${padreInstance?.fechaEntrada}"  />

</div>

