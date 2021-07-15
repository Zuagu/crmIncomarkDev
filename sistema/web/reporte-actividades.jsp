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
        <script type="text/javascript" src="js/arcade-story.js"></script>
        <script type="text/javascript" src="js/arcade-ticket.js"></script>
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
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Reporte Actividades</a>
                        <ul class="right hide-on-med-and-down"  style="margin-right:2%;">
                            <li id="pdf_horas-clase-maestro"><a href="#"><i id="nav_i" class="material-icons help">picture_as_pdf</i></a></li>
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
                <div class="col s10 offset-s1" style="padding-bottom: 10px;">
                    <div class="col s3" style="height: 45px;">
                        <label>Usuario</label>
                        <select id="id_usuario">
                        </select>
                    </div>
                    <div class="col s2 offset-s1">
                        <label>Fecha Inicio:</label>
                        <input id="desde" type="text" class="datepicker" style="font-weight: bold;" class="validate">
                    </div>
                    <div class="col s2 offset-s1">
                        <label>Fecha Final:</label>
                        <input id="hasta" type="text" class="datepicker" style="font-weight: bold;" class="validate">
                    </div>
                    <div class="col s2 " style="height:53.5px; padding-top:13px">
                        <a id="enviar" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 80px;"><i class="material-icons left">send</i></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s10 offset-s1 ">
                    <div class="col s6">
                        <label>Usuario:</label>
                        <input id="dato1" type="text"  style="font-weight: bold;" class="validate">
                    </div>   
                    <div class="col s2" >
                        <label>Tickets Trabajados:</label>
                        <input id="dato2" type="text" style="font-weight: bold;" class="validate">
                    </div>
                    <div class="col s2" >
                        <label>Tiempo Estimado</label>
                        <input id="dato3" type="text"   style="font-weight: bold;" class="validate">
                    </div>
                    <div class="col s2" >
                        <label>Tiempo Real:</label>
                        <input id="dato4" type="text"   style="font-weight: bold;" class="validate">
                    </div>

                </div>
            </div>   
            <div class="row">
                <div class="col s10 offset-s1 z-depth-3">
                    <table class="bordered highlight striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>TICKET</th>
                                <th>DESCRIPCION</th>
                                <th>TIEMPO</th>
                                <th>REAL</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="datos_tabla">

                        </tbody>
                    </table>
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
                select_usuarios_desarrollo("id_usuario");
                $('select').material_select();
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
                    twelvehour: false, // Use AM/PM or 24-hour format
                    donetext: 'OK', // text for done-button
                    cleartext: 'Clear', // text for clear-button
                    canceltext: 'Cancel', // Text for cancel-button
                    autoclose: false, // automatic close timepicker
                    ampmclickable: true, // make AM PM clickable
                    aftershow: function () {} //Function for after opening timepicker
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
//            $("#desde").on("change", function () {
//                select_reporte_actividades($("#id_usuario").val(),$("#desde").val(), $("#hasta").val(), "datos_tabla");
//            });
//            //==================================================================
//            $("#hasta").on("change", function () {
//                select_reporte_actividades($("#id_usuario").val(),$("#desde").val(), $("#hasta").val(), "datos_tabla");
//            });
            //==================================================================
            $("#enviar").on("click", function () {
                select_reporte_actividades($("#id_usuario").val(), $("#desde").val(), $("#hasta").val(), "datos_tabla");
                select_datos_reporte_actividades($("#id_usuario").val(), $("#desde").val(), $("#hasta").val());
            });
            //==================================================================

            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>