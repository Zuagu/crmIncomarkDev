<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!-- HIGHCHARTS-->
        <script type="text/javascript" src="js/carga-predictivo.js"></script>
        <!-- HIGHCHARTS-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="https://code.highcharts.com/highcharts.js"></script>

        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <style>
            .pointer{
                cursor: pointer;
            }
            html {
                height: 100%;
            }
            body {
                background:#ffffff;
                /*                min-height: 100%;*/
            }
            .highcharts-background {
                fill:rgba(255, 255, 255, 0.2);
                stroke:rgba(0, 0, 0, 0.2);
                stroke-width:0px;
            }
            .letcolor{
                color: white !important;
            }
            .letcolor2{
                background-color: white !important;
                border-radius: 4%;
                transform: scale(1.0, .9);
            }
            .chi{
                padding: 0px 8px;
            }
            .size_button{
                transform: scale(.8, .8);
                width: 150px;
                margin-right: 50px !important;
                border-radius: 7px;
            }
            .size_button2{
                transform: scale(.5, .8);
                margin-right: 50px !important;
                margin-left: 0px !important;
                border-radius: 7px;
                padding-left: 16px;
                padding-right: 0px;
                /*                width: 1px;*/
            }
            .size_button3{
                transform: scale(.5, .7);
                margin-right: 70px !important;
                margin-left: 0px !important;
                border-radius: 7px;
                padding-left: 16px;
                padding-right: 0px;
                background-color: #616161;
                /*                width: 1px;*/
            }
            .select-wrapper input.select-dropdown {
                margin: 0px 0px 0px 8px;
                width: 90%;
                position: relative;
                cursor: pointer;
                background-color: transparent;
                border: none;
                border-bottom-color: currentcolor;
                border-bottom-style: none;
                border-bottom-width: medium;
                border-bottom: 1px solid #fff;
                outline: none;
                height: 2rem;
                line-height: 3rem;
                font-size: 1rem;
                padding: 0;
                display: block;
            }
            .innerb{
                overflow: auto;
                height : 22em;

            }
            .inner2{
                overflow: auto;
                height : 23em;

            }
            .highcharts-container{
                height : 26em;  
            }
            .modalin {
                width: 40% !important ; height:auto !important;
                background-image: linear-gradient(to right bottom, rgb(189, 189, 189), rgba(224, 224, 224));
                color: #000000;
                border-top: 0px solid #5e5e5e;
                border-radius: 10px;
                overflow: unset;
            }  

            .select-wrapper{
                border-radius:20px;
                height:38px;
            }
            .select-dropdown.dropdown-content li.selected {
                background: linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));
                color: #fff;
            }
            .select_tr tr:hover {
                background: linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));
                color:#ffffff;
            }
            ::placeholder {

                color: #d1d1d1;

            }
            ::placeholder {

                color: #d1d1d1;

            }
            elemento {
                height: 50vh;
                z-index: 1005;
                display: block;
                opacity: 1;
                bottom: 0px;

            }
            .modal.bottom-sheet{
                max-height: 60%;  
            }
            #modal_filtro {
                overflow: hidden;
                border-radius: 10px 10px 0 0;
            }
            .cajas {
                max-height:200px;
                height:200px;
                border-radius: 10px;
                background: linear-gradient(to left, rgba(255,255,255,0.6), rgba(234,234,234,1));
                border: 1px solid #d1d1d1;
            }

        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div class="row">
                <nav id="ayuda_nav" class="hide_print" style="background:linear-gradient(to left, rgba(189,189,189,0.1), rgba(189,189,189,1));">
                    <div class="nav-wrapper">
                        <ul class="right"  style="margin-right:2%;">   
                            <li><i class="medium material-icons" style="margin-top: -13px;">access_time</i></li>
                            <li id="roboto">Predictivo</li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="row" style="margin-top: -20px;">

                <div class="col s12 m12 l12  "  style="margin-left:1.5%">
                    <div  class="col s4 m4 l4">
                        <div  class="col s11 m11 l11 z-depth-3" style="background:linear-gradient(to left, rgba(255,255,255,0.6), rgba(234,234,234,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;">
                            <h5>Cuentas por Estatus: <b id="select_act"></b><b id="nombre_asignacion2"></b></h5>
                            <div id="estatus" class="col s12 m10 l11" >
                            </div>    
                        </div>   
                    </div>
                    <div class="col s2 m2 l2"> 
                        <div  class="col s12 m12 l10  z-depth-3 letcolor waves-effect waves-light" style="background:linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align tit">Total Asignaciones.</h6>
                            <input type="hidden" value="0">
                            <h6 id="glob_cuentas" class="center-align"></h6>
                            <h6 id="glob_total" class="center-align"></h6>
                            <h6 id="glob_resto" class="center-align"></h6>
                        </div>
                    </div>
                    <div class="col s2 m2 l2"> 
                        <div id="mty" class="col s12 m12 l10  z-depth-3 letcolor waves-effect waves-light" style="background:linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));border-radius: 3px;padding-right: 18px; padding-left: 18px;"  >
                            <h6 class="center-align tit">Monterrey </h6>
                            <input type="hidden" value="1">
                            <h6 id="mty_cuentas" class="center-align pointer"></h6>
                            <h6 id="mty_total" class="center-align pointer"></h6>
                            <h6 id="mty_resto" class="center-align pointer"></h6>
                        </div>
                    </div>
                    <div class="col s2 m2 l2"> 
                        <div id="pue" class="col s12 m12 l10  z-depth-3 letcolor waves-effect waves-light" style="background:linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align tit">Puebla </h6>
                            <input type="hidden" value="6">
                            <h6 id="pue_cuentas" class="center-align"></h6>
                            <h6 id="pue_total" class="center-align"></h6>
                            <h6 id="pue_resto" class="center-align"></h6>
                        </div>
                    </div>
                    <div class="col s2 m2 l2"> 
                        <div id="chi" class="col s12 m12 l10  z-depth-3 letcolor waves-effect waves-light" style="background:linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align tit">Chihuahua </h6>
                            <input type="hidden" value="2">
                            <h6 id="chi_cuentas" class="center-align pointer"></h6>
                            <h6 id="chi_total" class="center-align pointer"></h6>
                            <h6 id="chi_resto" class="center-align pointer"></h6>
                        </div>
                    </div>
                    <div class="col s8 m8 l8"> 
                        <div class="col s12 m12 l12" style="padding-right: 37px;"> 
                            <div id="caja_predictivo" class="col s12 m12 l12  z-depth-3" style="background:linear-gradient(to left, rgba(255,255,255,0.6), rgba(234,234,234,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;height:400px; margin-top:20px;">
                                <div id="cargando" class="progress" style="display: none;">
                                    <div class="indeterminate"></div>
                                </div>
                            </div>
                            <div class="col s12 m12 l12 right-align" style="margin-top:20px;">
                                <label id="info" style="font-size: 19px; margin-top: 5px;">Info</label>
                                <a class="filtro waves-effect waves-light btn blue modal-trigger" href="#modal_filtro">Filtro</a>
                                <a onclick="tableToExcel('caja_predictivo', 'Predivtivo')" class="waves-effect waves-light btn green"><i class="material-icons">explicit</i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <!------------------------------------------------INICIO MODALES------------------------------------------------>
            <div id="modal" class="modal">
                <div class="modal-content">
                    <h4>Asignaciones: <b id="nombre_asignacion"></b></h4>
                    <div id="region_div"></div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
        <!-- Modal Structure -->
        <div id="modal_filtro" class="modal bottom-sheet" style="height:70vh">
            <div class="modal-content">
                <h4>Filtro</h4>
                <div id="div_filtro" class="col s12 m12 l12">
                    <div class="row">
                        <!-- select de tiempo y reguion -->
                        <div class="col s12 m2 l2">
                            <div class="col s11 cajas">
                                <div class="input-field col s12">
                                    <select id="tiempo">
                                        <option value="" disabled selected></option>
                                        <option value="1">Apertura</option>
                                        <option value="2">Cerrador</option>
                                        <option value="0">Ambos</option>
                                    </select>
                                    <label>Tiempo</label>
                                </div>
                                <div id="div_regiones" class="input-field col s12">
                                    <select id="region">
                                        <option value="" selected>Escoge la Region</option>
                                        <option value="1">Monterrey</option>
                                        <option value="2">Chihuahua</option>
                                        <option value="6">Puebla</option>
                                        <option value="0">Todos</option>
                                    </select>
                                    <label>Region</label>
                                </div>
                            </div>
                        </div>
                        <!-- asignaciones -->
                        <input id="cadena_asignaciones" class="col s12 m2 l2" type="hidden">
                        <div id="div_asignaciones" class="col s12 m2 l2"></div>
                        <!-- estados -->
                        <input id="cadena_estados" class="col s12 m2 l2 " type="hidden">
                        <div id="div_estados" class="col s12 m2 l2"></div>
                        <!-- status -->
                        <input id="cadena_status" class="col s12 m2 l2" type="hidden">
                        <div id="div_status" class="col s12 m2 l2"></div>
                        <!-- tipo numero -->
                        <input id="cadena_tipo_numero" class="col s12 m2 l2" type="hidden">
                        <div id="div_tipo_numero" class="col s12 m2 l2 hide">
                            <div class="col s12 m11 cajas" style="max-height:200px; overflow:auto;">
                                <input type="checkbox" id="check_tipo_numero_todos">
                                <label for="check_tipo_numero_todos"><b>T. TELEFONOS</b></label><br>
                                <input type="checkbox" id="tit" class="check_tipo_numero">
                                <label for="tit">TITULAR</label><br>
                                <input type="checkbox" id="crs" class="check_tipo_numero">
                                <label for="crs">RELACIONADAS</label><br>
                                <input type="checkbox" id="ref" class="check_tipo_numero">
                                <label for="ref">REFERENCIAS</label><br>
                            </div>
                        </div>


                        <div id="div_cr" class="col s12 m2 l2 hide">
                            <div class="col s12 m11 cajas">
                                <div class="input-field col s12 m11 ">
                                    <select id="cr">
                                        <option value="" disabled selected>Cr</option>
                                        <option value="1">si</option>
                                        <option value="2">no</option>
                                        <option value="0">Ambos</option>
                                    </select>
                                    <label>Cr</label>
                                </div>
                                <div class="input-field col s12 l11">
                                    <input id="resto" type="text" class="validate">
                                    <label for="resto">Resto mayor a:</label>
                                </div>
                                <div class="input-field col s12 l11">
                                    <input id="desde" type="text" value='' class="datepicker">
                                    <label for="desde">Fecha Menor a:</label>
                                </div>

                            </div>
                        </div>
                        <!-- select cr -->
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="col s12 m12 l12 right-align" style="margin-top:20px;">
                    <a class="waves-effect waves-light btn blue modal-close" id="consultar">Consultar</a>
                </div>
            </div>
        </div>

        <!------------------------------------------------FIN MODALES------------------------------------------------>
        <!--END PAGE WRAPPER-->

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                $('.modal').modal();
                datos_regiones("glob_cuentas");
                select_estatus_regiones("estatus");
                $('select').material_select();
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 100, // Creates a dropdown of 15 years to control year,
                    today: 'Today',
                    clear: 'Clear',
                    close: 'Ok',
                    closeOnSelect: false, // Close upon selecting a date,
                    container: 'body'
                });
            });
            //================================================================== 
            $(".letcolor").click(function () {
                //            console.log( $('.tit', this).text() );
                $("#select_act").text($('.tit', this).text());
                if ($('input', this).val() == 0) {
                    select_estatus_regiones("estatus");
                } else {
                    estatus_region("estatus", $('input', this).val());
                }

                $('#nombre_asignacion2').text(" ");
            });
            //================================================================== 
            $(".letcolor").dblclick(function () {
                $('#modal').modal('open');
                $("#nombre_asignacion").text($('.tit', this).text());
                datos_asignacion("region_div", $('input', this).val());
            });
            //================================================================== 
            $(".renglon").live("click", function () {
                $('#nombre_asignacion2').text($(this).find(".nom_asig").html());
                estatus_asignacion("estatus", $(this).closest("tr").attr("id"));
            });
            //================================================================== 
