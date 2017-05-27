<%@ page import="pfporcino.VacunaLote" %>

<div class="fieldcontain ${hasErrors(bean: vacunaLoteInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="vacunaLote.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${vacunaLoteInstance?.fecha}"  />

</div>

<div class="fieldcontain required">
    <label for="etapa">
        <g:message code="alimentacion.lote.label" default="Etapa" />
        <span class="required-indicator">*</span>
    </label>
    <g:select onchange="verLote()" id="etapa" name="etapa" from="${pfporcino.Etapa.list()}" optionKey="nombre" required="" noSelection="['null': '']" value="${vacunaLoteInstance?.lote?.etapaActual}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alimentacionInstance, field: 'lote', 'error')} required" id="lotesNacimiento" style="display: none" >
    <label for="lote">
        <g:message code="alimentacion.lote.label" default="Lote" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="loteNacimiento" name="loteNacimiento" from="${pfporcino.Lote.list().findAll{it.etapaActual.nombre=='Nacimiento'}}" optionKey="id" required="" class="many-to-one"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: alimentacionInstance, field: 'lote', 'error')} " id="lotesDestete" style="display: none">
    <label for="lote">
        <g:message code="alimentacion.lote.label" default="Lote" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="loteDestete" name="loteDestete" from="${pfporcino.Lote.list().findAll{it.etapaActual.nombre=='Destete'}}" optionKey="id"   class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alimentacionInstance, field: 'lote', 'error')} " id="lotesPreceba" style="display: none">
    <label for="lote">
        <g:message code="alimentacion.lote.label" default="Lote" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="lotePreCeba" name="lotePreCeba" from="${pfporcino.Lote.list().findAll{it.etapaActual.nombre=='Pre-ceba'}}" optionKey="id"  class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alimentacionInstance, field: 'lote', 'error')}" id="lotesSalida" style="display: none">
    <label for="lote">
        <g:message code="alimentacion.lote.label" default="Lote" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="loteSalida" name="loteSalida42" from="${pfporcino.Lote.list().findAll{it.etapaActual.nombre=='Salida'}}" optionKey="id"   class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vacunaLoteInstance, field: 'vacuna', 'error')} required">
	<label for="vacuna">
		<g:message code="vacunaLote.vacuna.label" default="Vacuna" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vacuna" name="vacuna" from="${pfporcino.Vacuna.list()}" optionKey="id" required="" value="${vacunaLoteInstance?.vacuna?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vacunaLoteInstance, field: 'empleado', 'error')} required">
    <label for="empleado">
        <g:message code="vacunaLote.empleado.label" default="Empleado" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="empleado" name="empleado" from="${pfporcino.Empleado.list()}" optionKey="PKS" required="" value="${vacunaLoteInstance?.empleado?.PKS}" class="many-to-one"/>

</div>