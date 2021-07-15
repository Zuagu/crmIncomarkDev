<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>

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
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-convenio.js"></script>
        <script type="text/javascript" src="js/arcade-pesos.js"></script>

        <style>
            .barra{
                cursor: pointer;
                height: 18px;
                display:none;
                color: #FFFFFF;
                text-align: left;
                font-weight: bold;
                font-size: 1.2rem;
                padding: 1px 0 0 4px;
            }
        </style>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Convenios a nivel general
                </div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-left">
                <li>Manuales de usuario de este modulo:</li>
                <li id="pdf_horas-clase-maestro"><img class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>

            </ol>
            <div class="clearfix">
            </div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->

        <!--BEGIN CONTENT-->
        <div class="contenedor-responsive">
            <br>
            <div style="height: 124px;">
                <div class="datagrid sombra" style="float: left;width: 27%;margin-left: 3%;">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="3">FILTROS</th>
                            </tr>
                        </thead>
                        </tbody>
                        <tr>
                            <td style="text-align: right;">DESDE:</td>
                            <td><input id="desde" type="text" class="datepicker" style="border: solid 1px gray !important;text-align: center;font-weight: bold;font-size: 1.2rem;"></td>
                            <td rowspan="3">
                                <input id='select_reporte_gral' type="button" value="OK">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">HASTA:</td>
                            <td><input id="hasta" type="text" class="datepicker" style="border: solid 1px gray !important;text-align: center;font-weight: bold;font-size: 1.2rem;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">VER:</td>
                            <td>
                                <select id="id_reporte" style="font-size: 1.2rem;">
                                    <option value="1">PRODUCCION DE PROMESAS</option>
                                    <option value="2">ESTIMADO A COBRAR</option>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div id="div_info_regiones" class="datagrid sombra" style="width: 65%;float: right;margin-right: 3%;"></div>

            </div>

            <div id="listado_convenios" class="datagrid sombra" style="height: 252px; overflow: auto;"></div>

            <br>
            <div id="select_convenio_agrupado_tabla" style="margin: 0 0 0 3%;width: 14%;text-align: left;float: left;">
                <input type="button" value="AGRUPAR POR GESTOR" class="sombra">
            </div>
            <div style="margin: 0 0 0 1%;width: 4%;text-align: left;float: left;">
                <input onclick="tableToExcel('tabla_convenios', 'LISTADO DE CONVENIOS')" type="button" value="XLSX" class="sombra" style="width: 100%;background:#1F804D;color:#FFF;border-radius:3px;padding: 5px 10px;border:none;">
            </div>

            <div id="resumen_convenios" style="width: 74%;text-align: right;float: right;margin-right: 3%;"></div>

            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->

        </div>
        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                fecha_hoy("desde");
                fecha_hoy("hasta");
                $(".barra").show("slow");

                select_reporte_gral(
                        $('#usuario_sistema', parent.document).val(),
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(),
                        "div_info_regiones"
                        );

                select_convenio_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        1, // TELCEL por default
                        0, // TODAS LAS REGIONES
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                        "listado_convenios"
                        );

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
            $("#select_convenio_agrupado_tabla").click(function () {
                // TRAER TODOS LOS CONVENIOS BAJO LAS CARACTERISTICAS SOLICITADAS
                select_convenio_agrupado_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        1, // TELCEL por default
                        0, // TODAS LAS REGIONES
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                        "listado_convenios"
                        );
            });
            //==================================================================
            $("#number").on({
                "focus": function (event) {
                    $(event.target).select();
                },
                "keyup": function (event) {
                    $(event.target).val(function (index, value) {
                        return value.replace(/\D/g, "")
                                .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                                .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
                    });
                }
            });
            //==================================================================
            $("#select_reporte_gral").click(function () {
                select_reporte_gral(
                        $('#usuario_sistema', parent.document).val(),
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(),
                        "div_info_regiones"
                        );

                select_convenio_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        1, // TELCEL por default
                        0, // TODAS LAS REGIONES
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                        "listado_convenios"
                        );
            });
            //==================================================================
            $("#desde").change(function () {
                select_reporte_gral(
                        $('#usuario_sistema', parent.document).val(),
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(),
                        "div_info_regiones"
                        );

                select_convenio_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        1, // TELCEL por default
                        0, // TODAS LAS REGIONES
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                        "listado_convenios"
                        );
            });
            //==================================================================
            $("#hasta").change(function () {
                select_reporte_gral(
                        $('#usuario_sistema', parent.document).val(),
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(),
                        "div_info_regiones"
                        );

                select_convenio_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        1, // TELCEL por default
                        0, // TODAS LAS REGIONES
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                        "listado_convenios"
                        );
            });
            //==================================================================
            $("#id_reporte").change(function () {
                select_reporte_gral(
                        $('#usuario_sistema', parent.document).val(),
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(),
                        "div_info_regiones"
                        );

                select_convenio_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        1, // TELCEL por default
                        0, // TODAS LAS REGIONES
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                        "listado_convenios"
                        );
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>