//            $(".filtro").live("click", function () {
//                $('input[type="checkbox"]').prop("checked", false);
//            });
            //================================================================== 
            $("#region").change(function () {
                if ($("#region").val() != "") {
                    select_caja_asignaciones('div_asignaciones', $("#tiempo").val(), $("#region").val());
                } else {
                    $("#div_asignaciones").empty();
                }
            });
            //================================================================== 
            $("#tiempo").change(function () {
                if ($("#region").val() != "") {
                    select_caja_asignaciones('div_asignaciones', $("#tiempo").val(), $("#region").val());
                }

            });
            //================================================================== 
            $("#consultar").click(function () {
                $("#cargando").show();
                select_tabla_predictivo(
                        $("#cadena_asignaciones").val(),
                        $("#cadena_estados").val(),
                        $("#cadena_status").val(),
                        $("#cadena_tipo_numero").val(),
                        $("#cr").val(),
                        $("#resto").val(),
                        ( $("#desde").val() == "" ? "0000-00-00" : $("#desde").val()),
                        "caja_predictivo"
                        );
            });
            //================================================================== 



            //================================================================== Seleccionar las asignaciones para llamar la lista de estados
            $(".check_asignacion").live("click", function () {
                var _texto;
                $("#cadena_asignaciones").val('');
                $('#div_asignaciones .check_asignacion').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_asignaciones").val($("#cadena_asignaciones").val() + $(this).attr("id") + ", ");
                    }
                });
                _texto = $("#cadena_asignaciones").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_asignaciones").val(_texto);
                _texto = $("#cadena_asignaciones").val();

                if ($("#cadena_asignaciones").val() != '') {
                    select_caja_estados('div_estados', $("#cadena_asignaciones").val());
                } else {
                    $("#div_estados").empty(); // limpiar la sig caja de estados
                }
            });
            //===========================
            $("#check_asignacion_todos").live("click", function () {
                if ($("#check_asignacion_todos").is(":checked")) {
                    $(".check_asignacion").prop("checked", true);
                } else {
                    $(".check_asignacion").prop("checked", false);
                }
                var _texto;
                $("#cadena_asignaciones").val('');
                $('#div_asignaciones .check_asignacion').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_asignaciones").val($("#cadena_asignaciones").val() + $(this).attr("id") + ", ");
                    }
                });
                _texto = $("#cadena_asignaciones").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_asignaciones").val(_texto);
                //_texto = $("#cadena_asignaciones").val();
                if ($("#cadena_asignaciones").val() != "") {
                    select_caja_estados('div_estados', $("#cadena_asignaciones").val());
                } else {
                    $("#div_estados").empty(); // limpiar la sig caja de estados
                }

            });
            //==================================================================
            $(".check_estado").live("click", function () {
                var _texto;
                $("#cadena_estados").val('');
                $('#div_estados .check_estado').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_estados").val($("#cadena_estados").val() + "'" + $(this).attr("id") + "', ");
                    }
                });
                _texto = $("#cadena_estados").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_estados").val(_texto);
                _texto = $("#cadena_estados").val();

                if ($("#cadena_estados").val() != '') {
                    select_caja_status('div_status', $("#cadena_asignaciones").val(), $("#cadena_estados").val());

                } else {
                    $("#div_status").empty(); // limpiar la sig caja de texto
                }
            });
            //===========================
            $("#check_estado_todos").live("click", function () {
                if ($("#check_estado_todos").is(":checked")) {
                    $(".check_estado").prop("checked", true);
                } else {
                    $(".check_estado").prop("checked", false);
                }
                var _texto;
                $("#cadena_estados").val('');
                $('#div_estados .check_estado').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_estados").val($("#cadena_estados").val() + "'" + $(this).attr("id") + "', ");
                    }
                });
                _texto = $("#cadena_estados").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_estados").val(_texto);
                _texto = $("#cadena_estados").val();
                if ($("#cadena_estados").val() != '') {
                    select_caja_status('div_status', $("#cadena_asignaciones").val(), $("#cadena_estados").val());
                } else {
                    $("#div_status").empty(); // limpiar la sig caja de texto
                }
            });
            //==================================================================
            $(".check_status").live("click", function () {
                var _texto;
                $("#cadena_status").val('');
                $('#div_status .check_status').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_status").val($("#cadena_status").val() + $(this).attr("id") + ", ");
                    }
                });
                _texto = $("#cadena_status").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_status").val(_texto);
                _texto = $("#cadena_status").val();

                if ($("#cadena_status").val() != '') {
                    $("#div_tipo_numero").removeClass("hide")
                } else {
                    $("#div_tipo_numero").addClass("hide") // limpiar la sig caja de texto
                }
            });
            //===========================
            $("#check_status_todos").live("click", function () {
                if ($("#check_status_todos").is(":checked")) {
                    $(".check_status").prop("checked", true);
                } else {
                    $(".check_status").prop("checked", false);
                }
                var _texto;
                $("#cadena_status").val('');
                $('#div_status .check_status').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_status").val($("#cadena_status").val() + $(this).attr("id") + ", ");
                    }
                });
                _texto = $("#cadena_status").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_status").val(_texto);
                _texto = $("#cadena_status").val();

                if ($("#cadena_status").val() != '') {
                    $("#div_tipo_numero").removeClass("hide")
                } else {
                    $("#div_tipo_numero").addClass("hide") // limpiar la sig caja de texto
                }
            });
            //==================================================================
            $(".check_tipo_numero").live("click", function () {
                var _texto;
                $("#cadena_tipo_numero").val('');
                $('#div_tipo_numero .check_tipo_numero').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_tipo_numero").val($("#cadena_tipo_numero").val() + $(this).attr("id") + ", ");
                    }
                });
                _texto = $("#cadena_tipo_numero").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_tipo_numero").val(_texto);
                _texto = $("#cadena_tipo_numero").val();

                if ($("#cadena_tipo_numero").val() != '') {
                    $("#div_cr").removeClass("hide");
                } else {
                    $("#div_cr").addClass("hide"); // limpiar la sig caja de texto
                }
            });
            //===========================
            $("#check_tipo_numero_todos").live("click", function () {
                if ($("#check_tipo_numero_todos").is(":checked")) {
                    $(".check_tipo_numero").prop("checked", true);
                } else {
                    $(".check_tipo_numero").prop("checked", false);
                }
                var _texto;
                $("#cadena_tipo_numero").val('');
                $('#div_tipo_numero .check_tipo_numero').each(function () {
                    if ($(this).is(':checked')) {
                        $("#cadena_tipo_numero").val($("#cadena_tipo_numero").val() + $(this).attr("id") + ", ");
                    }
                });
                _texto = $("#cadena_tipo_numero").val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_tipo_numero").val(_texto);

                if ($("#cadena_tipo_numero").val() != '') {
                    $("#div_cr").removeClass("hide");
                } else {
                    $("#div_cr").addClass("hide"); // limpiar la sig caja de texto
                    $("#div_resto").addClass("hide");
                }

            });
            //==================================================================
            $("#cr").change(function () {
                $("#div_resto").removeClass("hide");
            });

            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>