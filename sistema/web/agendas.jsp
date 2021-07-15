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

        <script type="text/javascript" src="js/arcade-agenda.js"></script>
        <script type="text/javascript" src="js/arcade-call-operacion.js"></script>

    </head>
    <!--<body style="background:#E9EBEE;">-->
    <body  style="background-image: url('images/background-cliente.png');">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Seguimientos de agendas
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
        <div class="contenedor-responsive" style="min-width:710px;width: 710px;">

            <br>
            <div class="datagrid" style="border: solid 1px #DDDFE2; height: 267px;width: 500px;float: left;margin-bottom: 10px;">
                <div style="background: #F6F7F9;height: 10px;border-bottom: solid 1px #DDDFE2;height: 30px;padding:7px;">
                    <span><b>Listado de agendas</b></span>
                </div>
                <div id="listado_agenda" style="height:237px;overflow: auto;"></div>
            </div>

            <div style="float: right;width: 200px;">

                <div class="datagrid" style="border: solid 1px #DDDFE2; height: 64px;width: 100%;margin-bottom: 5px;">
                    <div style="background: #F6F7F9;height: 10px;border-bottom: solid 1px #DDDFE2;height: 30px;padding:7px;text-align: center;">
                        <span><b>Fecha de estas Agendas</b></span>
                    </div>
                    <div style="height: 10px;border-bottom: solid 1px #DDDFE2;height: 34px;padding:4px;text-align: center;">
                        <input id="fecha" type="text" class="datepicker" readonly style="border: none !important;margin: 0px auto;text-align: center;font-size: 2rem;width: 100%;">
                    </div>
                </div>

                <div class="datagrid" style="border: solid 1px #DDDFE2; height: 64px;width: 100%;margin-bottom: 5px;">
                    <div style="background: #F6F7F9;height: 10px;border-bottom: solid 1px #DDDFE2;height: 30px;padding:7px;text-align: center;">
                        <span><b>Total de agendas del dia</b></span>
                    </div>
                    <div style="height: 10px;border-bottom: solid 1px #DDDFE2;height: 34px;padding:4px;text-align: center;">
                        <input id="total_agendas" type="text" value="0" style="border: none !important;margin: 0px auto;text-align: center;text-align: center;font-size: 2rem;width: 100%;">
                    </div>
                </div>

                <div class="datagrid" style="border: solid 1px #DDDFE2; height: 64px;width: 100%;margin-bottom: 5px;">
                    <div style="background: #F6F7F9;height: 10px;border-bottom: solid 1px #DDDFE2;height: 30px;padding:7px;text-align: center;">
                        <span><b>No tomadas a tiempo</b></span>
                    </div>
                    <div style="height: 10px;border-bottom: solid 1px #DDDFE2;height: 34px;padding:4px;text-align: center;">
                        <input id="pasadas" type="text" value="0" style="border: none !important;margin: 0px auto;text-align: center;text-align: center;font-size: 2rem;width: 100%;">
                    </div>
                </div>

                <div class="datagrid" style="border: solid 1px #DDDFE2; height: 60px;width: 100%;margin-bottom: 5px;">
                    <div style="background: #F6F7F9;height: 10px;border-bottom: solid 1px #DDDFE2;height: 30px;padding:7px;text-align: center;">
                        <span><b>Atendidas / Por atender</b></span>
                    </div>
                    <div style="height: 10px;border-bottom: solid 1px #DDDFE2;height: 30px;padding:4px;text-align: center;">
                        <input type="text" class="datepicker" style="border: none !important;margin: 0px auto;text-align: center;">
                    </div>
                </div>

            </div>
            <!--END CONTENT-->

            <div class="datagrid" style="border: solid 1px #DDDFE2; height: 200px;width: 705px;float: left;">
                <div style="background: #F6F7F9;height: 10px;border-bottom: solid 1px #DDDFE2;height: 30px;padding:7px;">
                    <span><b>Gestiones de la cuenta </b> (Clic en una cuenta para traer las gesiones)</span>
                </div>
                <div id="divapp1" style="height: 170px;overflow: auto;"></div>
            </div>

        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                fecha_hoy("fecha");
                select_agenda_tabla($("#fecha").val(), "listado_agenda");
            }
            );
            //==================================================================
            $("#insert_agenda").live("click", function () {
                insert_agenda($("#agenda_insert").val());
            });
            //==================================================================
            $("#fecha").change(function () {
                select_agenda_tabla($("#fecha").val(), "listado_agenda");
            });
            //==================================================================
            $(".cuenta_encontrada").live("click", function () {
                select_gestiones_cuenta_fit($(this).text(), "divapp1");
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>