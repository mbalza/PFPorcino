var jQuery = jQuery.noConflict();

function verLote(){
    var etapa = jQuery('#etapa').val();
    switch (etapa){
        case "Nacimiento":
            document.getElementById('lotesNacimiento').style.display = 'block';
            document.getElementById('lotesDestete').style.display = 'none';
            document.getElementById('lotesPreceba').style.display = 'none';
            document.getElementById('lotesSalida').style.display = 'none';
            break;

        case "Destete":
            document.getElementById('lotesNacimiento').style.display = 'none';
            document.getElementById('lotesDestete').style.display = 'block';
            document.getElementById('lotesPreceba').style.display = 'none';
            document.getElementById('lotesSalida').style.display = 'none';
            break;

        case "Pre-ceba":
            document.getElementById('lotesNacimiento').style.display = 'none';
            document.getElementById('lotesDestete').style.display = 'none';
            document.getElementById('lotesPreceba').style.display = 'block';
            document.getElementById('lotesSalida').style.display = 'none';
            break;

        case "Salida":
            document.getElementById('lotesNacimiento').style.display = 'none';
            document.getElementById('lotesDestete').style.display = 'none';
            document.getElementById('lotesPreceba').style.display = 'none';
            document.getElementById('lotesSalida').style.display = 'block';
            break;

        default:
            document.getElementById('lotesNacimiento').style.display = 'none';
            document.getElementById('lotesDestete').style.display = 'none';
            document.getElementById('lotesPreceba').style.display = 'none';
            document.getElementById('lotesSalida').style.display = 'none';
            break;
    }
}