<%-- 
    Document   : referencias
    Created on : 22/12/2017, 11:32:21 AM
    Author     : Luis Cortez
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
        <!--ARCADE JS-->

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Porcentaje de actualizacion de referencias por asignacion
                </div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-left">
                <li>Manuales de usuario de este modulo:</li>
                <li id="pdf_horas-clase-maestro"><img class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>

            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->

        <div class="contenedor-responsive">

            <!--BEGIN CONTENT-->
            <br>

            <div style="width: 30%;float: left;">
                <div id="listado_asignaciones" class="datagrid sombra" style="width: 96%;float: right;"></div>
            </div>

            <input id="id_asignacion" type="hidden">

            <div style="width: 70%;float: right;">
                <div id="listado_cuentas" class="datagrid sombra" style="width: 96%;height: 458px;overflow: auto;"></div>
            </div>

            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_asignacion_referencias("listado_asignaciones");
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
            $(".actualiza_referencias_bg").live("click", function () {
                $("#id_asignacion").val($(this).closest("tr").attr("id"));
                select_cuentas_referencias($(this).closest("tr").attr("id"), "listado_cuentas");
            });
            //==================================================================
            $(".updt_col99").live("click", function () {
                updt_col99($("#id_asignacion").val(),
                        $(this).closest("tr").attr("id"),
                        $(this).closest("tr").find(".ref1").val(),
                        $(this).closest("tr").find(".t_ref1").val(),
                        $(this).closest("tr").find(".ref2").val(),
                        $(this).closest("tr").find(".t_ref2").val()
                        );
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>