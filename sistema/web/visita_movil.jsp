<%-- 
    Document   : captura
    Created on : 23/01/2018, 09:43:10 AM
    Author     : Luis Cortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
    <head>
        <title>ERP</title>


        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->

        <!--ARCADE CSS-->
        <!--        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
                <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">
       
                <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
                <link type="text/css" rel="stylesheet" href="styles/all.css">
                <link type="text/css" rel="stylesheet" href="styles/main.css">-->
        <!--ARCADE CSS-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>
        <!--    <script>
                    $(function () {
                        $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 1});
                    });
                </script>-->
        <!--TERMINA CALENDARIO -->
        <script src="datepicker/jquery-ui.js"></script>
        <script>
            $(function () {
                $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 3});
            });
        </script>
        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!-- HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script> 
        <script type="text/javascript" src="highcharts/exporting.js"></script>
        <!-- HIGHCHARTS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-call-operacion.js"></script>
        <script type="text/javascript" src="js/arcade-estrategia.js"></script>

        <script type="text/javascript" src="js/arcade-estatus-cuenta.js"></script>
        <script type="text/javascript" src="js/arcade-estatus-llamada.js"></script>
        <script type="text/javascript" src="js/arcade-variable-post.js"></script>

        <script type="text/javascript" src="js/arcade-convenio.js"></script>
        <script type="text/javascript" src="js/arcade-gestor.js"></script>




        <style>

            /*             label color
                        .input-field label {
                            color: #000;
                        }
                         label focus color
                        .input-field input[type=text]:focus + label {
                            color: #000;
                        }
                         label underline focus color
                        .input-field input[type=text]:focus {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         valid color
                        .input-field input[type=text].valid {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         invalid color
                        .input-field input[type=text].invalid {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         icon prefix focus color
                        .input-field .prefix.active {
                            color: #000;
                        }*/
        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div class="row">
                <nav id="ayuda_nav" style="background:#e2060c;height: 68px !important;;" class="center-align" >
                    <div class="nav-wrapper center-align">             
                        <div id="bm16" class="input-field col s10 offset-s1  div_boton_menu" style="height: 28px;">
                            <i class="material-icons prefix" style="height:30px;color: white;margin-top: -10px;" >search</i>
                            <input id="busqueda" type="text" class="filtro" placeholder="Buscar..." style="color:white;">
                        </div>
                        <div class="col s12 div_boton_menu center-align">
                            <ul class="center-align">
                                <li style="width: 33.33%;"><a href="sass.html"><i class="material-icons" style="height: 41px;" >person</i></a></li>
                                <li style="width: 33.33%;"><a href="badges.html"><i class="material-icons" style="height: 41px;">reorder</i></a></li>
                                <li style="width: 33.33%;"><a href="collapsible.html"><i class="material-icons" style="height: 41px;">my_location</i></a></li>
                            </ul>
                        </div>
                </nav>
            </div>

            <!--END TITLE & BREADCRUMB PAGE-->           

            <!--http://materializecss.com/ Guia Materialize-->              

            <!--BEGIN CONTENT-->     
            <!--Recuerda que la pantalla se divide en 12 dependiendo del col s que uses 12 como 100% -->
            <div class="row">
                <div style="display:none">
                    <div id="consola" class="div_boton_menu_format consola" style="display:none"></div>
                   <div id="consola2" class="div_boton_menu_format consola" style="display:none"></div>

                   <input id="valor_f_seguimiento" type="hidden" value="0">
                   <div id="f_seguimiento"></div>
                </div>
                <div id="" class="col s12" style="margin-left:3%">
                    <div class="input-field col s5">
                        <input placeholder="" id="dato_general1" type="text" class="validate">
                        <label for="dato_general1" id="etiqueta1" class="etiqueta_dinamica">Cuenta</label>
                    </div>
                    <div class="input-field col s5 offset-s1">
                        <input placeholder="" id="dato_general3" type="text" class="validate">
                        <label for="dato_general3" id="etiqueta3" class="etiqueta_dinamica">Expediente</label>
                    </div>
                    <div class="input-field col s11">
                        <input placeholder="" id="dato_general2" type="text" class="validate">
                        <label for="dato_general2" id="etiqueta2" class="etiqueta_dinamica">Nombre</label>
                    </div>
                     <div class="input-field col s11">
                        <input placeholder="" id="dato_general8" type="text" class="validate">
                        <label for="dato_general8" id="etiqueta8" class="etiqueta_dinamica">Direccion</label>
                    </div>
                      <div class="input-field col s11">
                        <input placeholder="" id="dato_general7" type="text" class="validate">
                        <label for="dato_general7" id="etiqueta7" class="etiqueta_dinamica">Colonia</label>
                    </div>
                     <div class="input-field col s11">
                        <input placeholder="" id="dato_general6" type="text" class="validate">
                        <label for="dato_general6" id="etiqueta6" class="etiqueta_dinamica">Ciudad</label>
                    </div>
                    <div class="input-field col s5">
                        <input placeholder="" id="dato_general5" type="text" class="validate">
                        <label for="dato_general5" id="etiqueta5" class="etiqueta_dinamica">Asignacion</label>
                    </div>
                    <div class="input-field col s10 offset-s1" style="display:none">
                        <input placeholder="" id="dato_general4" type="text" class="validate">
                        <label for="dato_general4" id="etiqueta4" class="etiqueta_dinamica">Plan</label>
                    </div>
                    <div class="input-field col s5 offset-s1">
                        <input placeholder="" id="dato_general9" type="text" class="validate">
                        <label for="dato_general9" id="etiqueta9" class="etiqueta_dinamica">C.P.</label>
                    </div>
                    <div class="input-field col s10 offset-s1" style="display:none">
                        <input placeholder="" id="dato_general10" type="text" class="validate">
                        <label for="dato_general10" id="etiqueta10" class="etiqueta_dinamica">Inicio</label>
                    </div>
                    <div class="input-field col s10 offset-s1"style="display:none">
                        <input placeholder="" id="dato_general11" type="text" class="validate" >
                        <label for="dato_general11" id="etiqueta11" class="etiqueta_dinamica">Equipo</label>
                    </div>
                    <div class="input-field col s10 offset-s1"style="display:none">
                        <input placeholder="" id="dato_general2" type="text" class="validate">
                        <label for="dato_general2" id="etiqueta12" class="etiqueta_dinamica">M. Baja</label>
                    </div>
                    <div class="input-field col s10 offset-s1" style="display:none">
                        <input placeholder="" id="dato_general3" type="text" class="validate">
                        <label for="dato_general3" id="etiqueta13" class="etiqueta_dinamica">U. Pago</label>
                    </div>
                    <div class="input-field col s10 offset-s1" style="display:none">
                        <input placeholder="" id="dato_general4" type="text" class="validate" >
                        <label for="dato_general4" id="etiqueta14" class="etiqueta_dinamica">Plazo</label>
                    </div>
                    <div class="input-field col s5 ">
                        <input placeholder="" id="dato_general15" type="text" class="validate">
                        <label for="dato_general15" id="etiqueta15" class="etiqueta_dinamica">Devolucion</label>
                    </div>
                    <div class="input-field col s5 offset-s1">
                        <input placeholder="" id="dato_general16" type="text" class="validate">
                        <label for="dato_general16" id="etiqueta16" class="etiqueta_dinamica">Vencido</label>
                    </div>
                    <div class="input-field col s5 ">
                        <input placeholder="" id="dato_general17" type="text" class="validate">
                        <label for="dato_general17" id="etiqueta17" class="etiqueta_dinamica">Penalizacion</label>
                    </div>
                    <div class="input-field col s5 offset-s1">
                        <input placeholder="" id="dato_general18" type="text" class="validate">
                        <label for="dato_general18" id="etiqueta18" class="etiqueta_dinamica">Cancelacion</label>
                    </div>
                    <div class="input-field col s5">
                        <input placeholder="" id="dato_general19" type="text" class="validate">
                        <label for="dato_general19" id="etiqueta19" class="etiqueta_dinamica">Pagado</label>
                    </div>
                    <div class="input-field col s5 offset-s1">
                        <input placeholder="" id="dato_general20" type="text" class="validate">
                        <label for="dato_general20" id="etiqueta20" class="etiqueta_dinamica">Resto</label>
                    </div>
                    

                </div>
            </div>




        </div>



        <!--END CONTENT-->

        <!--END PAGE WRAPPER-->

    </div>

    <!--CORE JAVASCRIPT-->
    <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                //select_xxyyzz_tabla("listado_xxyyzz");
                select_cuenta_siguiente($('#usuario_sistema', parent.document).val());
                select_etiquetas_puesto_usuario($('#usuario_sistema', parent.document).val());
                $(".etiqueta_dinamica").parents('td').css("text-align", "right");
                //ESTATUS PARA LA ESTRATEGIA
                select_estatus_puesto_combo($('#usuario_sistema', parent.document).val(), "id_estatus_cuenta");
