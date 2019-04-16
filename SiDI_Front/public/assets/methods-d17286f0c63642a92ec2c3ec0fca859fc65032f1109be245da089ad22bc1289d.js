function initTurno(geturno){

    var turno = geturno.replace("%20", " ");

    reload(turno);
}

function initVali(getToken){

    if (getToken == ""){
        window.location.href = "/salida"
    }

}


function cargaSem(){

        $("#servL").addClass("not-available");
        $("#horL").addClass("not-available");
        $("#bolL").addClass("not-available");
        $("#servLm").text("No disponible");
        $("#horLm").text("Disponible");
        $("#bolLm").text("No disponible");
        $("#barMed").css("width: 0%;");
        $("#porcentC").text("0% completado");
        $("#pasoH").text("0");
        $("#totalH").text("0");
        $("#msgPaso").text("No ha terminado su inscripción.");
        swal("Error al cargar", "Hubo un error con tus opciones, vuelve a intentarlo mas tarde", "error");

}

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
;
