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
        <script type="text/javascript" src="js/arcade-marcacion.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>

        <script src="highcharts/highcharts.js"></script>
        <script src="highcharts/data.js"></script>
        <script src="highcharts/exporting.js"></script>

    </head>

    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Asignaciones
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
                <b>ASIGNACIONES ACTIVAS</b>
                <select id="id_cliente"></select>
                <select id="id_region"></select>
                <input id='select_asignacion_tabla' type="button" value="OK" style="width: 46px;">
                <a href="#" id="mo_listado_asignaciones" style="float: right;">[ Mostrar / Ocultar]</a>
            </h5>
            <br>
            <div id="listado_asignaciones" class="datagrid sombra" style="overflow: auto;"></div>

            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(
                    function () {
                        select_clientes_combo("id_cliente", true);
                        select_marcacion_tabla("listado_campanias_marcacion");
                        select_colas("cola");
                    }
            );
            //==================================================================
            $(".update_asignacion").live("click", function () {
                update_asignacion($(this).closest("tr").attr("id"));
            }
            );
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region", false);
            });
            //==================================================================
            $("#select_asignacion_tabla").click(function () {
//                select_asignacion_tabla("listado_asignaciones", 1);
                select_asignacion_region_tabla("listado_asignaciones", $("#id_region").val(), 1);

            });
            //==================================================================
            $("#actualizar_campaigns").click(function () {
                select_marcacion_tabla("listado_campanias_marcacion");
            }
            );
            //==================================================================
            $(".generar_campania_crs").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    insert_campania_marcacion(
                            $(this).closest("tr").attr("id"),
                            1,
                            "listado_campanias_marcacion"
                            );
                }
            }
            );
            //==================================================================
            $(".generar_campania_cel").live("click", function () {

                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    insert_campania_marcacion(
                            $(this).closest("tr").attr("id"),
                            2,
                            "listado_campanias_marcacion"
                            );
                }
            }
            );
            //==================================================================
            $(".generar_campania_casa").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    insert_campania_marcacion(
                            $(this).closest("tr").attr("id"),
                            3,
                            "listado_campanias_marcacion"
                            );
                }
            }
            );
            //==================================================================
            $(".update_estatus_campania").live("click", function () {
                update_estatus_campania(
                        $(this).closest("tr").attr("id"),
                        "listado_campanias_marcacion"
                        );
            }
            );
            //==================================================================
            $("#mo_listado_asignaciones").live("click", function () {
                if ($("#listado_asignaciones").is(":visible")) {
                    $("#listado_asignaciones").hide();
                } else {
                    $("#listado_asignaciones").show();
                }
            }
            );
            //==================================================================
            $("#mo_listado_campanias_marcacion").live("click", function () {
                if ($("#listado_campanias_marcacion").is(":visible")) {
                    $("#listado_campanias_marcacion").hide();
                } else {
                    $("#listado_campanias_marcacion").show();
                }
            }
            );
            //==================================================================
            $(".delete_marcacion").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_marcacion($(this).closest("tr").attr("id"), "listado_campanias_marcacion");
                }
            }
            );
            //==================================================================
            $(".select_id_campaign").live("click", function () {
                $("#id_campana").val($(this).closest("tr").attr("id"));
            }
            );
            //==================================================================
            $("#cola").live("change", function () {
                if ($("#id_campana").val() == '') {
                    alert("SELECCIONE UNA CAMPAÑA");
                } else {
                    update_cola_campania($("#id_campana").val(), $("#cola").val());
                }
            }
            );
            //==================================================================
            $("#id_campana").contextmenu(function () {
                $(this).val('');
            }
            );
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
