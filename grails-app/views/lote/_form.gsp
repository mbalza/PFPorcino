<%@ page import="pfporcino.Lote" %>

<div class="fieldcontain ${hasErrors(bean: loteInstance, field: 'identificacion', 'error')} ">
    <label for="identificacion">
        <g:message code="lote.identificacion.label" default="Identificación" />

    </label>
    <g:textField name="identificacion" value="${loteInstance?.identificacion}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pesoEstadoEncabezado, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="pesoEstadoEncabezado.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${pesoEstadoEncabezado?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loteInstance, field: 'madre', 'error')} required">
	<label for="madre">
		<g:message code="lote.madre.label" default="Madre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="madre" name="madre.id" from="${pfporcino.Madre.list()}" optionKey="id" optionValue="identificacion" required="" value="${loteInstance?.madre?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: loteInstance, field: 'padre', 'error')} required">
	<label for="padre">
		<g:message code="lote.padre.label" default="Padre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="padre" name="padre.id" from="${pfporcino.Padre.list()}" optionKey="id" optionValue="identificacion" required="" value="${loteInstance?.padre?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: loteInstance, field: 'padre', 'error')} required">
    <label for="empleado">
        <g:message code="lote.padre.label" default="Empleado que tomó los datos" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="empleado" name="empleado" from="${pfporcino.Empleado.list()}" optionKey="PKS" required="" value="${empleado?.PKS}" class="many-to-one"/>
</div>


