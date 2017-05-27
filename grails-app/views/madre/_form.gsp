<%@ page import="pfporcino.Madre" %>

<div class="fieldcontain ${hasErrors(bean: madreInstance, field: 'identificacion', 'error')} ">
	<label for="identificacion">
		<g:message code="madre.identificacion.label" default="Identificacion" />

	</label>
	<g:textField name="identificacion" required="" value="${madreInstance?.identificacion}" />

</div>

<div class="fieldcontain ${hasErrors(bean: madreInstance, field: 'fechaEntrada', 'error')} required">
	<label for="fechaEntrada">
		<g:message code="madre.fechaEntrada.label" default="Fecha Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaEntrada" precision="day"  value="${madreInstance?.fechaEntrada}"  />

</div>




