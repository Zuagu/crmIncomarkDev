$(document).ready(function () {
    //iniciar el dropdown del menu
    $('.modal').modal({
        dismissible: true,
        opacity: 0.4,
        inDuration: 500,
        outDuration: 250
    });
    $('.tabs').tabs();
    $('select').formSelect({container: "body"});

    $(".dropdown-trigger").dropdown({constrainWidth: false});
    $('.collapsible').collapsible();

    $('.datepicker').datepicker({

        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        autoClose: true,
        closeOnSelect: true, // Close upon selecting a date,
        format: "yyyy-mm-dd"
    });
    $('.timepicker').timepicker({
        default: 'now', // Set default time: 'now', '1:30AM', '16:30'
        fromnow: 0, // set default time to * milliseconds from now (using with default = 'now')
        twelvehour: false, // Use AM/PM or 24-hour format
        donetext: 'OK', // text for done-button
        cleartext: 'Clear', // text for clear-button
        canceltext: 'Cancel', // Text for cancel-button,
        container: "body", // ex. 'body' will append picker to body
        autoclose: false, // automatic close timepicker
        ampmclickable: true, // make AM PM clickable
        aftershow: function () {} //Function for after opening timepicker
    });
    $('select').formSelect();

});
//siguiente
$(".cambio").click(function () {
    let datos_obligatorios = [
        "nombre_solicitante",
        "puesto_solicitado",
        "tipo_callcenter",
        "mora_manejada",
        "sucursal",
        "reclutador",
        "medio_contacto",
        "medio_especifico",
        "calle_solicitante",
        "colonia_solicitante",
        "ciudad_solicitante",
        "estado_solicitante",
        "numero_celular",
        "email",
        "fecha_nacimiento",
        "ciudad_nacimiento",
        "estado_nacimiento",
        "sexo_solicitante",
        "edad_solicitante",
        "estado_civil",
        "dep_eco",
        "turno_solicitante",
        "disp_residencia",
        "disp_viajar",
        "auto_propio",
        "lic_vigente",
        "trab_actual",
        "act_estudias",
        "curp",
        "virtud_cualidad",
        "nivel_estudios",
        "nombre_institucion_academica",
        "porcentaje_ingles",
        "software",
        "nombre_padre_solicitante",
        "nombre_madre_solicitante"];

    let id = $(this).attr("id");
    let numero_form = id.replace("regreso", "form_").replace("paso", "form_");
    let id_padre = $(this).parent().parent().attr("id");

    let val_inputs = $("#" + id_padre + " input");
    let val_selects = $("#" + id_padre + " select");

//    console.log(val_inputs);
//    console.log(val_selects);
//    
//    for (let val_select of val_selects) {
//        console.log(val_select.val() ); 
//    }
    if (val_inputs.length === 0) {
        $("#" + id_padre).addClass("hide");
        $("#" + numero_form).removeClass("hide");
    }

    for (let val_input of val_inputs) {
        console.log(val_input.id);
        console.log(val_input.value);
        if (datos_obligatorios.includes(val_input.id)) {
            $("#" + val_input.id).css("border-bottom", "1px solid green");
            if (val_input.value === "") {
                $("#" + numero_form).addClass("hide");
                $("#" + id_padre).removeClass("hide");
                alert("Favor de llenar # el dato faltante");
                $("#" + val_input.id).css("border-bottom", "1px solid red");



            } else {
                $("#" + id_padre).addClass("hide");
                $("#" + numero_form).removeClass("hide");
            }
        } else {
            $("#" + id_padre).addClass("hide");
            $("#" + numero_form).removeClass("hide");
        }
    }

    if (val_selects.length === 0) {
        $("#" + id_padre).addClass("hide");
        $("#" + numero_form).removeClass("hide");
    }

    for (let val_select of val_selects) {
        console.log(val_select.id);
        console.log(val_select.value);
        if (datos_obligatorios.includes(val_select.id)) {
            $("#" + val_select.id).css("border-bottom", "1px solid green");
            if (val_select.value === "") {
                $("#" + numero_form).addClass("hide");
                $("#" + id_padre).removeClass("hide");
                alert("Favor de llenar # el dato faltante");
                $("#" + val_input.id).css("border-bottom", "1px solid red");



            } else {
                $("#" + id_padre).addClass("hide");
                $("#" + numero_form).removeClass("hide");
            }
        } else {
            $("#" + id_padre).addClass("hide");
            $("#" + numero_form).removeClass("hide");
        }
    }

});

