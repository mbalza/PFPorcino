<%@ page import="pfporcino.Estado; pfporcino.Lote" %>

<table class="table">
    <thead>
    <tr>
        <th>Cerdo</th>
        <th>Peso</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${cerdoList}" status="i" var="cerdoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <th scope="row">${cerdoInstance.identificacion}</th>
            <g:field type="hidden" name="identificacion" value="${cerdoInstance.identificacion}"/>

            <td><g:field type="number" step="0.01" id="peso" required="" min="0" class="form-control mb-2 mr-sm-2 mb-sm-0" name="peso" placeholder="Kg"/></td>

            <td><g:select id="estado" class="form-control mb-2 mr-sm-2 mb-sm-0" name="estado" from="${pfporcino.Estado.values().findAll{it!= pfporcino.Estado.Momia}}" required=""/></td>
        </tr>
    </g:each>
    </tbody>
</table>