//                        select_estatus_puesto_combo($('#usuario_sistema', parent.document).val(), "id_estatus");
//                        select_estatus_puesto_combo($('#usuario_sistema', parent.document).val(), "id_estatus_cuenta");
                select_estatus_llamada_combo("id_estatus_llamada");
                fecha_hoy("fecha_agenda");
                fecha_hoy("fecha_promesa_pago");
                select_llamadas_gestor($('#usuario_sistema', parent.document).val());

                ajustes_estrategia_gestor($('#usuario_sistema', parent.document).val(), "ajustes_estrategia_gestor");
                $('select').material_select();
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 15, // Creates a dropdown of 15 years to control year,
                    today: 'Today',
                    clear: 'Clear',
                    close: 'Ok',
                    closeOnSelect: false // Close upon selecting a date,
                });
            }
            );
            //==================================================================
            $(".help").on("click", function () {
                var src = location.href;
                var aux;
                var jsp;
                aux = src.split('/sistema/');
                jsp = aux[1];
                jsp = jsp.replace('.jsp', '');
                window.open("ayuda.jsp?tema=" + jsp, "_blank");
            });
            //==================================================================
            $("#insert_xxyyzz").live("click", function () {
                insert_xxyyzz($("#xxyyzz_insert").val());
            });
            //==================================================================
            $(".delete_xxyyzz").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_xxyyzz($(this).closest("tr").attr("id"));
                }
            });
            //==================================================================
            //==================================================================
            $("#insert_nuevo_numero_contacto").click(
                    function () {
                        var _numero = $("#dato_general1").val();
                        if (es_entero(_numero)) {
                            insert_nuevo_numero_contacto(
                                    $('#usuario_sistema', parent.document).val(),
                                    $("#dato_general1").val(),
                                    $("#id_nuevo_numero_contacto").val()
                                    );
                        } else {
                            $("#consola").empty();
                            $("#consola").append('INVALIDO');
                        }
                    }
            );
            //==================================================================
            //==================================================================
            $("#insert_gestion").click(
                    function () {

                        var _texto_consola = $("#consola").text().split(" ");
                        var _numero_marcado = _texto_consola[0];
                        if (es_entero(_numero_marcado)) {
                            if ($("#gestion").val() == "" || $("#id_estatus_cuenta").val() == null) {
                                alert("INGRESE DISPOSICION DE LLAMADA.\n\
                                    \n\
                                    VERIFICA QUE PUEDAS ELEGIR UN ESTATUS, DE NO SER ASI, SOLICITA A\n\
                                    SISTEMAS INGRESAR TU USUARIO A UN EQUIPO DE LA OPERACION.");
                            } else {

                                if ($("#id_estatus_cuenta").val() == 0) {
                                    $("#consola").empty();
                                    $("#consola").append('SELECCIONE UN ESTATUS...');
                                } else {

                                    insert_gestion(
                                            $("#dato_general1").val(),
                                            _numero_marcado,
                                            $("#id_estatus_cuenta").val(),
                                            $("#id_estatus_llamada").val(),
                                            //                                    $("#agente").val(),
                                            $('#usuario_sistema', parent.document).val(),
                                            $("#gestion").val(),
                                            $("#reloj_llamada_actual").val(),
                                            $("#retraso_actual").val(),
                                            $("#dato_general3").val(),
                                            false, // PREDICTIVO,
                                            0  // F_PREDICTIVO
                                            );
                                    // Actualiza el numero de cuantas en base al codigo de la llamada
                                    update_numero_visitas($("#dato_general1").val(), $("#id_estatus_llamada").val());
                                }
                            }
                        } else {
                            $("#consola").empty();
                            $("#consola").append("SELECCIONE NUMERO");
                            ;
                        }

                    }
            );
            //==================================================================
            $("#btnsiguiente").click(
                    function () {
                        select_cuenta_siguiente(
                                $('#usuario_sistema', parent.document).val()
                                );
                    }
            );
            //==================================================================
            var tiempo_llamada_actual = setInterval(function () {
                cronometro_llamada_actual($('#usuario_sistema', parent.document).val());
            }, 1000);
            //==================================================================
            //================ BOTONES DEL MENU ================================
            //==================================================================
            $("#bm1").dblclick(function () {
                if ($("#dato_general1").val() != "" && $("#dato_general1").val() != "SIN CUENTAS") {
                    select_gestiones_cuenta_todas($("#dato_general1").val(), "divapp1");
                }
            }
            );
            //==================================================================
            $("#bm2").click(function () {
                if ($("#dato_general1").val() != "" && $("#dato_general1").val() != "SIN CUENTAS") {
                    select_referencias_bancarias(
                            $("#dato_general1").val(),
                            "input_referencias_bancarias"
                            );
                }
            }
            );
            //==================================================================                    
            $("#bm3").click(function () {
                if ($("#dato_general1").val() != "" && $("#dato_general1").val() != "SIN CUENTAS") {
                    select_pagos_cuenta_tabla(
                            $("#dato_general1").val(),
                            "divapp3"
                            );
                }
            }
            );
            //==================================================================
            $("#bm4").click(
                    function () {
                        if ($("#dato_general1").val() != "" && $("#dato_general1").val() != "SIN CUENTAS") {
                            select_cuentas_relacionadas(
                                    $("#dato_general1").val(),
                                    "divapp4"
                                    );
                        }
                    }
            );
            //==================================================================
            $("#bm5").live("click",
                    function () {
                        listado_por_estatus_gestor(
                                $('#usuario_sistema', parent.document).val(),
                                10,
                                "divapp5"
                                ); // estatus 10: PRs
                    }
            );
            //==================================================================
            $("#bm6").live("click",
                    function () {
                        listado_por_estatus_gestor(
                                $('#usuario_sistema', parent.document).val(),
                                11,
                                "divapp6"
                                ); // estatus 11: PIs
                    }
            );
            //==================================================================
            $("#bm7").live("click",
                    function () {
                        select_agendas_pareja(
                                $('#usuario_sistema', parent.document).val(),
                                "listado_agendas_pareja"
                                );
                    }
            );
            $("#insert_agenda").live("click",
                    function () {
                        insert_agenda(
                                $('#usuario_sistema', parent.document).val(),
                                $("#dato_general1").val(),
                                $("#fecha_agenda").val(),
                                $("#hora_agenda").val() + $("#minuto_agenda").val(),
                                "listado_agendas_pareja"
                                );
                    }
            );
            // INICIA FUNCION PARA VER DETALLES DEL ELEMENTO EN ESPECIFICO
            $("input.datos_cuenta_agenda").live("click",
                    function () {
                        marcar_agenda_vista($(this).closest("tr").attr("id"), $("#cuenta" + $(this).closest("tr").attr("id")).val());
                    }
            );
            //==================================================================
            $("#bm8").click(
                    function () {

                        select_notas_equipo(
                                $('#usuario_sistema', parent.document).val(),
                                "listado_notas"
                                );
                    }
            );
            $("#insert_nota").click(
                    function () {
                        if ($("#nota").val() != "") {
                            insert_nota(
                                    $('#usuario_sistema', parent.document).val(),
                                    $("#nota").val(),
                                    "listado_notas"
                                    );
                        }
                    }
            );
            $(".delete_nota").live("click",
                    function () {

                        var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                        if (confirma) {
                            delete_nota($(this).closest("tr").attr("id"));
                        }

                    }
            );
            //==================================================================
            $("#bm9").click(
                    function () {
                        if ($("#dato_general1").val() != "" && $("#dato_general1").val() != "SIN CUENTAS") {
                            select_gestiones_cuenta($("#dato_general1").val(), "divapp1");
                        }
                    }
            );
            $("#bm9").dblclick(
                    function () {
                        $("#divapp9").empty();
                        $("#divapp9").append('<iframe src="reloj.jsp" frameborder="0" style="width: 100%; height: 230px;"></iframe>');
                    }
            );
            //==================================================================
            $("#bm10").click(
                    function () {
                        select_convenio_cuenta_tabla(
                                $("#dato_general1").val(),
                                "listado_convenios"
                                );
                    }
            );
            $("#insert_convenio").click(
                    function () {
                        if ($("#fecha_promesa_pago").val() == "" || $("#importe_convenio").val() == "") {
                            $("#consola").empty();
                            $("#consola").append('INGRESE VALORES');
                        } else {
                            insert_convenio(
                                    $("#importe_convenio").val(),
                                    $("#fecha_promesa_pago").val(),
                                    $('#usuario_sistema', parent.document).val(),
                                    $("#dato_general1").val()
                                    );
                        }
                    }
            );
            $(".delete_convenio").live("click",
                    function () {
                        delete_convenio(
                                $(this).closest("tr").attr("id"),
                                $('#usuario_sistema', parent.document).val()
                                );
                    }
            );
            $("#select_mis_convenios").click(function () {
                select_convenio_gestor_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        "listado_convenios"
                        );
            });
            //==================================================================
            $("#bm12").click(
                    function () {
                        //                        cargar pagos de la asignacion del equipo del gestor...
                    }
            );
            //==================================================================
            $("#boton_mis_pagos").click(
                    function () {
                        cargar_mis_pagos();
                    });
            //==================================================================
            $("#bm13").click(
                    function () {
                        if ($("#dato_general1").val() != "" && $("#dato_general1").val() != "SIN CUENTAS") {
                            select_speech_cuenta();
                        }
                    }
            );
            //==================================================================
            $("#bm14").click(
                    function () {
                        select_estrategia_combo(
                                $('#usuario_sistema', parent.document).val(),
                                "id_estrategia"
                                );
                    }
            );
            $("#update_estrategia_gestor").click(
                    function () {
                        update_estrategia_gestor(
                                $('#usuario_sistema', parent.document).val(),
                                $('#id_estrategia').val(),
                                $('#id_estatus').val()
                                );
                        select_llamadas_gestor($('#usuario_sistema', parent.document).val());
                        $(".esconder_tool").hide();
                        $("#divapp1").show();
                    }
            );
            //==================================================================
            // PASTEL        
            $("#bm15").click(
                    function () {
                    }
            );
            $("#select_pastel_gestor").click(
                    function () {
                        alert("!QA");
                    }
            );
            //==================================================================
            $("#bm16").keyup(function (e) {
                if (e.keyCode == 13) {
                    select_buscar_cuentas($("#busqueda").val(), "divapp16");
                }
            });
            //==================================================================
            //================ BOTONES DEL MENU ================================
            //==================================================================
            $(".consola").contextmenu(
                    function () {
                        $(this).empty();
                        return false;
                    }
            );
            //==================================================================
            $(".div_boton_menu").live("click", function () {
                $(".div_boton_menu").removeClass("div_boton_menu_selected");
                $(this).addClass('div_boton_menu_selected');
                $(".esconder_tool").hide();
                var _x = $(this).attr("id");
                _x = _x.split("bm");
                var _id = _x[1];
                $("#divapp" + _id).show();
            });
            //==================================================================
            $(".cuenta_encontrada").live("click", function () {
                select_datos_cuenta_captura($(this).closest("tr").attr("id"));
                $(".esconder_tool").hide();
                $("#divapp1").show();
                select_numero_visitas($(this).closest("tr").attr("id"), "numero_visitas");
            });
            //==================================================================
            $("#f_seguimiento").click(function () {

                if ($("#dato_general1").val() != "" && $("#dato_general1").val() != "SIN CUENTAS") {

                    if ($("#valor_f_seguimiento").val() == 0) {
                        $("#valor_f_seguimiento").val(1);
                    } else {
                        $("#valor_f_seguimiento").val(0);
                    }

                    update_f_seguimiento_cuenta(
                            $("#dato_general1").val(),
                            $("#valor_f_seguimiento").val()
                            );
                    $(this).empty();
                    $(this).append("<img src='images/i_star" + $("#valor_f_seguimiento").val() + ".png' alt='' title='DARLE SEGUIMIENTO ESPECIAL A ESTA CUENTA' style='margin: 5px 0px 0px 7px; float: right; cursor: pointer;'>");
                }

            });
            //==================================================================
            $("#id_estrategia").change(function () {
                if ($("#id_estrategia").val() == 2) {
                    $("#mostrar_estatus_estrategia").show();
                } else {
                    $("#mostrar_estatus_estrategia").hide();
                }
            });
            //==================================================================
            $(".a_marcar").live("click", function () {
                if ($(this).text() != "") {
                    $("#consola").empty();
                    $("#consola").append($(this).text() + " MARCANDO...");
                }
            });
            //==================================================================
            // CONFIGURACION DE ESTRATEGIA
            //==================================================================
            $(".update_importe_gestor").live("change", function () {
                update_importe_gestor($('#usuario_sistema', parent.document).val(), $(this).val(), "panel", false);
            });
            //==================================================================
            $(".select_segui").live("change", function () {
                update_seguimientos_gestor($('#usuario_sistema', parent.document).val(), $(this).val(), "panel", false);
            });
            //==================================================================
            $(".crs").live("change", function () {
                update_crs_gestor($('#usuario_sistema', parent.document).val(), $(this).val(), "panel", false);
            });
            //==================================================================
            $(".estrategia_automatico").live("click", function () {
                update_estatus_estrategia_gestor(
                        $('#usuario_sistema', parent.document).val(),
                        '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 23, 24, 25, 26, 42, 43, 44, 45, 46, 47',
                        'SIN TOCAR, NC, TS, TNE, MB, DM1, DM2, DM3, DM4, PR, PI, NEG, NP, PP, IL1, IL2, IL3, IL4, NP16, NP17, NP24, NP25, NP27, NP28',
                        "panel",
                        false
                        );
            });
            //==================================================================
            $(".definir_estatus").live("click", function () {
                $("#panel").hide();
                $("#caja_estatus").show();
                $("#id_usuario_actualizar").val($('#usuario_sistema', parent.document).val());
                select_estatus_cuenta_cliente_tabla2(
                        1,
                        "listado_estatus_cuenta"
                        );
            });
            //==================================================================
            $(".agregado").live("click", function () {

                $("#cadena_estatus").val('');
                $("#estatus").val('');
                $('#estatus_disponibles tr').each(function () {

                    if ($(this).closest('tr').find('.agregado').is(':checked')) {
                        $("#cadena_estatus").val($("#cadena_estatus").val() + $(this).closest('tr').attr("id") + ", ");
                        $("#estatus").val($("#estatus").val() + $(this).closest('tr').find('.abreviado').text() + ", ");
                    }
                });
            });
            //==================================================================
            $("#finalizar").click(function () {
                texto = $("#cadena_estatus").val();
                texto2 = $("#estatus").val();
                texto = texto.substring(0, texto.length - 2);
                texto2 = texto2.substring(0, texto2.length - 2);
                $("#cadena_estatus").val(texto);
                $("#estatus").val(texto2);
                $("#caja_estatus").hide();
                $("#panel").show();
                update_estatus_estrategia_gestor(
                        $('#id_usuario_actualizar').val(),
                        $("#cadena_estatus").val(),
                        $("#estatus").val(),
                        "panel",
                        false
                        );
                select_llamadas_gestor($('#usuario_sistema', parent.document).val());
            });

            // CONFIGURACION DE ESTRATEGIA
            //==================================================================
            // ARCADE Software®
    </script>
</body>
</html>