<%-- 
    Document   : gestiones-asignacion
    Created on : 26-feb-2018, 18:10:57
    Author     : luiscortez
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
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-gestion.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            #fecha{
                border: none !important;
                color: #FFF !important;
                float: right;
                background: transparent !important;
                font-weight: bold !important;
                font-size: 1.6rem;
                text-align: right;
                padding-right: 14px;
                width: 106px;
            }
            #headhead{
                vertical-align: middle;
                padding: 6px 0px;
                text-align: center;
                background: #000;
                color:#FFF;
                border-radius: 4px 4px 0px 0px !important;
            }
            .dato td{
                background:#FFFFFF !important;
                color:#000000 !important;
                border-bottom: solid 1px #ececec !important;
            }
            .titulo td{
                background:#2F2F2F !important;
                color:#FFFFFF !important;
                font-weight: bold;
                font-size: 1.4rem !important; 
            }
        </style>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Gestiones por asignación
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
        <div class="contenedor-responsive" style="max-width: 990px;">

            <br>
            <div id="headhead" class="datagrid" style="">
                REGION: <select id="id_region" style="color:#000;"></select>
             
                <input id="hasta" type="text" class="datepicker" style="border:solid 1px gray;color:#000;float: right;">
                <span style="float: right;">HASTA: </span>
                   <input id="desde" type="text" class="datepicker" style="border:solid 1px gray;color:#000;float: right;">
                <span style="float: right;">DESDE: </span>
            </div>

            <div id="div_reporte" class="datagrid sombra" style="max-height: 520px;border-radius: 0px 0px 4px 4px !important;overflow: auto;"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_region_combo(1, "id_region", true);
                fecha_hoy("fecha");
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
                select_reporte_gestiones_region($("#id_region").val(), $("#desde").val(),$("#hasta").val(), "div_reporte");
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>