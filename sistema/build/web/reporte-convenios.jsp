<%-- 
    Document   : reporte-convenios
    Created on : Sep 7, 2017, 5:20:21 PM
    Author     : LuiS Cortez

    SE VAN A RESPETAR LOS PAGOS A LAS CUENTAS 2 DIAS MAS DESPUES DE QUE SE INCUMPLA.
    UN PAGO SE VA A CONSIDIRAR COMO PAGADO SI SE CUBRE EL 90% DEL IMPORTE ESTABLECIDO EN EL CONVENIO.
    REGION, NO. PROMESAS, TOTAL, RECUPERADO, PORCENTAJE, 2 SEMANAS SIGUIENTES...

--%>

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

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-marcacion.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Reporte de Convenios
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

        <div class="contenedor-responsive">

            <!--BEGIN CONTENT-->
            <br>
            <h5 style="margin: 0 3%;">
                <b>CLIENTE:</b>
                <select id="id_cliente"></select>
                <b>REGION:</b>
                <select id="id_region"></select>
                <b>ETAPA:</b>
                <select id="id_etapa"></select>
                <b>DESDE:</b>
                <input id="desde" type="text" class="datepicker" readonly>
                <b>HASTA:</b>
                <input id="hasta" type="text" class="datepicker" readonly>
                <b>VER:</b>
                <select id="id_reporte">
                    <option value="1">PRODUCCION DE PROMESAS</option>
                    <option value="2">ESTIMADO A COBRAR</option>
                </select>
                <input id='select_convenio_tabla' type="button" value="OK" style="width: 46px;display: none;">
            </h5>

            <br>
            <div id="listado_convenios" class="datagrid sombra" style="height: 360px; overflow: auto;"></div>

            <br>
            <div id="select_convenio_agrupado_tabla" style="margin: 0 0 0 3%;width: 14%;text-align: left;float: left;">
                <input id="" type="button" value="AGRUPAR POR GESTOR">
            </div>
            <div style="margin: 0 0 0 1%;width: 4%;text-align: left;float: left;">
                <input onclick="tableToExcel('tabla_convenios', 'LISTADO DE CONVENIOS')" type="button" value="XLSX" class="sombra" style="width: 100%;background:#1F804D;color:#FFF;border-radius:3px;padding: 5px 10px;border:none;">
            </div>

            <div id="resumen_convenios" style="margin: 0px auto;width: 74%;text-align: right;float: right;margin-right: 3%;"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_clientes_combo("id_cliente", true);
                fecha_hoy("desde");
                fecha_hoy("hasta");
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
            $("#id_region").change(function () {
                select_convenio_tabla(
                        $('#usuario_sistema', parent.document).val(),
                        $("#id_cliente").val(),
                        $("#id_region").val(),
                        $("#desde").val(),
                        $("#hasta").val(),
                        $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                        "listado_convenios"
                        );
            });
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region", true);
                $("#select_convenio_tabla").show();
            });

            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region", true);
                $("#select_convenio_tabla").show();
            });
            //==================================================================
            $("#select_convenio_tabla").click(function () {
                if ($("#id_region").val() == null) {
                    alert("SELECCIONE UN CLIENTE...");
                } else {
                    // TRAER TODOS LOS CONVENIOS BAJO LAS CARACTERISTICAS SOLICITADAS
                    select_convenio_tabla(
                            $('#usuario_sistema', parent.document).val(),
                            $("#id_cliente").val(),
                            $("#id_region").val(),
                            $("#desde").val(),
                            $("#hasta").val(),
                            $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                            "listado_convenios"
                            );
                }
            });
            //==================================================================
            $("#select_convenio_agrupado_tabla").click(function () {
                if ($("#id_region").val() == null) {
                    alert("SELECCIONE UN CLIENTE...");
                } else {
                    // TRAER TODOS LOS CONVENIOS BAJO LAS CARACTERISTICAS SOLICITADAS
                    select_convenio_agrupado_tabla(
                            $('#usuario_sistema', parent.document).val(),
                            $("#id_cliente").val(),
                            $("#id_region").val(),
                            $("#desde").val(),
                            $("#hasta").val(),
                            $("#id_reporte").val(), // POR RECUPERACION O POR PRODUCCION DE PROMESAS
                            "listado_convenios"
                            );
                }
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
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>