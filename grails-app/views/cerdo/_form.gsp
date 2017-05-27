<%@ page import="pfporcino.Cerdo" %>



<div class="fieldcontain ${hasErrors(bean: cerdoInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="cerdo.id.label" default="Id" />
		
	</label>
	<g:field type="number" name="id" value="${cerdoInstance.id}" />

</div>

<div class="fieldcontain ${hasErrors(bean: cerdoInstance, field: 'estadoActual', 'error')} required">
	<label for="estadoActual">
		<g:message code="cerdo.estadoActual.label" default="Estado Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estadoActual" from="${pfporcino.Estado?.values()}" keys="${pfporcino.Estado.values()*.name()}" required="" value="${cerdoInstance?.estadoActual?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: cerdoInstance, field: 'identificacion', 'error')} required">
	<label for="identificacion">
		<g:message code="cerdo.identificacion.label" default="Identificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identificacion" required="" value="${cerdoInstance?.identificacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cerdoInstance, field: 'lote', 'error')} required">
	<label for="lote">
		<g:message code="cerdo.lote.label" default="Lote" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lote" name="lote.id" from="${pfporcino.Lote.list()}" optionKey="id" required="" value="${cerdoInstance?.lote?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cerdoInstance, field: 'pesoActual', 'error')} required">
	<label for="pesoActual">
		<g:message code="cerdo.pesoActual.label" default="Peso Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pesoActual" value="${fieldValue(bean: cerdoInstance, field: 'pesoActual')}" required=""/>

</div>

