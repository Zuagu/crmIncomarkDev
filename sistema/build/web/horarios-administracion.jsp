<%-- 
    Document   : horarios-administracion
    Created on : 16-mar-2018, 14:12:59
    Author     : luiscortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>


        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="image/logoInco.fw.png" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <!--TERMINA CALENDARIO -->

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

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-horario.js"></script>
        <script type="text/javascript" src="js/arcade-usuario.js"></script>
        <script type="text/javascript" src="js/arcade-equipo.js"></script>
        <script type="text/javascript" src="js/arcade-gestor.js"></script>

        <link rel="stylesheet" type="text/css" href="css/css/style_multi.css">

        <style>
            body {
                background-color: #F9F4F4 !important;
            }
            .picker__holder {
                overflow-y: visible !important;
            }
            .tablass{
                overflow: auto;
                height : 40vh;
            }
            .esp{
                margin: 6px 6px !important;
            }
            .modal{
                overflow: visible!important; 
            }
            td, th{
                padding: 6px 5px;
            }
            .innerb{
                overflow: auto;
                height : 28em;
            }
            .usuario_selected{
                /*                box-sizing: border-box;*/
                background: rgb(137, 222, 255) !important;
            }
            .size_button{
                transform: scale(.8, .8);
                width: 150px;
            }
            .size_button3{
                transform: scale(.8, .8);
                margin: 6px !important;
            }
            .size_button2{
                transform: scale(.7, .7);
                width: 80px;
            }
            .tam{
                transform: scale(.9, .9);
                width: 300px;
            }
            .tam2{
                /*                transform: scale(.1, .1);*/
                width: 76%;
            }
            .tam3{
                /*                transform: scale(.1, .1);*/
                width: 50%;
            }
            #buscador_cuentas_gestor {
                color: black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
