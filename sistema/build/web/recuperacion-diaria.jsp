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
        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
      <div class="container-fluid">
            <div id="header" class="row">
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Recuperacion Diaria</a>
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
            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="input-field col s3 offset-l2" >
                        <select id="id_region" name="id_region"></select>
                        <label>REGION</label>
                    </div>
                    <div class="input-field col s5" >
                        <input id="desde" name="fecha" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;"></td>
                       
                        <input id="hasta" name="fecha" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;"></td>
                        
                        <a id="enviar" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">send</i></a> 
                        <a onclick="tableToExcel('datos_tabla', 'PAGOS DIARIOS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a> 

                    </div>
                </div>
                <div id="datos_tabla" class="col s12 z-depth-2" style="margin-top:15px;overflow: auto; max-height: 430px;font-size: 12px;" >

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
            $("#insert_xxyyzz").live("click", function () {
                insert_xxyyzz($("#xxyyzz_insert").val());
            });
            //==================================================================
            $("#enviar").on("click", function () {
                select_pagos_diarios_tabla($("#id_region").val(), $("#desde").val(), $("#hasta").val(), "datos_tabla");

            });
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>

