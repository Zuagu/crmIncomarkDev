<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">

        <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="styles/main.css">
        <link type="text/css" rel="stylesheet" href="styles/all.css">
        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">

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
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-metodospago.js"></script>
        <script type="text/javascript" src="js/arcade-pagos-oc.js"></script>
        <script type="text/javascript" src="js/arcade-proveedores.js"></script>
        <script type="text/javascript" src="js/arcade-pagos-proveedores.js"></script>
        <script type="text/javascript" src="js/arcade-bancos.js"></script>
    </head>
    <body>
        <div>

            <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div class="page-title-breadcrumb option-demo">
                <div class="page-header pull-right">
                    <div class="page-title">
                        Ultimos pagos registrados
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

            <div style="width: 94%; margin: 10px auto;">
                <div class="datagrid sombra" style="min-width: 320px;float: left;width:32%;">
                    <table border="0">
                        <thead>
                            <tr>
                                <th colspan="2" style="text-align: center;">REGISTRAR PAGO A PROVEEDOR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="text-align: right;">PROVEEDOR:</td>
                                <td>
                                    <select id="ins_id_proveedor"></select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">ORDEN DE COMPRA:</td>
                                <td>
                                    <select id="ins_oc"></select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">IMPORTE:</td>
                                <td><input id="ins_importe" type="text" class="flotante"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">METODO PAGO:</td>
                                <td>
                                    <select id="ins_id_metodopago"></select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">CUENTA ORIGEN:</td>
                                <td>
                                    <select id="ins_id_cuenta">
                                        <option value="0">NO APLICA</option>
                                        <option value="1">018011670021 (FRANCISCO RENE MEDINA GARZA)</option>
                                        <option value="2">035952140017 (MEGAPARTS, S. A. DE C. V.)</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">BANCO DESTINO:</td>
                                <td>
                                    <select id="ins_id_banco_destino"></select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">ULTIMOS 4 DIGITOS CUENTA DESTINO:</td>
                                <td>
                                    <input id="ins_id_cuenta_destino" value="0" type="text" maxlength="4" class="entero" placeholder="EJEMPLO: 7445">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">COMENTARIOS:</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <textarea id="ins_comentarios" style="resize: none;width: 100%;height: 100px;"> </textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <img id="insert_pago_proveedor" title="REGISTRAR PAGO" src="images/i_save.png" alt="" style="float: right;cursor: pointer;">
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div id="div_ultimos_pagos" class="datagrid sombra" style="float: right;width: 67%;height: 500px;overflow: auto;">
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
                select_proveedores_combo("ins_id_proveedor");
                select_metodos_combo('ins_id_metodopago');
                select_pagos_proveedor_tabla('div_ultimos_pagos');
                select_bancos_combo('ins_id_banco_destino');
            }
            );
            //==================================================================
            $("#insert_pago_proveedor").on("click", function () {
                $("#insert_pago_proveedor").hide();
                insert_pago_oc(
                        $('#usuario_sistema', parent.document).val(),
                        $("#ins_id_proveedor").val(),
                        $("#ins_oc").val(),
                        $("#ins_importe").val(),
                        $("#ins_id_metodopago").val(),
                        $("#ins_id_cuenta").val(),
                        $("#ins_id_banco_destino").val(),
                        $("#ins_id_cuenta_destino").val(),
                        $("#ins_comentarios").val()
                        );
            });
            //==================================================================
            $("#ins_id_proveedor").on("change", function () {
                select_ordenes_sin_pagar_proveedor($("#ins_id_proveedor").val(), "ins_oc");
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>