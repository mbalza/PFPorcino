<%@ page import="pfporcino.Lote" %>


<div class="fieldcontain ${hasErrors(bean: pesoEstadoEncabezado, field: 'fecha', 'error')} required">
    <label for="fecha">
        Fecha
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fecha" precision="day"  value="${pesoEstadoEncabezado?.fecha}"  />
</div>

<div class="fieldcontain required">
    <label for="lote">
        <g:message code="lote.madre.label" default="Lote" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="lote" name="lote" from="${listaEtapaAnterior}" optionKey="id" optionValue="identificacion" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: loteInstance, field: 'padre', 'error')} required">
    <label for="empleado">
        <g:message code="lote.padre.label" default="Empleado que tomó los datos" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="empleado" name="empleado" from="${pfporcino.Empleado.list()}" optionKey="PKS" required="" value="${empleado?.PKS}" class="many-to-one"/>
</div>