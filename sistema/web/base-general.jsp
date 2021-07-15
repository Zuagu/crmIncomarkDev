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
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-crs.js"></script>

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-basegeneral.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Base General
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
            <div class="datagrid" style="border: none;background: transparent;height: 70px;">
                <div class="datagrid sombra" style="width: 40%;float: left;">
                    <table>
                        <thead>
                            <tr>
                                <th style="text-align: center;width: 25%;">CLIENTE</th>
                                <th style="text-align: center;width: 25%;">REGION</th>
                                <th style="width: 25%;"></th>
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
                                    <input id="select_basegeneral" type="button" value="GENERAR BASE" class="sombra" style="background:#0099FF;color:#FFF;border-radius:3px;padding: 4px 12px;border:none;font-weight: bold;display: none;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="div_basegeneral" style="height: 350px;overflow: auto;text-align: center;font-size: 2rem;"></div>

        </div>
        <!--END CONTENT-->

        <!--END PAGE WRAPPER-->

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_clientes_combo("id_cliente");
            }
            );
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region", true);
                $("#select_basegeneral").show();
            });
            //==================================================================
            $("#select_basegeneral").click(function () {
                select_basegeneral_tabla($("#id_region").val(), "div_basegeneral");
            }
            );
            //==================================================================
            $("#qa").click(function () {
                window.open("excel/base-general.csv");
            }
            );
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>