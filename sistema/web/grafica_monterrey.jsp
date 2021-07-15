<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="arcade.data.EstatusCuentaDao"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!-- HIGHCHARTS-->
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/sunburst.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>

        <!-- HIGHCHARTS-->




        <style>
            #container {
                min-width: 310px;
                max-width: 800px;
                margin: 0 auto
            }

        </style>
        <%  
           String asignaciones, equipos, estatus_name, num_estatus, cant_equipos,resto_estatus;
            
            //asignaciones = "1118E_M,1218E_M,1318E_M,1418E_M,1518E_M,1618E_M";
            asignaciones =EstatusCuentaDao.select_datos_grafica_individual(6,1);
            //cant_equpos = "1,1,3,4,3,1";
            cant_equipos = EstatusCuentaDao.select_datos_grafica_individual(3,1);
            //equipos = "OLVERA MONTALVO CINDY EUGENIA / CYNTHIA POLINA,VERONICA GARZA / LUIS GUTIERREZ,*,CASTILLO GUTIERREZ VIRIDIANA / BALDERAS TORRES CATHERINE,DENISSE ROMAN / CIPRIANO LOPEZ ELÍAS RUBÉN,*,GARCIA LEON MARIA FERNANDA,JESSICA MOTOLINIA,JOSE TORIJA,TORRES BANDA DIANA ESMERALDA  / MORALES MEJÍA  MAYRA GRACIELA ,RODRÍGUEZ JIMÉNEZ JORGE YEUDHIEL  / ACOSTA VAZQUEZ BRENDA MELINA,ADRIANA TORRES,NO ASIGNADO";
            equipos = EstatusCuentaDao.select_datos_grafica_individual(1,1);
            //num_estatus = "17,15,12,13,14,1,12,13,13,15,15,15,13";
            num_estatus = EstatusCuentaDao.select_datos_grafica_individual(4,1);
            //estatus_name = "SIN TOCAR,NC,TS,MB,DM1,DM2,DM3,DM4,PR,PI,NEG,PP,PRE,PT,CL,IL2,IL3,NC,TS,MB,DM1,DM2,DM3,DM4,PR,PI,NEG,PP,PRE,PT,AC,CL,SIN TOCAR,NC,MB,DM1,DM2,DM3,DM4,PR,PP,PRE,PT,CL,NC,TS,MB,DM1,DM2,DM3,DM4,PR,PP,PRE,PT,AC,IL2,SIN TOCAR,NC,TS,MB,DM1,DM2,DM3,DM4,PR,NEG,PP,PRE,PT,CL,NC,NC,MB,DM1,DM2,DM3,DM4,PR,PI,NEG,PP,PRE,PT,NC,MB,DM1,DM2,DM3,DM4,PR,PI,NEG,PP,PRE,PT,CL,NC,MB,DM1,DM2,DM3,DM4,PR,PI,NEG,PP,PRE,PT,CL,SIN TOCAR,NC,TS,TNE,MB,DM1,DM2,DM3,DM4,PR,NEG,PP,PRE,PT,NP25,SIN TOCAR,NC,TS,TNE,MB,DM1,DM2,DM3,DM4,PR,PP,PRE,PT,AC,CL,SIN TOCAR,NC,TS,MB,DM1,DM2,DM3,DM4,PR,PI,PP,PRE,PT,AC,NP24,SIN TOCAR,NC,TS,TNE,MB,DM1,DM2,DM3,DM4,PR,PRE,AC,IL2";
            estatus_name = EstatusCuentaDao.select_datos_grafica_individual(2,1);
            //resto_estatus = "467.19,107516.66,237.80,49507.91,602269.31,31478.33,68570.51,35081.33,114881.98,83853.63,33021.93,34558.73,1331.42,0.00,0.00,4728.62,1985.29,366321.68,14909.61,87768.98,134049.17,151189.25,258891.54,25484.89,67508.10,142838.23,26286.05,39158.40,0.00,332.63,27994.69,0.00,1010.22,26611.72,4819.63,24069.78,2491.34,3738.22,2195.30,5728.80,395.39,185.12,0.00,0.00,59178.21,3648.96,62958.45,178689.01,25447.15,11104.65,3220.63,42939.56,5716.10,0.00,0.00,5127.96,2653.94,2154.98,73954.24,16799.06,29397.43,212002.68,17506.98,5369.15,9810.88,23679.42,1084.14,16085.45,0.00,0.00,238.64,241187.21,102023.38,38009.66,16973.89,79458.95,135285.10,14694.38,20648.35,10677.32,16429.03,20908.72,0.00,0.00,95716.47,41681.92,27768.80,84410.61,131260.89,18370.28,39109.74,6304.01,17165.52,11860.55,0.00,0.00,0.00,84442.49,11360.87,8651.59,58568.95,214902.03,7534.61,7519.57,16087.09,28275.05,14662.46,0.00,0.00,0.00,1964.59,61674.80,25919.30,4887.30,33015.32,158368.21,39350.70,28674.91,9564.66,33597.48,228.52,4592.72,0.00,0.00,376.93,1146.66,68905.98,8963.23,11430.67,30464.38,152165.80,33910.49,21767.56,1363.08,37511.19,12568.74,0.00,0.00,6101.57,0.00,2719.54,47129.75,18058.73,30798.88,169385.07,26079.22,33589.16,9206.28,28908.35,857.02,22451.73,0.00,0.00,1510.10,1322.99,463861.40,622717.32,21376.71,2103.75,69790.07,53368.91,96303.46,126335.28,33491.57,36151.50,0.00,1515.51,8751.68";
            resto_estatus = EstatusCuentaDao.select_datos_grafica_individual(5,1);;
            
            String[] cadena_asignaciones = asignaciones.split(",");
            String[] cadena_cant_equipos = cant_equipos.split(",");
            String[] cadena_equipos = equipos.split(",");
            String[] cadena_estatus_name = estatus_name.split(",");
            String[] cadena_cant_estatus = num_estatus.split(",");
            String[] cadena_resto_estatus = resto_estatus.split(",");
            
            System.out.println(cadena_asignaciones.length +" cadena_asignaciones");
