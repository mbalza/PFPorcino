<%@ page import="pfporcino.Alimentacion" %>

<div class="fieldcontain ${hasErrors(bean: alimentacionInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="alimentacion.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${alimentacionInstance?.fecha}"  />

</div>

<div class="fieldcontain required">
    <label for="etapa">
        <g:message code="alimentacion.lote.label" default="Etapa" />
        <span class="required-indicator">*</span>
    </label>
    <g:select onchange="verLote()" id="etapa" name="etapa" from="${pfporcino.Etapa.list()}" optionKey="nombre" required="" noSelection="['null': '']" value="${alimentacionInstance?.lote?.etapaActual}" class="many-to-one"/>
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

<div class="fieldcontain ${hasErrors(bean: alimentacionInstance, field: 'formula', 'error')} required">
    <label for="formula">
        <g:message code="alimentacion.formula.label" default="Fórmula" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="formula" name="formula.id" from="${pfporcino.FormulaEncabezado.list()}" optionKey="id" required="" value="${alimentacionInstance?.formula?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alimentacionInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="alimentacion.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" required="" type="number" min="0" step="0.01" placeholder="kg" value="${alimentacionInstance?.cantidad?alimentacionInstance.cantidad:''}" />

</div>

<div class="fieldcontain ${hasErrors(bean: alimentacionInstance, field: 'empleado', 'error')} required">
	<label for="empleado">
		<g:message code="alimentacion.empleado.label" default="Empleado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="empleado1" name="empleado1" from="${pfporcino.Empleado.list()}" optionKey="PKS" required="" value="${alimentacionInstance?.empleado?.PKS}" class="many-to-one"/>

</div>



