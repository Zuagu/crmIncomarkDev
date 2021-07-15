<%-- 
    Document   : pagos-diarios
    Created on : 3/04/2018, 12:12:54 PM
    Author     : sic16030
--%>

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

        <!--HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script>
        <script type="text/javascript" src="highcharts/exporting.js"></script> 
        <!--HIGHCHARTS-->


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-pagocuenta.js"></script>
        <script type="text/javascript" src="js/arcade-clientes.js"></script>

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
            .innerb{
                overflow: auto;
                height : 25em;

            }
            .innerb_recuperacion{
                overflow: auto;
                height : 24em;

            }
            .show_print{
                display: none;
            }

            .align_center{
                text-align: center!important;
            }

            .margin_0{
                margin: 0px!important;
            }

            @media print {
                .hide_print {
                    display: none!important;
                }

                .show_print{
                    display: block;
                }

                iframe{
                    height:98%!important;
                }

                table{
                    font-size: 8px!important;
                }

                #datos_tabla4{
                    width:97%!important;
                    font-weight: bold;
                }
            }
        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div id="header" class="row hide_print">
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Pagos Diarios</a>
                        <ul class="right hide-on-med-and-down"  style="margin-right:2%;">
                            <li><a href="#"><i id="nav_i" class="material-icons help">picture_as_pdf</i></a></li>
                            <li id="roboto">Manuales de usuario de este modulo</li>
                        </ul>
                    </div>
                </nav>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->            

            <!--http://materializecss.com/ Guia Materialize-->               

            <!--BEGIN CONTENT--> 
            <!-- row linea si solo ocupas un div con la mitad o menos del tamaño pon un row siguiente y salta a la siguiente-->
            <!--Recuerda que la pantalla se divide en 12 dependiendo del col s que uses 12 como 100% -->
            <div class="show_print">  
                <div class="row">
                    <div class="col s3 align_center">
                        <h6 class="margin_0"><img src="images/TELCEL.png" style=" height:52px ; width:82px;"></h6>
                    </div>
                    <div class="col s6 align_center">
                        <h5 class="margin_0">Estadistica Telcel</h5>
                        <h5 class="margin_0" id="region_titulo"></h5>
                    </div>
                    <div class="col s3 align_center">
                        <h5 class="margin_0"><img src="images/SICSA.png" style=" height:52px ; width:82px;"></h5>
                    </div>

                </div>
                <div class="row">
                    <div class="col s3">
                        <p class="align_center margin_0"></p>
                        <p class="align_center margin_0"></p>
                    </div>
                    <div class="col s2">
                        <p id="fecha_print" class="align_center margin_0"></p>
                    </div>
                    <div class="col s2">
                        <p id="dia_print" class="align_center margin_0"></p>
                    </div>
                    <div class="col s2">
                        <p id="porcentaje_2" class="align_center margin_0">Meta: 35%</p>
                    </div>

                    <div class="col s3">
                        <p class="align_center margin_0"></p>
                    </div>
                </div>
            </div>


            <ul id="tabs-swipe-demo" class="tabs hide_print">
                <li class="tab col s3"><a href="#test-swipe-1" style="color:#db040e">Pagos Diarios</a></li>
                <li class="tab col s3"><a class="active" href="#test-swipe-2" style="color:#db040e">Recuperacion Diaria</a></li>
                <li class="tab col s3"><a class="active" href="#test-swipe-3" style="color:#db040e">Estadísitica</a></li>
                <li class="tab col s3"><a class="active" href="#test-swipe-4" style="color:#db040e">Estadísitica Diaria</a></li>
            </ul>
            <div id="test-swipe-1" class="col s12" style="margin-top:10px;"> 
                <div class="row">
                    <div class="col s10 offset-s1 hide_print">
                        <div class="input-field col s3 offset-l2" >
                            <select id="id_region" name="id_region"></select>
                            <label>REGION</label>
                        </div>
                        <div class="input-field col s5" >
                            <input id="desde" name="fecha" type="text" class="validate datepicker" placeholder="desde" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;margin-left: 10px;"></td>
                            <label class="" for="desde"></label>
                            <input id="hasta" name="fecha" type="text" class="validate datepicker" placeholder="Hasta" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;"></td>
                            <label class="" for="hasta"></label>
                            <a id="enviar" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">send</i></a> 
                            <a onclick="tableToExcel('datos_tabla', 'PAGOS DIARIOS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a> 

                        </div>
                    </div>
                    <div id="datos_tabla" class="col s12 z-depth-2"></div>
                </div>
            </div>
            <div id="test-swipe-2" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s10 offset-s1 hide_print">
                        <div class="input-field col s3 offset-l2" >
                            <select id="id_region2" name="id_region2"></select>
                            <label>REGION</label>
                        </div>
                        <div class="input-field col s5" >
                            <input id="desde2" name="fecha2" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;margin-left: 10px;"></td>

                            <!--<input id="hasta2" name="fecha2" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;"></td>-->

                            <a id="enviar2" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">send</i></a> 
                            <a onclick="tableToExcel('datos_tabla2', 'RECUPERADO DIARIOS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a> 

                        </div>
                    </div>
                    <div id="datos_tabla2"  class="col s10 offset-s1  z-depth-2" style="margin-top:10px;">

                    </div>
                </div>
            </div>
            <div id="test-swipe-3" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s10 offset-s1 hide_print">
                        <div class="input-field col s3 offset-l2 " >
                            <select id="id_region3" name="id_region3"></select>
                            <label>REGION</label>
                        </div>
                        <div class="input-field col s5" >
                            <!--<input id="desde3" name="fecha3" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;margin-left: 10px;"></td>-->
                            <!--<input id="hasta2" name="fecha2" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;"></td>-->
                            <a id="enviar3" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">send</i></a> 
                            <a onclick="tableToExcel('datos_tabla3', 'ESTADISTICA')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a> 

                        </div>
                    </div>
                    <div id="datos_tabla3" class="col s12 z-depth-2" style="margin-top:10px;">

                    </div>
                </div>
            </div>
            <div id="test-swipe-4" class="col s12" style="margin-top:10px;">
                <div class="row">
                    <div class="col s10 offset-s1 hide_print">
                        <div class="input-field col s3 offset-l2" >
                            <select id="id_region4" name="id_region3"></select>
                            <label>REGION</label>
                        </div>
                        <div class="input-field col s5" >
                            <!--                            <input id="desde3" name="fecha3" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;margin-left: 10px;"></td>-->

                            <input id="hasta4" name="fecha4" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;"></td>

                            <a id="enviar4" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">send</i></a> 
                            <a onclick="tableToExcel('datos_tabla4', 'ESTADISTICA DIARIA')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a> 
                            <a id="print" class="waves-effect waves-light btn grey darken-3" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">print</i></a>
                        </div>
                    </div>
                    <div id="datos_tabla4" class="col s12 z-depth-2" style="margin-top:10px; font-size:9px !important;font-weight: bold;">

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
                select_region_combo_materialize(1, "id_region", true);
                select_region_combo_materialize(1, "id_region2", true);
                select_region_combo_materialize(1, "id_region3", true);
                select_region_combo_materialize(1, "id_region4", true);
                $('select').material_select();
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 55, // Creates a dropdown of 15 years to control year,
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
            $("#enviar").on("click", function () {
                select_pagos_diarios_tabla($("#id_region").val(), $("#desde").val(), $("#hasta").val(), "datos_tabla");
            });
            //=================================================================={
            $("#enviar2").on("click", function () {
                select_reporte_recuperacion_previa($("#id_region2").val(), $("#desde2").val(), "datos_tabla2");
            });
            //==================================================================
            $("#enviar3").on("click", function () {
                select_reporte_estadistica($("#id_region3").val(), "datos_tabla3");
            });
            $("#id_region4").change(function () {
                if($("#id_region4").val() == "2" ) {
                    $("#porcentaje_2").text("Meta: 30%");
                }
            });
            //==================================================================
            $("#enviar4").on("click", function (){ 
                select_reporte_estadistica_diaria($("#id_region4").val(), $("#hasta4").val(), "datos_tabla4");
                $("#fecha_print").text ($("#hasta4").val());
                var region = $("#id_region4").val();
                if (region == 1){ $("#region_titulo").text ("Monterrey");
                }if (region == 2){ $("#region_titulo").text ("Chihuahua");
                }if (region == 6){ $("#region_titulo").text ("Puebla");
                };
                 //fecha que se mand
                var d = new Date ($("#hasta4"). val());
                //resta de dias 
                //d.setDate(d.getDate() - 1 );

                var nom_dia = ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"];

                // se calcula el dia de la semana
                var n = d.getUTCDay();
                // se muestran los valores
                document.getElementById("dia_print").innerHTML = nom_dia[n];

               
               
                
            });

            $("#print").on("click", function () {

                window.focus();
                window.print();

            });
            //==================================================================

//            $("#print").on("click", function(event) {
//                var character = String.fromCharCode(event.keyCode).toLowerCase();
//                console.log(character);
//                if (character == "#print") {
//                    window.focus();    
//                    window.print();
//                }
//            });
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>