<!--        <nav id="ayuda_nav" class="grey lighten-1 hide_print" >
            <div class="nav-wrapper">
                <div>
                    <a class="ayuda_name brand-logo" style="color:white;">Horario Administracion</a>
                </div>
                <ul class="right"  style="margin-right:2%;">    
                    <li><input id="filtro" class="filtro  center-align grey darken-2" type="text"style="width:400px;border-radius: 4px" placeholder="Buscar"></li>
                    <li id="pdf_horas-clase-maestro" style="margin-left: 117px;"><a href="#"><i id="nav_i" class="material-icons help">picture_as_pdf</i></a></li>
                    <li id="roboto">Manuales de usuario de este modulo</li>
                </ul>
            </div>
        </nav>-->

        <div class="container" style="padding-top: 40px;">
            <div><h5 class="center">HORARIOS</h5></div>
            <div  id="div_datos" class="datagrid col s12 z-depth-2"></div>
            <div class="row">
                <div class="col s12 center-align">
                    <a id='horario_multiple' class="hide waves-effect red btn" style="margin-top: 20px;">Actualizar Horarios</a>
                </div>
            </div>
            <!---------------------------------Modales----------------------------------->
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <h5 id='modal_horario' class='center-align'></h5>
                    <p id='gene_cont' class='center-align'>Desea Generar el Contrato del Usuario con el Siguiente Id </p><p id='nombre_contrato' class='center-align'></p>
                </div>
                <div class="modal-footer">
                    <a href="#!" id='boton_cerrar' class="modal-action modal-close waves-effect red btn size_button">Cerrar</a>
                    <a href="/sistema/usuarios.jsp" id='boton_generarContrato' class="modal-action modal-close waves-effect green btn size_button">Generar Contrato</a>
                </div>
            </div>
            <div id="modal2" class="modal">
                <div class="modal-content">
                    <p class='center-align'>Desea Cambiar el Horario del Siguiente Usuario</p><p id='usu_horario' class='center-align'></p>
                    <div class="row">
                        <div class="input-field col s6 offset-s3">    
                            <select id="horario_admini" class="">
                            </select>
                            <label>Horarios</label>
                        </div> 
                        <div class="col s10 offset-s1 tablass" style="padding-top: 4px;" id="checoc">
                        </div>
                    </div>
                    <div class="row" style="padding-top: 4px;">
                        <div class='col s4'>
                            <a class="modal-action modal-close waves-effect blue btn horario_especial" style='transform: scale(.8, .8);'>Horario Especial</a>
                        </div> 
                        <div class='col s2 offset-s2'>
                            <a href="#!" id='boton_cerrar' class="modal-action modal-close waves-effect red btn size_button ">Cerrar</a>
                        </div>    
                        <div class='col s2 offset-s1'>
                            <a id='boton_acthorario' class="modal-action modal-close waves-effect green btn size_button">Actualizar Horario</a>
                        </div>    
                    </div>
                </div>
            </div>
            <div id="modal3" class="modal">
                <div class="modal-content">
                    <p class='center-align'>Desea Cambiar el Horario del los Siguientes Id's</p><p id='usuarios_horarios' class='center-align'></p>
                    <div class="row">
                        <div class="input-field col s6 offset-s3">    
                            <select id="horarios_adminis" class="">
                            </select>
                            <label>Horarios</label>
                        </div>
                        <div id="tablita">
                        </div>
                    </div>    
                </div>
                <div class="row" style="padding-top: 4px;">
                    <div class='col s4'>
                        <a class="modal-action modal-close waves-effect blue btn horario_especial" style='transform: scale(.8, .8);'>Horario Especial</a>
                    </div> 
                    <div class='col s2 offset-s2'>
                        <a href="#!" id='botones_cerrar' class="modal-action modal-close waves-effect red btn size_button ">Cerrar</a>
                    </div>    
                    <div class='col s2 offset-s1'>
                        <a id='botones_acthorarios' class="modal-action modal-close waves-effect green btn size_button">Actualizar Horario</a>
                    </div>    
                </div>
            </div>
            <div id="modal4" class="modal">
                <div class="modal-content">
                    <div class="col s12">
                        <label>Dia:</label>
                        <select id='dia' class="validate">
                            <option value="8">Lunes a Sabado</option>
                            <option value="2">Lunes</option>
                            <option value="3">Martes</option>
                            <option value="4">Miercoles</option>
                            <option value="5">Jueves</option>
                            <option value="6">Viernes</option>
                            <option value="7">Sabado</option>
                            <option value="1">Domingo</option>
                        </select>
                    </div>
                    <div class="col s6">
                        <label>Entrada:</label>
                        <input id="entrada" type="text" class="timepicker" style="font-weight: bold;" class="validate">
                    </div>
                    <div class="col s6">
                        <label>Salida:</label>
                        <input id="salida" type="text" class="timepicker" style="font-weight: bold;" class="validate">
                    </div>  
                </div>
                <div class="row" style="padding-top: 4px;">
                    <div class='col s2 offset-s2'>
                        <a href="#!" class="modal-action modal-close waves-effect red btn size_button ">Cerrar</a>
                    </div>    
                    <div class='col s2 offset-s4'>
                        <a id='botones_acthorarioesp' class="modal-action modal-close waves-effect green btn size_button">Actualizar Horario</a>
                    </div>    
                </div>
            </div>
            <!---------------------------------Modales------------------------------------>
        </div>
        <input id="id_usu" class="hide">
        <!--END CONTENT-->
        <!--END PAGE WRAPPER-->
        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                $('select').material_select();
                select_horario_user($("#buscador_cuentas_gestor").val(), 1, "div_datos");
                $('.modal').modal();
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 15, // Creates a dropdown of 15 years to control year,
                    today: 'Today',
                    clear: 'Clear',
                    close: 'Ok',
                    closeOnSelect: false // Close upon selecting a date,
                });
                $('.timepicker').pickatime({
                    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
                    fromnow: 0, // set default time to * milliseconds from now (using with default = 'now')
                    twelvehour: true, // Use AM/PM or 24-hour format
                    donetext: 'OK', // text for done-button
                    cleartext: 'Clear', // text for clear-button
                    canceltext: 'Cancel', // Text for cancel-button
                    autoclose: true, // automatic close timepicker
                    ampmclickable: true, // make AM PM clickable
                    aftershow: function () {} //Function for after opening timepicker
                });
            });
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
            $("#buscador_cuentas_gestor").on("keyup",
                    function () {
                        select_horario_user($("#buscador_cuentas_gestor").val(), 1, "div_datos");
                    }
            );
            //==================================================================
            $(".agregar_gestor").live("click", function () {
                $("#id_seleccion").val($(this).closest("tr").attr("id"));

            });
            //==================================================================
            $(".agregar_gestor").live("dblclick", function () {
                $("#id_seleccion").val($(this).closest("tr").attr("id"));
                $("#div_datos").show();
                select_horario_tabla($("#id_seleccion").val(), "div_datos");
            });
            //==================================================================
            $("#insert_horario").on("click",
                    function () {
                        insert_horario_admin(
                                $("#id_seleccion").val(),
                                $("#dia").val(),
                                $("#entrada").val(),
                                $("#salida").val(),
                                $("#salida_comida").val(),
                                $("#entrada_comida").val()
                                );
                        $("#nombre_contrato").text($("#id_seleccion").val());
                    }
            );
            //==================================================================
            //========js para seleccionar multiples cambios de horario==========
            $(".renglon_selected").live("dblclick", function () {
                $('#usu_horario').text($(this).find(".get_usuarioName").html());
                $('#modal2').modal("open");
                $('#id_usu').val($(this).closest("tr").attr("id"));
                select_horarios_combo(1, $(this).find(".get_horarioName").html(), "horario_admini");
                select_horario_tabla($("#id_usu").val(), "checoc");
            });
            $(".renglon").live("click", function () {
                if ($(this).closest("tr").hasClass("varios")) {
                    $("#horario_multiple").removeClass("hide");
                } else {
                    $("#horario_multiple").addClass("hide");
                }
            });
            $("#horario_multiple").on("click", function () {
                var ids = '';
                $('#modal3').modal("open");
                $('*[class*="varios"]').each(function (index, li) {
                    var idspu = $(li).closest("tr").attr("id");
                    ids += idspu + ',';
                });
                console.log(ids);
                select_horarios_combo(1, "Selecciona Horario", "horarios_adminis");
                select_horario_tabla(ids, "tablita");
                $("#usuarios_horarios").text(ids);
            });
            //==================================================================
            //==================================================================
            $("#boton_generarContrato").on("click", () => {
                var id = $("#nombre_contrato").text();
                window.open("/sistema/contrato.jsp?" + id);
            });
            $("#boton_acthorario").on("click", () => {
                insert_horario($("#id_usu").val(), $("#horario_admini").val());
                console.log($("#id_usu").val(), $("#horario_admini").val());
                $("#nombre_contrato").text($("#id_seleccion").val());
                window.setTimeout(() => {
                    select_horario_user($("#buscador_cuentas_gestor").val(), 1, "div_datos");
                }, 150);
                $("#nombre_contrato").text($('#id_usu').val());
            });
            $("#botones_acthorarios").on("click", () => {
                insert_horario($("#usuarios_horarios").text(), $("#horarios_adminis").val());
                console.log($("#usuarios_horarios").text(), $("#horarios_adminis").val());
                window.setTimeout(() => {
                    select_horario_user($("#buscador_cuentas_gestor").val(), 1, "div_datos");
                }, 150);
                $("#usu_horario").text($('#usuarios_horarios').text());
                $("#id_usu").val($('#usuarios_horarios').text());
            });
            $(".horario_especial").on("click", () => {
                $('#modal4').modal("open");
            });
            $("#botones_acthorarioesp").on("click",
                    function () {
                        insert_horario_admin(
                                $("#id_usu").val(),
                                $("#dia").val(),
                                $("#entrada").val(),
                                $("#salida").val()
                                );
                        $("#nombre_contrato").text($("#id_usu").val());
                    }
            );
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
