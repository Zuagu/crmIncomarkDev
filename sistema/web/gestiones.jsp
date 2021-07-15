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
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-gestion.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png');">

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
                <!-- li><a href="#">Layouts</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li -->
            </ol>
            <div class="clearfix">
            </div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->

        <div class="contenedor-responsive">

            <!--BEGIN CONTENT-->
            <br>
            <div class="datagrid sombra">
                <table>
                    <thead>
                        <tr>
                            <th style="text-align: center;width: 12.5%;">CLIENTE</th>
                            <th style="text-align: center;width: 12.5%;">REGION</th>
                            <th style="text-align: center;width: 12.5%;">ASIGNACION</th>
                            <th style="text-align: center;width: 12.5%;">FECHA INICIAL</th>
                            <th style="text-align: center;width: 12.5%;">FECHA FINAL</th>
                            <th style="text-align: center;width: 12.5%;">HORA INICIAL</th>
                            <th style="text-align: center;width: 12.5%;">HORA FINAL</th>
                            <th style="text-align: center;width: 12.5%;">FINALIZAR</th>
                        </tr>
                    </thead>
                    <tr>
                        <td><select id="id_cliente"></select></td>
                        <td><select id="id_region"></select></td>
                        <td><select id="id_asignacion"></select></td>
                        <td><input id="desde" type="text" class="datepicker" value="" readonly></td>
                        <td><input id="hasta" type="text" class="datepicker" value="" readonly></td>
                        <td><input id="hora_inicial" value="06:00:00" type="text" value="GENERAR REPORTE"></td>
                        <td><input id="hora_final" value="23:00:00" type="text"></td>
                        <td>
                            <input id="select_reporte_gestiones" type="button" value="GENERAR" class="sombra" style="background:#0099FF;color:#FFF;border-radius:3px;padding: 4px 12px;border:none;font-weight: bold;">
                        </td>
                    </tr>
                </table>
            </div>

            <br>
            <div id="listado_gestiones" class="datagrid sombra" style="height: 350px;overflow: auto;text-align: center;font-size: 2rem;"></div>
            <!--END CONTENT-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(
                    function () {
                        select_clientes_combo("id_cliente");
                        fecha_hoy("desde");
                        fecha_hoy("hasta");
                    }
            );
            //==================================================================
            $("#select_reporte_gestiones").click(
                    function () {
                        if ($("#id_cliente").val() == "0") {
                            alert("SELECCIONE UN CLIENTE");
                        } else {
                            select_reporte_gestiones_csv(
                                    $("#id_cliente").val(),
                                    $("#id_region").val(),
                                    $("#id_asignacion").val(),
                                    $("#desde").val(),
                                    $("#hasta").val(),
                                    $("#hora_inicial").val(),
                                    $("#hora_final").val(),
                                    "listado_gestiones"
                                    );
                        }
                    }
            );
            //==================================================================
            $("#id_region").live("change", function () {
                select_asignacion_region_combo($("#id_region").val(), 1, "id_asignacion");
            });
            //==================================================================
            $("#id_cliente").live("change", function () {
                select_region_combo($("#id_cliente").val(), "id_region", true);
                select_asignacion_cliente_combo($("#id_cliente").val(), 1, "id_asignacion");
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>