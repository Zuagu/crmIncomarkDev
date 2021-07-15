<%-- 
    Document   : saldos-estatus.jsp
    Created on : 6/01/2018, 10:30:14 AM
    Author     : Luis Cortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="arcade.data.EstatusCuentaDao"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Saldos por Estatus :: ARCADE Software</title>

        <!--ARCADE CSS-->
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">

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

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-equipo.js"></script>
        <script type="text/javascript" src="js/arcade-estatus-cuenta.js"></script>
        <script type="text/javascript" src="js/arcade-pesos.js"></script>

        <style>
            #resultado_saldos_estatus td, #resultado_saldos_estatus th{
                border: 1px solid grey;
            }
        </style>
        
        <%
            String monterrey;
            String chihuahua;
            String puebla;
            
            String estatus_monterrey;
            String estatus_chihuahua;
            String estatus_puebla;
            
            String estatus_datos_monterrey;
            String estatus_datos_chihuahua;
            String estatus_datos_puebla;
            
            monterrey = EstatusCuentaDao.select_importe_region(1);
            chihuahua = EstatusCuentaDao.select_importe_region(2);
            puebla = EstatusCuentaDao.select_importe_region(6);
            
            estatus_monterrey = EstatusCuentaDao.select_datos_estatus_grafica(1);
            estatus_chihuahua = EstatusCuentaDao.select_datos_estatus_grafica(2);
            estatus_puebla = EstatusCuentaDao.select_datos_estatus_grafica(6);
            
            estatus_datos_monterrey = EstatusCuentaDao.select_nombre_estatus_grafica(1);
            estatus_datos_chihuahua = EstatusCuentaDao.select_nombre_estatus_grafica(2);
            estatus_datos_puebla = EstatusCuentaDao.select_nombre_estatus_grafica(6);

        %>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/exporting.js"></script>

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Saldos por estatus
                </div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-left">
                <li>Manuales de usuario de este modulo:</li>
                <li id="pdf_horas-clase-maestro"><img class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>

            </ol>
            <div class="clearfix">
            </div>
        </div>

        <div class="contenedor-responsive">
            <!--END TITLE & BREADCRUMB PAGE-->

            <!--BEGIN CONTENT-->
            <br>
            <div class="datagrid" style="background: transparent;border: none;">

                <div style="width: 40%;float: left;border: none;">
                    <div class="datagrid sombra" style="width: 100%;float: left;border: none;margin-bottom: 20px;">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th colspan="3">FILTROS PRINCIPALES...</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="padding: 6px;width: 33.33%;background: #FFF !important;">
                                        <div id="div_clientes" style="height: 120px;width: 100%;overflow: auto;" class="datagrid"></div>
                                        <input id="cadena_clientes" type="hidden">
                                    </td>
                                    <td style="padding: 6px;width: 33.33%;background: #FFF !important;">
                                        <div id="div_regiones" style="height: 120px;overflow: auto;" class="datagrid"></div>
                                        <input id="cadena_regiones" type="hidden">
                                    </td>
                                    <td style="padding: 6px;width: 33.33%;background: #FFF !important;">
                                        <div id="div_asignaciones" style="height: 120px;overflow: auto;" class="datagrid"></div>
                                        <input id="cadena_asignaciones" type="hidden">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding: 5px;background: #FFF !important;">
                                        <div id="div_equipos" style="height: 180px;overflow: auto;width: 97%;" class="datagrid"></div>
                                        <input id="cadena_equipos" type="hidden">
                                    </td>
                                    <td style="padding: 6px;background: #FFF !important;text-align: center;">
                                        <div id="filtros_finales" style="display: none;">
                                            RESTO MAYOR A:
                                            <input id="resto" type="text" value="0" class="entero" style="font-size: 2rem;font-weight: bold;text-align: center;border:none;">
                                            <br><br>
                                            SÓLO CON CR's:<input id="tiene_cr_check" type="checkbox">
                                            <input id="tiene_cr" type="hidden" value="tiene_cr">

                                            <br><br>
                                            <input id="imprimir" type="button" value="Imprimir">
                                        </div>
                                        <!--<input id="generar_datos" type="button" value="GRAFICAR">-->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                   </div>

                    <div class="datagrid sombra" style="width: 100%;float: left;border: none;margin-bottom: 20px;">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th colspan="3">RESULTADO AGRUPADO POR CATEGORIA DE ESTATUS...</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                       </table>
                    </div>
                </div>

                <div class="datagrid sombra" style="width: 59%;float: right;border: none;margin-bottom: 20px;">
                    <div id="container" style="width: 100%; height: 350px; margin: 0 auto;overflow: auto;border: solid 1px #000;"></div>
                </div>

                <h3 id="resumen_saldos" style="text-align: right;">
                    HAY SELECCIONADAS <span id="resumen_total_cuentas" style="font-weight: bold;">0</span> CUENTAS<br>EQUIVALENTE A $<span id="resumen_importe_cuentas" style="font-weight: bold;">$142,937,440.00</span><br><br>
                    <!--TOTAL EN LO SELECCIONADO, <span id="resumen_total_cuentas_sec" style="font-weight: bold;">3548</span> CUENTAS, EQUIVALENTE A $<span id="resumen_importe_cuentas_sel" style="font-weight: bold;">$142,937,440.00</span><br>-->
                </h3>

            </div>

            <!-- GENERAR UN PREDICTIVO Y UN BLASTER DE LO SELECCIONADO -->


            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_clientes_check("div_clientes");
                grafica();
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
            $("#generar_datos").click(function () {

                select_saldos_estatus(
                        $("#cadena_clientes").val(),
                        $("#cadena_regiones").val(),
                        $("#cadena_asignaciones").val(),
                        $("#cadena_equipos").val(),
                        $("#resto").val(),
                        $("#tiene_cr").val(),
                        "container");

            });
            //==================================================================
            $(".ver_cuentas").live("click", function () {

                window.open("cuentas-estatus.jsp?a=" + $("#cadena_clientes").val() + "&b=" + $("#cadena_regiones").val() + "&c=" + $("#cadena_asignaciones").val() + "&d=" + $("#cadena_equipos").val() + "&e=" + $("#resto").val() + "&f=" + $("#tiene_cr").val() + "&g=" + $(this).closest("tr").attr("id"));

            });
            //==================================================================
            $(".check_cliente").live("click", function () {

                // INICIALIZAMOS LA VARIABLE CADENA...
                genera_cadena("clientes", "cliente");

                // SI LA CADENA ES VALIDA, TRAEMOS EL SIGUIENTE NIVEL
                if ($("#cadena_clientes").val().length > 0) {
                    select_region_check($("#cadena_clientes").val(), "div_regiones");
                } else {
                    $("#div_regiones").empty();
                }

            });
            //==================================================================
            $(".check_id_estatus").live("click", function () {

                genera_resumen();

            });
            //==================================================================
            $("#check_id_estatus_todos").live("click", function () {

                if ($("#check_id_estatus_todos").is(":checked")) {
                    $(".check_id_estatus").prop("checked", true);

                } else {
                    $(".check_id_estatus").prop("checked", false);
                }

                genera_resumen();

            });

            //==================================================================
            $(".check_region").live("click", function () {

                // INICIALIZAMOS LA VARIABLE CADENA...
                genera_cadena("regiones", "region");

                // SI LA CADENA ES VALIDA, TRAEMOS EL SIGUIENTE NIVEL
                if ($("#cadena_regiones").val().length > 0) {
                    select_asignacion_check($("#cadena_regiones").val(), "div_asignaciones");
                    select_asignacion_check($("#cadena_regiones").val(), "div_asignaciones");
                } else {
                    $("#div_asignaciones").empty();
                    $("#div_equipos").empty();
                    $("#filtros_finales").hide();
                    $("#container").empty();
                }

            });
            //==================================================================
            $("#check_region_todos").live("click", function () {

                if ($("#check_region_todos").is(":checked")) {
                    $(".check_region").prop("checked", true);

                } else {
                    $(".check_region").prop("checked", false);

                }

                // INICIALIZAMOS LA VARIABLE CADENA...
                genera_cadena("regiones", "region");

                // SI LA CADENA ES VALIDA, TRAEMOS EL SIGUIENTE NIVEL
                if ($("#cadena_regiones").val().length > 0) {
                    select_asignacion_check($("#cadena_regiones").val(), "div_asignaciones");
                } else {
                    $("#div_asignaciones").empty();
                    $("#div_equipos").empty();
                    $("#filtros_finales").hide();
                }

            });
            //==================================================================
            $(".check_asignacion").live("click", function () {


                // INICIALIZAMOS LA VARIABLE CADENA...
                genera_cadena("asignaciones", "asignacion");

                // SI LA CADENA ES VALIDA, TRAEMOS EL SIGUIENTE NIVEL
                if ($("#cadena_asignaciones").val().length > 0) {
                    select_equipo_check($("#cadena_asignaciones").val(), "div_equipos");
                } else {
                    $("#div_equipos").empty();
                    $("#filtros_finales").hide();
                    $("#container").empty();
                }
            });
            //==================================================================
            $("#check_asignacion_todos").live("click", function () {

                if ($("#check_asignacion_todos").is(":checked")) {
                    $(".check_asignacion").prop("checked", true);

                } else {
                    $(".check_asignacion").prop("checked", false);
                }

                // INICIALIZAMOS LA VARIABLE CADENA...
                genera_cadena("asignaciones", "asignacion");

                // SI LA CADENA ES VALIDA, TRAEMOS EL SIGUIENTE NIVEL
                if ($("#cadena_asignaciones").val().length > 0) {
                    select_equipo_check($("#cadena_asignaciones").val(), "div_equipos");
                } else {
                    $("#div_equipos").empty();
                    $("#filtros_finales").hide();
                    $("#container").empty();

                }

            });
            //==================================================================
            $(".check_equipo").live("click", function () {

                // INICIALIZAMOS LA VARIABLE CADENA...
                genera_cadena("equipos", "equipo");

                // SI LA CADENA ES VALIDA, TRAEMOS EL SIGUIENTE NIVEL
                if ($("#cadena_equipos").val().length > 0) {
                    $("#filtros_finales").show();
                    select_saldos_estatus(
                            $("#cadena_clientes").val(),
                            $("#cadena_regiones").val(),
                            $("#cadena_asignaciones").val(),
                            $("#cadena_equipos").val(),
                            $("#resto").val(),
                            $("#tiene_cr").val(),
                            "container");

                } else {
                    $("#filtros_finales").hide();
                    $("#resto").val('0');
                    $("#container").empty();
                }
            });
            //==================================================================
            $("#check_equipo_todos").live("click", function () {

                if ($("#check_equipo_todos").is(":checked")) {
                    $(".check_equipo").prop("checked", true);

                } else {
                    $(".check_equipo").prop("checked", false);
                }

                // INICIALIZAMOS LA VARIABLE CADENA...
                genera_cadena("equipos", "equipo");

                // SI LA CADENA ES VALIDA, TRAEMOS EL SIGUIENTE NIVEL
                if ($("#cadena_equipos").val().length > 0) {
                    $("#filtros_finales").show();
                    select_saldos_estatus(
                            $("#cadena_clientes").val(),
                            $("#cadena_regiones").val(),
                            $("#cadena_asignaciones").val(),
                            $("#cadena_equipos").val(),
                            $("#resto").val(),
                            $("#tiene_cr").val(),
                            "container");

                } else {
                    $("#filtros_finales").hide();
                    $("#container").empty();
                }

            });
            //==================================================================
            $("#resto").change(function () {

                select_saldos_estatus(
                        $("#cadena_clientes").val(),
                        $("#cadena_regiones").val(),
                        $("#cadena_asignaciones").val(),
                        $("#cadena_equipos").val(),
                        $("#resto").val(),
                        $("#tiene_cr").val(),
                        "container");

            });
            //==================================================================
            $("#tiene_cr_check").live("click", function () {

                if ($("#tiene_cr_check").is(":checked")) {
                    $("#tiene_cr").val("1");
                } else {
                    $("#tiene_cr").val("tiene_cr");
                }

                select_saldos_estatus(
                        $("#cadena_clientes").val(),
                        $("#cadena_regiones").val(),
                        $("#cadena_asignaciones").val(),
                        $("#cadena_equipos").val(),
                        $("#resto").val(),
                        $("#tiene_cr").val(),
                        "container");

            });
            //==================================================================
            function genera_cadena(_plural, _singular) {

                // Delimitamos la variable 
                var _texto;
                $("#cadena_" + _plural).val('');

                $('#' + _singular + '_disp tbody tr').each(function () {
                    if ($(this).closest('tr').find('.check_' + _singular).is(':checked')) {
                        $("#cadena_" + _plural).val($("#cadena_" + _plural).val() + $(this).closest('tr').attr("id") + ", ");
                    }
                });

                _texto = $("#cadena_" + _plural).val();
                _texto = _texto.substring(0, _texto.length - 2);
                $("#cadena_" + _plural).val(_texto);
                _texto = $("#cadena_" + _plural).val();

            }
            //==================================================================
            function grafica() {

                var colors = Highcharts.getOptions().colors,
                        categories = ['MONTERREY', 'CHIHUAHUA', 'PUEBLA'],
                        data = [{
                                y: <%= monterrey%>,
                                color: colors[0],
                                drilldown: {
                                    name: 'Estatus MONTERREY',
                                    categories: [<%= estatus_datos_monterrey%>],
                                    data: [<%= estatus_monterrey%>],
                                    color: colors[0]
                                }
                            }, {
                                y: <%= chihuahua%>,
                                color: colors[1],
                                drilldown: {
                                    name: 'Estatus CHIHUAHUA',
                                    categories: [<%= estatus_datos_chihuahua%>],
                                    data: [<%= estatus_chihuahua%>],
                                    color: colors[1]
                                }
                            }, {
                                y: <%= puebla%>,
                                color: colors[2],
                                drilldown: {
                                    name: 'Estatus PUEBLA',
                                    categories: [<%= estatus_datos_puebla%>],
                                    data: [<%= estatus_puebla%>],
                                    color: colors[2]
                                }
                            }],
                        browserData = [],
                        versionsData = [],
                        i,
                        j,
                        dataLen = data.length,
                        drillDataLen,
                        brightness;


// Build the data arrays
                for (i = 0; i < dataLen; i += 1) {

                    // add browser data
                    browserData.push({
                        name: categories[i],
                        y: data[i].y,
                        color: data[i].color
                    });

                    // add version data
                    drillDataLen = data[i].drilldown.data.length;
                    for (j = 0; j < drillDataLen; j += 1) {
                        brightness = 0.2 - (j / drillDataLen) / 5;
                        versionsData.push({
                            name: data[i].drilldown.categories[j],
                            y: data[i].drilldown.data[j],
                            color: Highcharts.Color(data[i].color).brighten(brightness).get()
                        });
                    }
                }

// Create the chart
                Highcharts.chart('container', {
                    chart: {
                        type: 'pie'
                    },
                    title: {
                        text: 'Importe por cobrar, agrupado por estatus y por región'
                    },
                    subtitle: {
                        text: 'Fuente: <a href="grafica_main.jsp">Grafica Principal</a>'
                    },
                    yAxis: {
                        title: {
                            text: 'Total percent market share'
                        }
                    },
                    plotOptions: {
                        pie: {
                            shadow: false,
                            center: ['50%', '50%']
                        }
                    },
                    tooltip: {
                        valueSuffix: '%'
                    },
                    series: [{
                            name: 'Region',
                            data: browserData,
                            size: '60%',
                            dataLabels: {
                                formatter: function () {
                                    return this.y > 5 ? this.point.name : null;
                                },
                                
                                color: '#ffffff',
                                distance: -30
                            }
                        }, {
                            name: 'Versions',
                            data: versionsData,
                            size: '80%',
                            innerSize: '60%',
                            dataLabels: {
                                formatter: function () {
                                    // display only if larger than 1
                                    return this.y > 1 ? '<b>' + this.point.name + ':</b> ' + this.y + '%' : null;
                                }
                            }
                        }]
                });

            }
            ;

            //==================================================================
            $("#imprimir").click(
                    function () {
                        $('.ds').hide();
//                        printDiv("container");

                        var content = document.getElementById("container").innerHTML;
                        var mywindow = window.open('', 'ARCADE Software');

                        mywindow.document.write('<html><head><title>Saldos por Estatus | ARCADE Software | Sistemas</title>');
                        mywindow.document.write('<style>#resultado_saldos_estatus th{border: 1px solid grey;padding:4px 12px;font-size:12px !important;}</style>');
                        mywindow.document.write('<style>#resultado_saldos_estatus tbody tr td{border: 1px solid grey;padding:4px 12px;font-size:12px !important;}</style>');
                        mywindow.document.write('<style>#resultado_saldos_estatus {width:100%;}</style>');
                        mywindow.document.write('</head><body>');
                        mywindow.document.write($("#resumen_saldos").text());
                        mywindow.document.write('<br><br>');
                        mywindow.document.write(content);
                        mywindow.document.write('</body></html>');

                        mywindow.document.close();
                        mywindow.focus();
                        mywindow.print();
                        mywindow.close();

                        $('.ds').show();

                        return true;
                    });
            //==================================================================
            function printDiv(nombreDiv) {
                var contenido = document.getElementById(nombreDiv).innerHTML;
                var contenidoOriginal = document.body.innerHTML;

                document.body.innerHTML = contenido;

                window.print();

                document.body.innerHTML = contenidoOriginal;
            }
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
