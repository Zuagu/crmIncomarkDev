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

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-pagocuenta.js"></script>

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Reporte detallado de llamadas (RDL)
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
            <div class="datagrid" style="border: none;background: transparent;">

                VER LLAMADAS DEL DIA:
                <input id="fecha" type="text" class="datepicker" style="width: 150px;font-weight: bold;">
                <input type="button" value="OK" style="width: 40px;font-weight: bold;margin-right: 16px;background: #186C03;">

                <input type="button" value="CARGAR CONSUMO..." style="width: 150px;font-weight: bold;margin-right: 16px;">

                <span style="margin-right: 0px;float: right;text-align: right;font-size: 1.4rem;color: #E14D57;">SALDO AL CORTE: <b style="color:#D51717;">$1,564.56</b></span>
            </div>

            <br>
            <div id="div_pagos" class="datagrid sombra" style="height: 350px;overflow: auto;"></div>

        </div>
        <!--END CONTENT-->

        <!--END PAGE WRAPPER-->

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                fecha_hoy("fecha");
            }
            );
            //==================================================================
            $("#fecha").change(function () {
                select_pagos_asignacion_tabla_fecha($("#id_asignacion").val(), $("#fecha").val(), "div_pagos");
            });
            //==================================================================
            $("#insert_pagos").click(function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    if ($("#id_asignacion").val() == 0) {
                        alert("SELECCIONE UNA ASIGNACION");
                    } else {
                        insert_pagos_asignacion(
                                $('#usuario_sistema', parent.document).val(),
                                $("#id_cliente").val(),
                                $("#id_region").val(),
                                $("#id_asignacion").val(),
                                $("#desde").val(),
                                $("#hasta").val(),
                                "paso_siguiente"
                                );
                    }
                }
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>