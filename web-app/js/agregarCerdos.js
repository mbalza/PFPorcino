var jQuery = jQuery.noConflict();

function agregarCerdos() {
    var idCerdo = jQuery('#idCerdo').val();
    var encabezado = jQuery('#encabezado').val();
    var peso = jQuery('#peso').val();
    var estado = jQuery('#estado').val();
    var lote = jQuery('#identificacion').val();

    if(idCerdo.trim() == '' || peso.trim() == ''){
        alert("Verificar campos. Información del cerdo incompleta.")
    }else{
        if(!isNaN(peso) && peso>=0){
            if(confirm("Agregar cerdo " + idCerdo + " con peso " + peso + "kg y estado " + estado + ".")){
                jQuery.ajax({
                    type: "POST",
                    url:URL,
                    data: {idCerdo: idCerdo, encabezado: encabezado, peso: peso, estado: estado, lote: lote},
                    async:false,
                    success: function (dato) {
                        console.log(dato);
                        if(dato.status == "OK"){
                            jQuery("#tablaCerdos").html(dato.results);
                        }else{
                            alert(dato.results);
                        }
                    }
                });
            }
        }else{
            alert("Peso invalido.")
        }
    }
}