$("#guardar").click(function () {
    let datos_solicitud = [
        "nombre_solicitante",
        "puesto_solicitado",
        "tipo_callcenter",
        "mora_manejada",
        "sucursal",
        "reclutador",
        "medio_contacto",
        "medio_especifico",
        "calle_solicitante",
        "colonia_solicitante",
        "ciudad_solicitante",
        "estado_solicitante",
        "numero_casa",
        "numero_celular",
        "email",
        "fecha_nacimiento",
        "ciudad_nacimiento",
        "estado_nacimiento",
        "sexo_solicitante",
        "edad_solicitante",
        "imss",
        "clinica_solicitante",
        "estado_civil",
        "rfc_solicitante",
        "dep_eco",
        "infonavit_solicitante",
        "turno_solicitante",
        "disp_residencia",
        "disp_viajar",
        "auto_propio",
        "lic_vigente",
        "trab_actual",
        "hor_otro_trabajo_1",
        "hor_otro_trabajo_2",
        "act_estudias",
        "hor_escuela_1",
        "hor_escuela_2",
        "curp",
        "virtud_cualidad",
        "nivel_estudios",
        "nombre_institucion_academica",
        "porcentaje_ingles",
        "software",
        "nombre_padre_solicitante",
        "domicilio_padre",
        "edad_padre",
        "ocupacion_padre",
        "nombre_madre_solicitante",
        "domicilio_madre",
        "edad_madre",
        "ocupacion_madre",
        "nombre_otro_solicitante",
        "domicilio_otro",
        "edad_otro",
        "ocupacion_otro",
        "nombre_otro_solicitante_2",
        "domicilio_otro_2",
        "edad_otro_2",
        "ocupacion_otro_2",
        "nombre_ultima_empresa",
        "domicilio_ultima_empresa",
        "giro_ultima_empresa",
        "dep_ultima_empresa",
        "puesto_ultima_empresa",
        "mora_ultima_empresa",
        "telefono_ultimo_trabajo",
        "fecha_inicio_ultimo",
        "fecha_fin_ultimo",
        "sueldo_ultimo",
        "comision_ultimo",
        "producto_ultimo",
        "motivo_ultimo",
        "funciones_ultimo",
        "herramienta_ultimo",
        "nombre_penultima_empresa",
        "domicilio_penultima_empresa",
        "giro_penultima_empresa",
        "dep_penultima_empresa",
        "puesto_penultima_empresa",
        "mora_penultima_empresa",
        "telefono_penultimo_trabajo",
        "fecha_inicio_penultimo",
        "fecha_fin_penultimo",
        "sueldo_penultimo",
        "comision_penultimo",
        "producto_penultimo",
        "motivo_penultimo",
        "funciones_penultimo",
        "herramienta_penultimo",
        "nombre_antepenultima_empresa",
        "domicilio_antepenultima_empresa",
        "giro_antepenultima_empresa",
        "dep_antepenultima_empresa",
        "puesto_antepenultima_empresa",
        "mora_antepenultima_empresa",
        "telefono_antepenultimo_trabajo",
        "fecha_inicio_antepenultimo",
        "fecha_fin_antepenultimo",
        "sueldo_antepenultimo",
        "comision_antepenultimo",
        "producto_antepenultimo",
        "motivo_antepenultimo",
        "funciones_antepenultimo",
        "herramienta_antepenultimo"];




    let objeto_solicitud = {};
    for (let id_selector of datos_solicitud) {
        if ($("#" + id_selector).val() === "") {

        }
        objeto_solicitud[id_selector] = $("#" + id_selector).val();
    }


});




