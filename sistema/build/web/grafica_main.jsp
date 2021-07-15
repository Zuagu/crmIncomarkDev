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
//varibles
         String asignaciones, estatus_name, estatus_x_asignaciones, mty_datos, chi_datos, pue_datos, cadena, num_asignaciones;

            asignaciones = EstatusCuentaDao.select_grafica_datos_general(1);
            estatus_name = EstatusCuentaDao.select_grafica_datos_general(2);
            estatus_x_asignaciones = EstatusCuentaDao.select_grafica_datos_general(3);
            mty_datos = EstatusCuentaDao.select_grafica_datos_general(4);
            chi_datos = EstatusCuentaDao.select_grafica_datos_general(5);
            pue_datos = EstatusCuentaDao.select_grafica_datos_general(6);
            num_asignaciones = EstatusCuentaDao.select_grafica_datos_general(7);

            cadena = mty_datos + "," + chi_datos + "," + pue_datos;

            String[] cadena_asignaciones = asignaciones.split(",");
            String[] cadena_estatus_name = estatus_name.split(",");
            String[] cadena_estatus_x_asignaciones = estatus_x_asignaciones.split(",");
            String[] cadena_estatus = cadena.split(",");
            String[] cadena_num_asig = num_asignaciones.split(",");

            int i, j, k = 0, l = 0, m = 0, n = 1, o = 0;
            String[] regiones = {"Monterrey", "Chihuahua", "Puebla"};

            
            int[] s_p_asignacion = new int[cadena_estatus_x_asignaciones.length];
            for (i = 0; i < cadena_estatus_x_asignaciones.length; i++) {
                s_p_asignacion[i] = Integer.parseInt(cadena_estatus_x_asignaciones[i]);
            }

            int[] asignaciones_regiones = new int [cadena_num_asig.length];
            for (i = 0; i < cadena_num_asig.length; i++) {
                asignaciones_regiones[i] = Integer.parseInt(cadena_num_asig[i]);
            }
            
            String data = "";

            data += "{\n'id': '0.0', \n"
                    + "'parent': '',\n"
                    + "'name': 'Telcel' \n"
                    + "},";

            for (i = 0; i < regiones.length; i++) {
                data += "\n\n{\n'id': '" + 1 + "." + (i + 1) + "', \n"
                        + "'parent': '0.0',\n"
                        + "'name': '" + regiones[i] + "'\n,"
                        + "},";

                for (j = 0; j < asignaciones_regiones[i]; j++) {
                    data += "\n\n{\n'id': '" + 2 + "." + (l + 1) + "', \n"
                            + "'parent': '1." + (i + 1) + "',\n"
                            + "'name': '" + cadena_asignaciones[k] + "' \n"
                            + "},\n\n";

                    //==========================================================
                    for (m = 0; m < s_p_asignacion[l]; m++) {
                        if (o == cadena_estatus.length - 1) {
                            data += "{\n'id': '" + 3 + "." + (n + 1) + "', \n"
                                    + "'parent': '2." + (l + 1) + "', \n"
                                    + "'name': '" + cadena_estatus_name[o] + "', \n"
                                    + "'value': " + cadena_estatus[o] + " \n"
                                    + "}";
                        } else {
                            data += "{\n'id': '" + 3 + "." + (n + 1) + "', \n"
                                    + "'parent': '2." + (l + 1) + "', \n"
                                    + "'name': '" + cadena_estatus_name[o] + "', \n"
                                    + "'value': " + cadena_estatus[o] + " \n"
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
            Highcharts.getOptions().colors.splice(1, 2);

            Highcharts.chart('container', {

                chart: {
                    height: '85%'
                },

                title: {
                    text: 'Importe por cobrar, agrupado por estatus, región y asigncacion'
                },
                subtitle: {
                    text: '<a href="saldos-estatus.jsp"> Saldos Estatus</a><br><a href="grafica-chihuahua.jsp">Chihuahua</a><br><a href="grafica_monterrey.jsp">monterrey</a><br><a href="grafica-puebla.jsp">Puebla</a>'
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