<%-- 
    Document   : blasters
    Created on : 26/12/2017, 08:34:02 PM
    Author     : Luis Cortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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

        <script type="text/javascript" src="js/arcade-blaster.js"></script>

        <style>
            #div_audios{
                position: absolute;
                left: 40%;
                top: 100px;
                border: solid 1px grey;
                height: 260px;
                width: 320px;
                overflow: auto;
                display: none;
            }
        </style>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Campañas de Blasters
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
            <div class="datagrid" style="border:none;background: transparent;">
                <input id="back" type="button" value="Volver al listado" style="display: none;">
                <!--<input type="button" value="NUEVO BLASTER .CSV" style="width: 170px;background: #054E00;">-->
            </div>

            <br>
            <div id="listado_blaster" class="datagrid sombra" style="height: 400px;overflow: auto;"></div>

            <br>
            <div class="datagrid" style="border:none;background: transparent;">
                <input id="ver_audios" type="button" value="CONFIGURAR AUDIOS" style="font-weight:bold;">
                <input id="nuevo_blaster" type="button" value="NUEVO BLASTER" style="font-weight:bold;background: #222222;">
                <input id="toxls" onclick="tableToExcel('resultado', 'Resultados de Blaster')" type="button" value="Exportar a Excel (CSV)" style="float: right;background: #006500;display: none;">
                <!--<input type="button" value="NUEVO BLASTER .CSV" style="width: 170px;background: #054E00;">-->
            </div>


            <div id="div_audios" class="datagrid sombra"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_blaster_tabla("listado_blaster");
                select_audios_blaster_tabla("div_audios", 0);
                actualizar();
            }
            );
            //==================================================================
            // ACTUALIZAMOS EL RESULTADO DEL BLASTER CADA 65 SEGUNDOS        
            function actualizar() {
                setInterval(function () {
                    select_blaster_tabla("listado_blaster");
                }, 180000); // Milisegundos - CADA 3 MINUTOS
            }
            ;
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
            $("#insert_blaster").live("click", function () {
                insert_blaster($("#blaster_insert").val());
            });
            //==================================================================
            $(".remarcar_blaster").live("click", function () {
                // REMARCAMOS TODO EL BLASTER : 1
                var _id_blaster = $(this).closest("tr").attr("id");
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    remarcar_blaster($('#usuario_sistema', parent.document).val(), _id_blaster, 1, "listado_blaster");
                }
            });
            //==================================================================
            $(".remarcar_blaster_nc").live("click", function () {
                // REMARCAMOS TODO EL BLASTER QUE NO CONTESTO
                var _id_blaster = $(this).closest("tr").attr("id");
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    remarcar_blaster($('#usuario_sistema', parent.document).val(), _id_blaster, 0, "listado_blaster");
                }

            });

            //==================================================================
            // REMARCAMOS TODO EL BLASTER QUE SI CONTESTÓ : 2
            $(".remarcar_blaster_ans").live("click", function () {
                // REMARCAMOS TODO EL BLASTER QUE SI CONTESTÓ
                var _id_blaster = $(this).closest("tr").attr("id");
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    remarcar_blaster($('#usuario_sistema', parent.document).val(), _id_blaster, 2, "listado_blaster");
                }
            });

            //==================================================================
            // GENERAR PREDICTIVO DE TAL BLASTER
            $(".genera_predictivo").live("click", function () {
                // REMARCAMOS TODO EL BLASTER QUE SI CONTESTÓ
                var _id_blaster = $(this).closest("tr").attr("id");
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    genera_predictivo($('#usuario_sistema', parent.document).val(), _id_blaster, "listado_blaster");
                }
            });

            //==================================================================
            $(".obtener_resultado_blaster").live("click", function () {

                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    obtener_resultado_blaster($(this).closest("tr").attr("id"), "listado_blaster");
                }
            });
            //==================================================================
            $(".delete_blaster").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_blaster($(this).closest("tr").attr("id"), "listado_blaster");
                }
            });
            //==================================================================
            $("#nuevo_blaster").click(function () {
                document.location = "generar-blaster.jsp";
            });
            //==================================================================
            $("#ver_audios").click(function () {
                if ($("#div_audios").is(":hidden")) {
                    $("#div_audios").show();
                } else {
                    $("#div_audios").hide();
                }
            });
            //==================================================================
            $(".contestadas").live("click", function () {
                window.open('resultados-blaster.jsp?id_blaster=' + $(this).closest("tr").attr("id") + '&ans=' + 1, 'Resultados ::');
            });
            //==================================================================
            $(".nocontestadas").live("click", function () {
                select_blaster_resultado_tabla($(this).closest("tr").attr("id"), 0, "listado_blaster");
                $(".page-title").text("Resultados Blaster");
                $("#back").show();
                $("#nuevo_blaster").hide();
                $("#toxls").show();
            });
            //==================================================================
            $("#back").live("click", function () {
                select_blaster_tabla("listado_blaster");
                $(".page-title").text("Campañas de Blasters");
                $("#back").hide();
                $("#nuevo_blaster").show();
                $("#toxls").hide();
            });
            //==================================================================
            $(".activar_audio").live("click", function () {
                if ($("#f_active" + $(this).closest("tr").attr("id")).val() == '0') {
                    $("#f_active" + $(this).closest("tr").attr("id")).val('1');
                } else {
                    $("#f_active" + $(this).closest("tr").attr("id")).val('0');
                }

                update_estatus_audio_blaster(
                        $(this).closest("tr").attr("id"),
                        $("#f_active" + $(this).closest("tr").attr("id")).val()
                        );

            });
            //==================================================================
            $(".nombre_audio_blaster").live("change", function () {
                update_nombre_audio_blaster($(this).closest("tr").attr("id"), $(this).val());
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>