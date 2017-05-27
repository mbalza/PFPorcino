<%@ page import="pfporcino.Lote" %>

<table class="table" >
    <thead>
    <tr>
        <th>Cerdo</th>
        <th>Peso</th>
        <th>Estado</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${cerdoInstanceList}" status="i" var="cerdoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <th width="10%" scope="row">${cerdoInstance.identificacion}</th>

            <td>${cerdoInstance.pesoActual + ' kg'}</td>

            <td>${cerdoInstance.estadoActual}</td>
        </tr>
    </g:each>
    </tbody>
</table>