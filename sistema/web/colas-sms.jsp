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

        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>

        <script type="text/javascript" src="js/arcade-estatus-cuenta.js"></script>
        <script type="text/javascript" src="js/arcade-clipboard.js"></script>

        <style>
            input[type="checkbox"] {
                cursor: pointer;
            }
        </style>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Generador de Campañas de SMS
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
            <div class="datagrid sombra nohover" style="vertical-align: top !important;">

                <table>
                    <thead>
                        <tr>
                            <th style="width:8%;text-align: center;">REGION</th>
                            <th style="width:10%;text-align: center;">ASIGNACIONES</th>
                            <th style="width:12%;text-align: center;"><img src="images/i_filter.png">CON CR's</th>
                            <th style="width:10%;text-align: center;">¿QUÉ LADAS?</th>
                            <th style="width:10%;text-align: center;">ESTATUS</th>
                            <th style="width:10%;text-align: center;">RESTO Y ORDEN</th>
                            <th style="width:10%;text-align: center;">MENSAJE</th>
                            <th style="width:8%;text-align: center;"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <select id="id_region" style="display: inline-block;">
                                    <option>MONTRREY</option>
                                    <option>CHIHUAHUA</option>
                                    <option>PUEBLA</option>
                                </select>
                            </td>
                            <td>
                                <div id="div_asignaciones" class="datagrid" style="width: 100%;display: inline-block;height: 110px;overflow: auto;border: solid 1px #dadada;text-align: center;">
                                    <br><img src="images/e_joy-128.png" style="width: 32%;">
                                </div>

                                <input id="cadena_asignaciones" type="hidden" value="0">
                            </td>
                            <td style="text-align: center;">
                                <label><input value="tiene_cr" type="radio" name="tiene_cr">NO IMPORTA SI TIENEN CR's o NO</label><br>
                                <label><input value="1" type="radio" name="tiene_cr" checked="checked">SÓLO CUENTAS CON CR's</label>
                                <!--                                
                                <select id="tiene_cr" style="display: inline-block;">
                                    <option value="1">CON CRs</option>
                                    <option value="0">NO IMPORTA SI TRAE CRs o NO</option>
                                </select>
                                -->
                            </td>
                            <td>
                                <div id="div_ladas" class="datagrid" style="width: 100%;display: inline-block;height: 110px;overflow: auto;border: solid 1px #dadada;text-align: center;">
                                    <br><img src="images/e_dead-128.png" style="width: 32%;">
                                </div>
                                <input id="cadena_ladas" type="hidden" value="0">
                            </td>
                            <td>
                                <div id="div_estatus" class="datagrid" style="width: 100%;display: inline-block;height: 110px;overflow: auto;border: solid 1px #dadada;text-align: center;">
                                    <br><img src="images/e_surprise-128.png" style="width: 32%;">
                                </div>
                                <input id="cadena_estatus" type="hidden" value="0">
                            </td>
                            <td style="text-align: center;">
                                <br>
                                <img src="images/dinero.png"> >= $ <input id="importe" class="entero" type="text" style="width: 50%;text-align: center;font-weight: bold;font-size: 2rem;" value="0">
                                <br><br>
                                <label><input value="asc" type="radio" name="orden_s" checked="checked">DE MENOR A MAYOR</label>
                                <label><input value="desc" type="radio" name="orden_s">DE MAYOR A MENOR</label>
                                <!--                                    
                                <option value="asc">DE MENOR A MAYOR</option>
                                <option value="desc">DE MAYOR A MENOR</option>
                                -->
                            </td>

                            <td>
                                <select id="id_mensaje" style="display: inline-block;">
                                    <option title="ESTIMADO CLIENTE TELCEL, PASE A PAGAR PERRILLO">SALDOS MAYORES</option>
                                    <option title="PASE A PAGAR PERRILLO CLIENTE TELCEL, ES NECESARIO QUE SE PRESENTE EN CORTO, PORQUE SI NO DON CHARLIE SLIM SE PUEDE MOLESTAR">MENSAJE SANO</option>
                                </select>
                            </td>

                            <td style="text-align: center;">
                                <input id="num_cuentas" type="text" value="0" readonly style="font-size: 4rem;text-align: center;border: none;">
                                <span>CUENTAS</span>
                                <br><br>
                                <input id="insert_campania" value="FINALIZAR" type="button" style="display: inline-block;background: #F20044;">
                            </td>

                        </tr>

                        <tr>
                            <td></td>
                            <td style="text-align: center;"><input id="todas_asignaciones" type="button" value="TODAS" style="width: 64%;display: none;"></td>
                            <td></td>
                            <td style="text-align: center;"><input id="todas_ladas" type="button" value="TODAS" style="width: 64%;display: none;"></td>
                            <td style="text-align: center;"><input id="todas_estatus" type="button" value="TODOS" style="width: 64%;display: none;"></td>
                            <td></td>
                            <td style="text-align: center;"><img src="images/i_duda2.png" style="cursor: pointer;" title="PARA OBTENER VISTA PREVIA DE UN MENSAJE, COLOQUE EL CURSOR SOBRE ESTE."></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>


            </div>

            <br>
            <!--<div id="div_cuentas" class="datagrid sombra" style="height: 200px;overflow: auto;"></div>-->
            <div id="div_cuentas" class="datagrid sombra" style=""></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_region_combo(1, "id_region", true);
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
            $('#todas_estatus').click(function () {

                $(".agregado_estatus").prop("checked", true);

                $("#cadena_estatus").val('');

                $('#estatus_disponibles tr').each(function () {

                    if ($(this).closest('tr').find('.agregado_estatus').is(':checked')) {
                        $("#cadena_estatus").val($("#cadena_estatus").val() + $(this).closest('tr').attr("id") + ", ");
                    }
                });
                texto = $("#cadena_estatus").val();
                texto = texto.substring(0, texto.length - 2);
                $("#cadena_estatus").val(texto);

                select_cuentas_sms_blaster(
                        $("#id_region").val(),
                        $("#cadena_asignaciones").val(),
                        $('[name=tiene_cr]:checked').val(),
                        $("#cadena_ladas").val(),
                        $("#cadena_estatus").val(),
                        $("#importe").val(),
                        $('[name=orden_s]:checked').val(),
                        "div_cuentas"
                        );

            });
            //==================================================================
            $('#todas_ladas').click(function () {

                $(".agregado_ladas").prop("checked", true);

                $("#cadena_ladas").val('');

                $('#ladas_disponibles tr').each(function () {

                    if ($(this).closest('tr').find('.agregado_ladas').is(':checked')) {
                        $("#cadena_ladas").val($("#cadena_ladas").val() + $(this).closest('tr').attr("id") + ", ");
                    }
                });
                texto = $("#cadena_ladas").val();
                texto = texto.substring(0, texto.length - 2);
                $("#cadena_ladas").val(texto);

                select_estatus_cuenta_check($("#id_region").val(), $("#cadena_asignaciones").val(), $('[name=tiene_cr]:checked').val(), $("#cadena_ladas").val(), "div_estatus");
                $("#todas_estatus").show("fast");

            });
            //==================================================================
            $('#todas_asignaciones').click(function () {

                $(".agregado").prop("checked", true);

                $("#cadena_asignaciones").val('');

                $('#asignaciones_disponibles tr').each(function () {

                    if ($(this).closest('tr').find('.agregado').is(':checked')) {
                        $("#cadena_asignaciones").val($("#cadena_asignaciones").val() + $(this).closest('tr').attr("id") + ", ");
                    }
                });
                texto = $("#cadena_asignaciones").val();
                texto = texto.substring(0, texto.length - 2);
                $("#cadena_asignaciones").val(texto);

                if ($("#cadena_asignaciones").val() != "") {
                    select_ladas($("#id_region").val(), $("#cadena_asignaciones").val(), $('[name=tiene_cr]:checked').val(), $("#cadena_estatus").val(), "div_ladas");
                    $("#todas_ladas").show("fast");
                }

            });
            //==================================================================
            $('[name=tiene_cr]').live("click", function () {

                if ($("#cadena_asignaciones").val() != "") {
                    select_ladas($("#id_region").val(), $("#cadena_asignaciones").val(), $('[name=tiene_cr]:checked').val(), $("#cadena_estatus").val(), "div_ladas");
                }

            });
            //==================================================================
            $('#importe').change(function () {
                select_cuentas_sms_blaster(
                        $("#id_region").val(),
                        $("#cadena_asignaciones").val(),
                        $('[name=tiene_cr]:checked').val(),
                        $("#cadena_ladas").val(),
                        $("#cadena_estatus").val(),
                        $("#importe").val(),
                        $('[name=orden_s]:checked').val(),
                        "div_cuentas"
                        );
            });
            //==================================================================
            $('[name=orden_s]').live("click", function () {
                select_cuentas_sms_blaster(
                        $("#id_region").val(),
                        $("#cadena_asignaciones").val(),
                        $('[name=tiene_cr]:checked').val(),
                        $("#cadena_ladas").val(),
                        $("#cadena_estatus").val(),
                        $("#importe").val(),
                        $('[name=orden_s]:checked').val(),
                        "div_cuentas"
                        );
            });
            //==================================================================
            $(".agregado_estatus").live("click", function () {

                $("#cadena_estatus").val('');

                $('#estatus_disponibles tr').each(function () {

                    if ($(this).closest('tr').find('.agregado_estatus').is(':checked')) {
                        $("#cadena_estatus").val($("#cadena_estatus").val() + $(this).closest('tr').attr("id") + ", ");
                    }
                });
                texto = $("#cadena_estatus").val();
                texto = texto.substring(0, texto.length - 2);
                $("#cadena_estatus").val(texto);

                if ($("#cadena_estatus").val() == "") {
                    $("#cadena_estatus").val('0');
                }

                select_cuentas_sms_blaster(
                        $("#id_region").val(),
                        $("#cadena_asignaciones").val(),
                        $('[name=tiene_cr]:checked').val(),
                        $("#cadena_ladas").val(),
                        $("#cadena_estatus").val(),
                        $("#importe").val(),
                        $('[name=orden_s]:checked').val(),
                        "div_cuentas"
                        );

            });
            //==================================================================
            $(".agregado_ladas").live("click", function () {

                $("#cadena_ladas").val('');

                $('#ladas_disponibles tr').each(function () {

                    if ($(this).closest('tr').find('.agregado_ladas').is(':checked')) {
                        $("#cadena_ladas").val($("#cadena_ladas").val() + $(this).closest('tr').attr("id") + ", ");
                    }
                });
                texto = $("#cadena_ladas").val();
                texto = texto.substring(0, texto.length - 2);
                $("#cadena_ladas").val(texto);

                if ($("#cadena_ladas").val() != "") {
                    select_estatus_cuenta_check($("#id_region").val(), $("#cadena_asignaciones").val(), $('[name=tiene_cr]:checked').val(), $("#cadena_ladas").val(), "div_estatus");
                    $("#todas_estatus").show("fast");
                }
            });
            //==================================================================
            $(".agregado").live("click", function () {

                $("#cadena_asignaciones").val('');

                $('#asignaciones_disponibles tr').each(function () {

                    if ($(this).closest('tr').find('.agregado').is(':checked')) {
                        $("#cadena_asignaciones").val($("#cadena_asignaciones").val() + $(this).closest('tr').attr("id") + ", ");
                    }
                });
                texto = $("#cadena_asignaciones").val();
                texto = texto.substring(0, texto.length - 2);
                $("#cadena_asignaciones").val(texto);

                if ($("#cadena_asignaciones").val() != "") {
                    select_ladas($("#id_region").val(), $("#cadena_asignaciones").val(), $('[name=tiene_cr]:checked').val(), $("#cadena_estatus").val(), "div_ladas");
                    $("#todas_ladas").show("fast");
                }
            });
            //==================================================================
            $("#id_region").live("change", function () {
                if ($("#id_region").val() > 0) {
                    select_asignacion_region_check($(this).val(), "div_asignaciones");
                    $("#todas_asignaciones").show("fast");
                }
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