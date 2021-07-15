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

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-crs.js"></script>

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-basegeneral.js"></script>
        <script type="text/javascript" src="js/arcade-equipo.js"></script>

        <script type="text/javascript" src="js/arcade-cierre.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Cierre de asignacion
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
            <div id="filtros" class="datagrid" style="border: none;background: transparent;height: 90px;">
                <br>
                <div class="datagrid sombra" style="width: 46%;float: left;">
                    <table>
                        <thead>
                            <tr>
                                <th style="text-align: center;width: 20%;">CLIENTE</th>
                                <th style="text-align: center;width: 20%;">REGION</th>
                                <th style="text-align: center;width: 20%;">ASIGNACION</th>
                                <th style="width: 40%;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <select id="id_cliente"></select>
                                </td>
                                <td>
                                    <select id="id_region"></select>
                                </td>
                                <td>
                                    <select id="id_asignacion"></select>
                                </td>
                                <td>
                                    <input id="select_cierre_csv" type="button" value="GENERAR ARCHIVO DE CIERRE" class="sombra" style="font-size: 1.2rem;background:#0099FF;color:#FFF;border-radius:3px;padding: 4px 12px;border:none;font-weight: bold;display: none;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <br>
            <div style="margin: 0px auto;max-width: 720px;">
                <div id="div_cierre" class="datagrid sombra" style="margin: 0px auto;max-width: 720px;display: none;height: 400px; overflow: auto;"></div>

                <div id="caja_excel" style="text-align: right;margin-right: 3%;display: none;">
                    <br>
                    <input type="button" value="EXPORTAR A EXCEL" class="sombra" onclick="tableToExcel('tabla_cierre', 'CIERRE DE ASIGNACION')"  style="background:#1F804D;color:#FFF;border-radius:3px;padding: 5px 12px;border:none;font-weight: bold;font-size: 1.2rem;width: 160px;float: right;">
                </div>
            </div>

            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_clientes_combo("id_cliente", true);
            }
            );
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region", true);
            });
            //==================================================================
            $("#id_region").change(function () {
                select_asignacion_region_combo($("#id_region").val(), 1, "id_asignacion");
            });
            //==================================================================
            $("#id_asignacion").change(function () {
                $("#select_cierre_csv").show();
            });
            //==================================================================
            $("#select_cierre_csv").live("click", function () {
                if ($("#id_asignacion").val() == "0") {
                    alert("SELECCIONE UNA ASIGNACION E INTENTE DE NUEVO...");
                } else {
                    $("#div_cierre").show();
                    $("#filtros").hide();
                    select_cierre_tabla($('#usuario_sistema', parent.document).val(), $("#id_asignacion").val(), "div_cierre");
                }
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
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>