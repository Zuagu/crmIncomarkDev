<%-- 
    Document   : metricas-operativas
    Created on : 27/01/2018, 08:30:44 AM
    Author     : Luis Cortez
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

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>
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
        <link rel="stylesheet" type="text/css" href="css/arcade-print-metricas.css">
        <!--MATERIALIZE-->

        <!--HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script>
        <script type="text/javascript" src="highcharts/exporting.js"></script>
        <!--HIGHCHARTS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-metricasoperativas.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        
        <style>
            #moc tbody tr td label{
                font-size: 1.2rem;
                color: #222222;
            }
        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div id="header" class="row">
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Metricas Operativas</a>
                        <ul class="right hide-on-med-and-down"  style="margin-right:2%;">
                            <li id="printme"><a href="#"><i id="nav_i" class="material-icons">print</i></a></li>
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
                <div id="datos" class="col s10 offset-s1">

                    <div class="input-field col s2">
                        <select id="id_region"></select>
                        <label>REGION</label>
                    </div>

                    <div class="col s2 offset-l1">
                        <label>Fecha Inicio:</label>
                        <input id="desde" type="text" class="datepicker" style="font-weight: bold; height: 1.2rem;" class="validate">
                    </div>

                    <div class="col s2 offset-l1">
                        <label>Fecha Final:</label>
                        <input id="hasta" type="text" class="datepicker" style="font-weight: bold; height: 1.2rem; width: 190px;" class="validate">
                    </div>

                    <div class="col s1 offset-l2" style="height:53.5px; padding-top:7px">
                        <a id="enviar" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 80px;border-radius: 4px;"><i class="material-icons left">send</i></a>
                    </div>

                    <div class="col s1 " style="height:53.5px; padding-top:7px">
                        <a onclick="tableToExcel('moc', 'METRICAS OPERATIVAS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 80px;border-radius: 4px;"><i class="material-icons left">explicit</i></a>
                    </div>

                </div>

                <div class="col s10  offset-s1 z-depth-3" id="datos_tabla" style=" margin-top: 10px;padding-bottom: 15px; max-height: 460px; overflow: auto;">
                    <table id="moc" class="bordered">
                        <thead>
                            <tr>
                                <th colspan="3" style="text-align: right;"></th>
                                <th style="text-align: right;">METRICAS DE PLANIFICACION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 2%;background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"><b>CALL (Outbound)</b></td>
                                <td style="background: #b4e5ff;"><b>DESCRIPCION</b></td>
                                <td style="background: #b4e5ff;"></td>
                            </tr>
                            <tr>
                                <td>a</td>
                                <td>Intentos</td>
                                <td># de llamadas realizadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato1"></label></td>
                            </tr>
                            <tr>
                                <td>b</td>
                                <td>Contactos</td>
                                <td># de llamadas contestadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato2"></label></td>
                            </tr>
                            <tr>
                                <td>c</td>
                                <td>Ratio contactibilidad</td>
                                <td>% de llamadas contestadas / llamadas realizadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato3"></label></td>
                            </tr>
                            <tr>
                                <td>d</td>
                                <td>CPC</td>
                                <td># de contactos con persona correcta (responsable de pago)</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato4"></label></td>
                            </tr>
                            <tr>
                                <td>e</td>
                                <td>Ratio CPC</td>
                                <td>% de CPC / contactos</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato5"></label></td>
                            </tr>
                            <tr>
                                <td>f</td>
                                <td>Promesas</td>
                                <td># de promesas obtenidas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato6"></label></td>
                            </tr>
                            <tr>
                                <td>g</td>
                                <td>Ratio promesas</td>
                                <td>% de promesas / # de contactos con persona correcta.</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato7"></label></td>
                            </tr>
                            <tr>
                                <td>h</td>
                                <td>Promesas cumplidas</td>
                                <td># de promesas cumplidas obtenidas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato8"></label></td>
                            </tr>
                            <tr>
                                <td>i</td>
                                <td>Ratio de promesas cumplidas</td>
                                <td># de promesas cumplidas / promesas obtenidas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato9"></label></td>
                            </tr>
                            <tr>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"><b>IVR</b></td>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"></td>
                            </tr>
                            <tr>
                                <td>j</td>
                                <td>Intentos</td>
                                <td># de IVR enviados</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato10"></label></td>
                            </tr>
                            <tr>
                                <td>k</td>
                                <td>Contactos</td>
                                <td># de contactos obtenidos por IVR</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato11"></label></td>
                            </tr>
                            <tr>
                                <td>l</td>
                                <td>% de contactos / Intentos</td>
                                <td>% de contactos / IVR enviados</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato12"></label></td>
                            </tr>
                            <tr>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"><b>CARTAS</b></td>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"></td>
                            </tr>
                            <tr>
                                <td>m</td>
                                <td>Cartas enviadas</td>
                                <td># de cartas enviadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato13"></label></td>
                            </tr>
                            <tr>
                                <td>n</td>
                                <td>Cartas entregadas</td>
                                <td># de cartas entregadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato14"></label></td>
                            </tr><tr>
                                <td>o</td>
                                <td>% de entregadas / enviadas</td>
                                <td>% de cartas enviadas / cartas enviadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato15"></label></td>
                            </tr>
                            <tr>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"><b>VISITAS REALIZADAS</b></td>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"></td>
                            </tr>
                            <tr>
                                <td>p</td>
                                <td>Visitas realizadas</td>
                                <td># de visitas realizadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato16"></label></td>
                            </tr>
                            <tr>
                                <td>q</td>
                                <td>Visitas exitosas</td>
                                <td># de visitas exitosas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato17"></label></td>
                            </tr>
                            <tr>
                                <td>r</td>
                                <td>% Visitas / exitosas</td>
                                <td># de cartas entregadas / cartas enviadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato18"></label></td>
                            </tr>
                            <tr>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"><b>CALL (Inbound)</b></td>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"></td>
                            </tr>
                            <tr>
                                <td>s</td>
                                <td>Llamadas recibidas</td>
                                <td># de llamadas recibidas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato19"></label></td>
                            </tr>
                            <tr>
                                <td>t</td>
                                <td>Llamadas no atendidas</td>
                                <td># de llamadas no atendidas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato20"></label></td>
                            </tr>
                            <tr>
                                <td>u</td>
                                <td>Tasa de abandono</td>
                                <td>% de llamadas entrantes no contestadas</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato21"></label></td>
                            </tr>
                            <tr>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"><b>MENSAJES</b></td>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"></td>
                            </tr>
                            <tr>
                                <td>v</td>
                                <td>Mensajes enviados</td>
                                <td># de mensajes enviados</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato22"></label></td>
                            </tr>
                            <tr>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"><b>CORREOS ELECTRONICOS</b></td>
                                <td style="background: #b4e5ff;"></td>
                                <td style="background: #b4e5ff;"></td>
                            </tr>
                            <tr>
                                <td style="border-bottom: 3px solid black;">w</td>
                                <td style="border-bottom: 3px solid black;">Correos enviados</td>
                                <td style="border-bottom: 3px solid black;"># Correos enviados</td>
                                <td style="text-align: right;font-weight: bold;border-bottom: 3px solid black;"><label id="dato23"></label></td>
                            </tr>
                            <tr>
                                <th style="text-align:left;"></th>
                                <th colspan="3" style="text-align:right;">METRICAS DE DESEMPÉÑO DE OPERADORES</th>
                            </tr>
                            <tr>
                                <td>x</td>
                                <td>Tiempo medio operacion (TMO)</td>
                                <td>Tiempo medio de operacion (tiempo en cada llamada contestada)</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato24"></label></td>
                            </tr>
                            <tr>
                                <td>y</td>
                                <td>Tiempo medio espera (TME)</td>
                                <td>Tiempo medio de espera (tiempo entre llamadas)</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato25"></label></td>
                            </tr>
                            <tr>
                                <td>z</td>
                                <td>Contato por posicion</td>
                                <td>Cantidad de contactos hechos por posicion / dia</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato26"></label></td>
                            </tr>
                            <tr>
                                <td>aa</td>
                                <td>Posiciones de Atencion (PA's)</td>
                                <td># de posiciones de atencion</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato27"></label></td>
                            </tr>
                            <tr>
                                <td>bb</td>
                                <td>Disponibilidad</td>
                                <td>% tiempo logueado / horario de trabajo (promedio operadores)</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato28"></label></td>
                            </tr>
                            <tr>
                                <td>cc</td>
                                <td>Ocupacion</td>
                                <td>% de tiempo operativo / tiempo logueado (promedio operadores)</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato29"></label></td>
                            </tr>
                            <tr>
                                <td>dd</td>
                                <td>Ausentismo (Incap, Vac, Faltas)</td>
                                <td>% de operadores programados ausentes</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato30"></label></td>
                            </tr>
                            <tr>
                                <td>ee</td>
                                <td>Rotacion</td>
                                <td>% de operadores que dejaron de trabajar</td>
                                <td style="text-align: right;font-weight: bold;"><label id="dato31"></label></td>
                            </tr>
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

                $('select').material_select();
                select_region_combo_materialize(1, "id_region", false);
                fecha_hoy("desde");
                fecha_hoy("hasta");
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
            $("#enviar").click(function () {
                select_datos_metricas_operativas($("#id_region").val(), $("#desde").val(), $("#hasta").val());
            });
            //==================================================================
            $("#printme").on("click", function () {
                window.print();
            });
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>