//            System.out.println(asignaciones);
            System.out.println(cadena_cant_equipos.length+" cadena_cant_equipos");
//            System.out.println(cant_equipos);
            System.out.println(cadena_equipos.length+" cadena_equipos");
//            System.out.println(equipos);
            System.out.println(cadena_cant_estatus.length+" cadena_cant_estatus");
//            System.out.println(num_estatus);
            System.out.println(cadena_estatus_name.length+" cadena_estatus_name");
//            System.out.println(estatus_name);
            System.out.println(cadena_resto_estatus.length+" cadena_resto_estatus");
//            System.out.println(resto_estatus);

            //=====variables para controlar lso ciclos==========================
            int i, j, k = 0, l = 0, m = 0, n = 1, o = 0;
            String[] regiones = {"Monterrey", "Chihuahua", "Puebla"};
            //==================================================================
            
            int[] repetion_equipo = new int[cadena_cant_estatus.length];
            for (i = 0; i < cadena_cant_estatus.length; i++) {
                    repetion_equipo[i] = Integer.parseInt(cadena_cant_estatus[i]);
            }
            int[] equipos_asignaciones = new int [cadena_cant_equipos.length];
            for (i = 0; i < cadena_cant_equipos.length; i++) {
                    equipos_asignaciones[i] = Integer.parseInt(cadena_cant_equipos[i]);
            }
            
            String data = "";

            data += "{\n'id': '0.0', \n"
                    + "'parent': '',\n"
                    + "'name': '"+regiones[0]+"' \n"
                    + "},";

            for (i = 0; i < cadena_asignaciones.length; i++) {
                data += "\n\n{\n'id': '" + 1 + "." + (i + 1) + "', \n"
                        + "'parent': '0.0',\n"
                        + "'name': '" + cadena_asignaciones[i] + "'\n,"
                        + "},";

                for (j = 0; j < equipos_asignaciones[i]; j++) {
                    data += "\n\n{\n'id': '" + 2 + "." + (l + 1) + "', \n"
                            + "'parent': '1." + (i + 1) + "',\n"
                            + "'name': '" + cadena_equipos[k] + "' \n"
                            + "},\n\n";

                    //==========================================================
                    for (m = 0; m < repetion_equipo[l]; m++) {
                        if (o == cadena_estatus_name.length - 1) {
                                data += "{\n'id': '" + 3 + "." + (n + 1) + "', \n"
                                        + "'parent': '2." + (l + 1) + "', \n"
                                        + "'name': '" + cadena_estatus_name[o] + "', \n"
                                        + "'value': " + cadena_resto_estatus[o] + " \n"
                                        + "}";
                            } else {
                                data += "{\n'id': '" + 3 + "." + (n + 1) + "', \n"
                                        + "'parent': '2." + (l + 1) + "', \n"
                                        + "'name': '" + cadena_estatus_name[o] + "', \n"
                                        + "'value': " + cadena_resto_estatus[o] + " \n"
                                        + "},";
                            }
                        o++;
                        n++;
                    }
                    l++;
                    k++;
                }

            }
            
            System.out.println(data);

        %>
    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div class="row">
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Grafica Principal</a>
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
            <!--Recuerda que la pantalla se divide en 12 dependiendo del col s que uses 12 como 100% -->
            <div class="row">
                <div id="container"></div>


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
            var data = [<%=data%>];



// Splice in transparent for the center circle
            Highcharts.getOptions().colors.splice(1,2
            ,);

            Highcharts.chart('container', {

                chart: {
                    height: '85%'
                },

                title: {
                    text: 'Importe por cobrar, agrupado por estatus, región y asigncacion'
                },
                subtitle: {
                    text: '<a href="grafica_main.jsp">Grafica Principal</a>'
                },
                series: [{
                        type: "sunburst",
                        data: data,
                        allowDrillToNode: true,
                        cursor: 'pointer',
                        dataLabels: {
                            format: '{point.name}',
                            filter: {
                                property: 'innerArcLength',
                                operator: '>',
                                value: 16
                            }
                        },
                        levels: [{
                                level: 1,
                                levelIsConstant: false,
                                dataLabels: {
                                    rotationMode: 'parallel',
                                    filter: {
                                        property: 'outerArcLength',
                                        operator: '>',
                                        value: 64
                                    }
                                }
                            }, {
                                level: 2,
                                colorByPoint: true,
                                dataLabels: {
                                    rotationMode: 'parallel'
                                }
                            },
                            {
                                level: 3,
                                colorVariation: {
                                    key: 'brightness',
                                    to: -0.5
                                }
                            }, {
                                level: 4,
                                colorVariation: {
                                    key: 'brightness',
                                    to: 0.5
                                }
                            }]

                    }],
                tooltip: {
                    headerFormat: "",
                    pointFormat: 'Resto de <b>{point.name}</b> es <b>{point.value}</b>'
                }
            });

            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>