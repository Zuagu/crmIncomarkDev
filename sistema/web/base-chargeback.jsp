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
                    Base Chargeback
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
            <div id="div_basechargeback" class="datagrid sombra" style="height: 300px;overflow: auto;"></div>

            <br>
            <div class="datagrid" style="border:none;background:transparent;float: left;margin-left: 3%;">
                <div style="float: left;width: 22%;text-align: center;">
                    <h4>RESUMEN ORIGINAL</h4>
                    <div id="resumen_cuentas" class="datagrid sombra"></div>
                </div>
                <div style="float: left;width: 22%;margin-left: 1%;text-align: center;">
                    <h4>RESUMEN ACTUAL</h4>
                    <div id="resumen_cuentas_actual" class="datagrid sombra" style="margin-bottom: 15px;"></div>
                </div>
                <div style="float: right;">
                    <input id="cargar" type="button" value="CARGAR NUEVA BASE">
                    <input id="insert_basechbk" type="button" value="ULTIMO PASO: FINALIZAR" style="display: none;">
                </div>
                <iframe id="form_cargar_crs" src="cargar-basechbk.jsp" frameborder="0" style="width: 40%;float:right;height: 170px;display: none;"></iframe>
            </div>

        </div>
        <!--END CONTENT-->

        <!--END PAGE WRAPPER-->

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_basechargeback_tabla("div_basechargeback");
                select_basechargeback_resumen_tabla("resumen_cuentas");
                select_basechargeback_resumen_tabla_actual("resumen_cuentas_actual");
            }
            );
            //==================================================================
            $("#cargar").click(function () {
                $(this).hide();
                $("#form_cargar_crs").show();
            }
            );
            //==================================================================
            $("#insert_basechbk").click(function () {
                insert_basechbk();
            }
            );
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>