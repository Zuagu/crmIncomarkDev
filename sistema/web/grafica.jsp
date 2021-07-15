<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="arcade.data.AsignacionDao"%>
<!DOCTYPE html>
<html lang="es">



    <head>
        <title>ERP</title>

        <!--ARCADE CSS-->
        <!--        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
                <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">-->

        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="styles/all.css">
        <link type="text/css" rel="stylesheet" href="styles/main.css">
        <!--ARCADE CSS-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>
        <script>
            $(function () {
                $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 1});
            });
        </script>
        <!-- TERMINA CALENDARIO -->

        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <script type="text/javascript" src="materialize/js/materialize.js"></script>


        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>



        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <!--ARCADE JS-->

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <%
            request.getParameter("id_asignacion");
            String data;
            String recuperado_diario = "";
            String titulo = "";
            String subtitulo = "";
            String fechas = "";
//            String subtitulo;
            if (request.getParameter("id_asignacion") == null || request.getParameter("id_asignacion").isEmpty()) {
                data = "0";
            } else {
                data = AsignacionDao.select_burndown_asignacion(Integer.parseInt(request.getParameter("id_asignacion")));
                recuperado_diario = AsignacionDao.recuperado_diario(Integer.parseInt(request.getParameter("id_asignacion")));
                titulo = AsignacionDao.nombre_asignacion(Integer.parseInt(request.getParameter("id_asignacion")));
                subtitulo = AsignacionDao.detalles_asignacion(Integer.parseInt(request.getParameter("id_asignacion")));
                fechas = AsignacionDao.fechas_pago_asignacion(Integer.parseInt(request.getParameter("id_asignacion")));
            }
        %>

        <!-- HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script> 
        <script type="text/javascript" src="highcharts/exporting.js"></script>
        <!-- HIGHCHARTS-->

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    </head>
    <body>
        <div>
            <!--BEGIN CONTENT-->
            <div id="container" style="min-width: 320px; height: 370px; margin: 0 auto"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            Highcharts.chart('container', {
                chart: {
                    zoomType: 'x'
                },
                title: {
                    text: 'DETALLE DE ASIGNACION <%= titulo%>'
                },
                subtitle: {
                    text: '<%= subtitulo%>'
                },
                xAxis: [{
                        categories: [<%= fechas%>],
                        crosshair: true
                    }],
                yAxis: [{// Primary yAxis
                        labels: {
                            format: '$ {value}',
                            style: {
                                color: Highcharts.getOptions().colors[9]
                            }
                        },
                        title: {
                            text: 'RECUPERACION',
                            style: {
                                color: Highcharts.getOptions().colors[9]
                            }
                        }
                    }, {// Secondary yAxis
                        title: {
                            text: 'AVANCE DE LA ASIGNACION',
                            style: {
                                color: Highcharts.getOptions().colors[9]
                            }
                        },
                        labels: {
                            format: '$ {value}',
                            style: {
                                color: Highcharts.getOptions().colors[9]
                            }
                        },
                        opposite: true
                    }],
                tooltip: {
                    shared: true
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    x: 0,
                    verticalAlign: 'top',
                    y: 0,
                    floating: true,
                    backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
                },
                series: [{
                        name: 'Restante de importe por cobrar diario ',
                        type: 'column',
                        yAxis: 1,
                        data: [<%= data%>],
                        tooltip: {
                            valueDecimals: 2,
                            valuePrefix: '$ ',
                            valueSuffix: ' MXN'
                        }

                    }, {
                        name: 'Recuperado este dia',
                        type: 'spline',
                        data: [<%= recuperado_diario%>],
                        tooltip: {
                            valueDecimals: 2,
                            valuePrefix: '$ ',
                            valueSuffix: ' MXN'
                        }
                    }]
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>