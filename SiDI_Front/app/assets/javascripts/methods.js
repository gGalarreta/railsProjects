function initTurno(geturno){

    var turno = geturno.replace("%20", " ");

    reload(turno);
}

function initVali(getToken){

    if (getToken == ""){
        window.location.href = "/salida"
    }

}


function cargaSem(sem){

    switch(sem) {
        case 2:
            $("#servL").addClass("not-available");
            $("#horL").addClass("incomplete");
            $("#bolL").addClass("not-available");
            $("#servLm").text("No disponible");
            $("#horLm").text("Incompleto");
            $("#bolLm").text("No disponible");
            $("#barMed").css("width","0%");
            $("#porcentC").text("0% completado");
            $("#pasoH").text("0");
            $("#totalH").text("3");
            $("#msgPaso").text("No ha terminado su inscripción.");
            break;
        case 3:
            $("#servL").addClass("completed");
            $("#horL").addClass("incomplete");
            $("#bolL").addClass("not-available");
            $("#servLm").text("Incompleto");
            $("#horLm").text("Completado");
            $("#bolLm").text("No disponible");
            $("#barMed").css("width", "30%");
            $("#porcentC").text("30% completado");
            $("#pasoH").text("2");
            $("#totalH").text("3");
            $("#msgPaso").text("No ha terminado su inscripción.");
            break;
        case 4:
            $("#servL").addClass("completed");
            $("#horL").addClass("completed");
            $("#bolL").addClass("incomplete");
            $("#servLm").text("Completado");
            $("#horLm").text("Completado");
            $("#bolLm").text("Incopleto");
            $("#barMed").css("width", "70%");
            $("#porcentC").text("70% completado");
            $("#pasoH").text("2");
            $("#totalH").text("3");
            $("#msgPaso").text("No ha terminado su inscripción.");
            break;
        case 5:
            $("#servL").addClass("completed");
            $("#horL").addClass("completed");
            $("#bolL").addClass("completed");
            $("#servLm").text("Completado");
            $("#horLm").text("Completado");
            $("#bolLm").text("Completado");
            $("#barMed").css("width", "100%");
            $("#porcentC").text("100% completado");
            $("#pasoH").text("3");
            $("#totalH").text("3");
            $("#msgPaso").text("Ha terminado su inscripción.");
            break;
        default:
            $("#servL").addClass("not-available");
            $("#horL").addClass("incomplete");
            $("#bolL").addClass("not-available");
            $("#servLm").text("No disponible");
            $("#horLm").text("Incompleto");
            $("#bolLm").text("No disponible");
            $("#barMed").css("width: 0%;");
            $("#porcentC").text("0% completado");
            $("#pasoH").text("0");
            $("#totalH").text("3");
            $("#msgPaso").text("No ha terminado su inscripción.");
            break;
    }


}

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}