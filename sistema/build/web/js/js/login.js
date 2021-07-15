
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});
$(document).on('ready', function () {
    var costume = Math.floor(Math.random() * 3) + 1;
    $("#box_image").empty();
    $("#box_image").append('<img class="width_100" src="image/logoSicsa/logo_sicsa' + costume + '.png">');
    $("#iniciar_sesion").addClass('button_log' + costume);

    $.getJSON('https://api.ipify.org?format=json', function (data) {
//                    console.log(data.ip);
        $("#ip").val(data.ip);
    });
    window.onload = function () {
    };
    window.setTimeout(function () {
        $(".container").show(5000);
        $("#preloader").hide();
        $("body").addClass("login" + costume);
    }, 5000);

});
//==============================================================================
$("#iniciar_sesion").click(function () {
    iniciar_sesion();
});
//==============================================================================
$("#password").keyup(function (e) {
    if (e.keyCode == 13) {
        iniciar_sesion();
    }
});
//==============================================================================
function iniciar_sesion() {
    $("#iniciar_sesion").hide();
    $("#cargando").show();
    if ($("#password").val() == "" || $("#id_usuario").val() == "") {
        alert("INGRESE TODOS LOS DATOS REQUERIDOS.");
        $("#iniciar_sesion").show();
        $("#cargando").hide();
    } else {
        var params = {
            action: "iniciar_sesion",
            id_perfil: $("#id_perfil").val(),
            id_usuario: $("#id_usuario").val(),
            password: $("#password").val(),
            ip: $("#ip").val()
        };
        
        $.ajax({
            type: "POST",
            url: "/sistema/ControllerUsuario",
            data: params,
            dataType: "html",
            success: function (dataRes) {
                console.log(dataRes);
                mostrar_alerta(parseInt(dataRes));
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
}
;
//==============================================================================
function mostrar_alerta(dataRes) {
    if (dataRes === 0) {
        alert("FALTA CHECAR ENTRADA");
        $("#cargando").hide();
        $("#iniciar_sesion").show();
    }
    if (dataRes === 1) {
        document.login.submit();
    }
    if (dataRes === 2) {
        alert("YA TIENE UNA SESION INICIADA, SOLO PUEDE TENER UNA A LA VEZ.");
        $("#cargando").hide();
        $("#iniciar_sesion").show();
    }
    if (dataRes === 3) {
        alert("CONTRASEÑA ERRONEA. FAVOR DE VERIFICAR.");
        $("#cargando").hide();
        $("#iniciar_sesion").show();
    }
    if (dataRes === 4) {
        alert("EMPLEADO INACTIVO. FAVOR DE VERIFICAR.");
        $("#cargando").hide();
        $("#iniciar_sesion").show();
    }
    if (dataRes === 5) {
        alert("USUARIO NO EXISTE");
        $("#cargando").hide();
        $("#iniciar_sesion").show();
    }
    if (dataRes === 6) {
        alert("HA ALCANZADO NUMERO MAXIMO DE USUARIOS EN SU LICENCIA.\n\n\
            SOLICITE AL ADMINSITRADOR UNA LICENCIA PARA MAS USUARIOS.\n\
        ");

        $("#cargando").hide();
        $("#iniciar_sesion").show();
    }
}
;

//==============================================================================
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

//==============================================================================

$("#iniciar_solicitud").click(function () {
//    alert("Falta esta Parte que ejecute en Submit");
    let data_solicitud = {
        nombre_solicitante: $("#nombre_solicitante").val(),
        email_solicitante: $("#email_solicitante").val(),
        telefono_solicitante: $("#telefono_solicitante").val()
    };
    console.log(data_solicitud);
    if (
            data_solicitud.nombre_solicitante === "" ||
            data_solicitud.email_solicitante === "" ||
            data_solicitud.telefono_solicitante === ""
        ) {
        alert(`hay datos vacios`);
    }
    else {
        document.solicitud.submit();
    }
    
    
});