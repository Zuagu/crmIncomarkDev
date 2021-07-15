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
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-gestion.js"></script>
        <script type="text/javascript" src="js/arcade-sucursal.js"></script>
        <script type="text/javascript" src="js/arcade-pesos.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>

        <style>
            #fecha{
                font-size: 1.6rem;
                text-align: center;
                border: 1px solid #808080;
                width: 145px;
                border-radius: 4px !important;
            }
        </style>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Reporte de gestiones
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

            <input id="columna" type='hidden' value="cuentas">
            <input id="orden" type='hidden' value="asc">

            <br>
            <div style="margin: 0px 3%;">
                <span>DESDE</span>
                <input id="fecha_inicio" type="text" class="datepicker" style="font-weight: bold;">

                <span>HASTA</span>
                <input id="fecha_fin" type="text" class="datepicker" style="font-weight: bold;">

                <span>SUCURSAL:</span>
                <select id='id_sucursal'></select>

                <input id="select_reporte_gestiones" type="button" value="OBTENER/ACTUALIZAR REPORTE" class="sombra" style="margin-left: 1%;font-weight: bold;">
            </div>

            <br>
            <div id="listado_indicador" class="datagrid sombra" style="max-height: 420px;overflow: auto;"></div>

            <br>
            <input onclick="tableToExcel('tabla_promesado', 'REPORTE DE GESTIONES')" type="button" value="EXPORTAR A EXCEL" class="sombra" style="margin-left: 3%;background:#1F804D;color:#FFF;font-weight: bold;">
            <div id="resumen_convenios" style="width: 74%;text-align: right;float: right;margin-right: 3%;font-size:1.8rem;font-weight: bold;"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                fecha_hoy('fecha_inicio');
                fecha_hoy('fecha_fin');

                select_sucursal_combo_reporte_gestiones("id_sucursal");
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
            $("#select_reporte_gestiones").click(function () {
                select_reporte_gestiones(
                        $("#id_sucursal").val(),
                        $("#fecha_inicio").val(),
                        $("#fecha_fin").val(),
                        $("#columna").val(),
                        $("#orden").val(),
                        "listado_indicador"
                        );
            });
            //==================================================================
            $(".delete_indicador").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_indicador($(this).closest("tr").attr("id"));
                }
            });
            //==================================================================
            $(".th_orden").live("click", function () {
                var _text = $(this).text();
                _text = _text.toLowerCase();
                $("#columna").val(_text);

                if ($("#orden").val() == "desc") {
                    $("#orden").val('asc');
                } else {
                    $("#orden").val('desc');
                }

                select_reporte_gestiones2(
                        $("#id_sucursal").val(),
                        $("#fecha_inicio").val(),
                        $("#fecha_fin").val(),
                        $("#columna").val(),
                        $("#orden").val(),
                        "listado_indicador"
                        );

            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>