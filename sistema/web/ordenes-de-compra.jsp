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
        <script type="text/javascript" src="js/arcade-ordenesdecompra.js"></script>
        <script type="text/javascript" src="js/arcade-proveedores.js"></script>
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <div>

            <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="encabezado" class="page-title-breadcrumb option-demo">
                <div class="page-header pull-right">
                    <div class="page-title">
                        Consulta de Ordenes de Compra
                    </div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-left">
                    <li>Manuales de usuario de este modulo:</li>
                    <li id="pdf_horas-clase-maestro"><img class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->

            <!--BEGIN CONTENT-->
            <div id="todo">
                <div id="listado_ordenes" class="datagrid sombra" style="height: 620px;margin: 40px auto;overflow: auto;"></div>
            </div>
            <!--END CONTENT-->

            <!--FORMATO ORDEN DE COMPRA-->
            <div id="formato_orden" style="width:1080px;max-width: 1080px; margin: 2px;border: none;float: left;padding: 20px 50px;box-shadow: 2px 2px 5px #444;display: none;">
                <div id="encabezado_orden" style="float: left;width: 100%;">

                    <table border="0" style="width: 100%;">
                        <tr>
                            <td><img id="imprimir" src="images/logo-cliente.png" style="float:left;"></td>
                            <td></td>
                            <td></td>
                            <td style="font-weight: bold;font-size: 20px;text-align: right;">ORDEN DE COMPRA
                                <br><input id="folio" type="text" style="float: right;text-align: right;color: red;border: none;">
                                <br><span id="cot_fecha" style="font-size: 12px;color: #888;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td id="cot_datosfiscales" style="text-align: left;border-top: solid 1px #888;padding-top: 15px;" colspan="4"></td>
                        </tr>
                    </table>

                    <br>
                    <table border="0" style="width: 100%;">
                        <tr>
                            <td colspan="4" style="font-weight: bold; text-align: center;color: #888;font-size: 16px;border-top: solid 1px #888;padding-top: 20px;">
                                DATOS DEL PROVEEDOR
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">RAZON SOCIAL:</td>
                            <td id="cot_razon_social" style="font-weight: bold;font-size: 14px;"></td>
                            <td style="text-align: right;">RFC:</td>
                            <td id="cot_rfc" style="font-weight: bold;font-size: 14px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">DIRECCION:</td>
                            <td colspan="3" id="cot_direccion" style="font-weight: bold;font-size: 14px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">EMAIL:</td>
                            <td id="cot_telefonos" style="font-weight: bold;font-size: 14px;"></td>
                            <td style="text-align: right;">TELEFONOS:</td>
                            <td id="cot_contacto" style="font-weight: bold;font-size: 14px;"></td>
                        </tr>
                    </table>

                    <br>
                    <div id="cot_cuerpo_orden" class="datagrid" style="width: 100%; float: left;"></div>

                    <div style="float: left;width: 100%;height:2px;"></div>

                    <div class="datagrid" style="width: 30%; float: right;margin-top: 10px;">
                        <table border="1" style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td style="text-align: right;">SUBTOTAL:</td>
                                    <td style="text-align: right;" id="cot_subtotal"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">IVA:</td>
                                    <td style="text-align: right;" id="cot_iva"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">TOTAL:</td>
                                    <td style="text-align: right;" id="cot_total"></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <br>
                    <table border="0" style="width: 100%;">
                        <tr><td colspan="4" id="cot_importeletra" style="font-weight: bold;font-size: 14px;text-align: center;"></td></tr>
                        <tr><td colspan="4" style="font-weight: bold;font-size: 10px;text-align: center;">Importe con letra</td></tr>
                    </table>
                </div>

                <div style="float: left;width: 100%;height:20px;"></div>

                <table border="0" style="width: 100%;">
                    <tr>
                        <td colspan="6" style="font-weight: bold; text-align: center;color: #888;font-size: 16px;border-top: solid 1px #888;padding-top: 20px;">
                            CONDICIONES COMERCIALES
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">FORMA DE PAGO:</td>
                        <td id="cond_1" style="font-weight: bold;font-size: 14px;"></td>
                        <td style="text-align: right;">NUMERO DE PARCIALIDADES:</td>
                        <td id="cond_2" style="font-weight: bold;font-size: 14px;"></td>
                        <td style="text-align: right;">METODO DE PAGO:</td>
                        <td id="cond_3" style="font-weight: bold;font-size: 14px;"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">CONDICIONES DE PAGO:</td>
                        <td id="cond_4" style="font-weight: bold;font-size: 14px;"></td>
                        <td style="text-align: right;">DIAS DE CREDITO:</td>
                        <td id="cond_5" style="font-weight: bold;font-size: 14px;"></td>
                        <td style="text-align: right;">LUGAR ENTREGA:</td>
                        <td id="cond_6" style="font-weight: bold;font-size: 14px;"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right;">ANOTACIONES EXTRAS:</td>
                        <td colspan="5" id="cond_7" style="font-weight: bold;font-size: 14px;border: solid 1px #888;padding: 5px;"></td>
                    </tr>
                </table>

                <div style="float: left;width: 100%;height:20px;"></div>

                <table border="0" style="width: 100%;">
                    <tr>
                        <td style="text-align: center;">ELABORÓ:</td>
                        <td style="text-align: center;">SOLICITÓ:</td>
                        <td style="text-align: center;">AUTORIZÓ:</td>
                    </tr>
                    <tr>
                        <td style="text-align: center;"><img id="firma1" src="images/firma0.png" alt=""></td>
                        <td style="text-align: center;"><img id="firma2" src="images/firma0.png" alt=""></td>
                        <td style="text-align: center;"><img id="firma3" src="images/firma0.png" alt=""></td>
                    </tr>
                </table>
            </div>
            <!--FORMATO ORDEN DE COMPRA-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_ordenes_tabla("listado_ordenes");
            }
            );
            //==================================================================
            $("#imprimir").on("click", function () {
                window.print();
            });
            //==================================================================
            $("#folio").on("change", function () {
                select_datos_proveedor_orden($("#folio").val());
                select_cuerpo_orden($("#folio").val(), 'cot_cuerpo_orden');
                select_importes_orden($("#folio").val());
            });
            //==================================================================
            $("#formato_orden").on("contextmenu", function () {
                $("#todo").show();
                $("#encabezado").show();
                $("#formato_orden").hide();
                return false;
            });
            //==================================================================
            $(".update_orden_autorizar").live("click", function () {
                update_orden_compra($(this).closest("tr").attr("id"), $('#usuario_sistema', parent.document).val(), 1);
            });
            //==================================================================
            $(".select_orden").live("click", function () {
                $("#todo").hide();
                $("#encabezado").hide();
                $("#formato_orden").show();

                $("#folio").val($(this).closest('tr').attr('id'));
                select_datos_proveedor_orden($("#folio").val());
                select_cuerpo_orden($("#folio").val(), 'cot_cuerpo_orden');
                select_importes_orden($("#folio").val());
                select_datos_fiscales_oc('cot_datosfiscales', $("#folio").val());
            });
            //==================================================================
            $(".update_orden_delete").live("click", function () {
                var _orden = $(this).closest("tr").attr("id");
                var confirma = confirm("ESTO CANCELARA LA ORDEN " + _orden + ", PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    update_orden_compra(_orden, $('#usuario_sistema', parent.document).val(), 2);
                }
            });
            //==================================================================
            $(".input_factura").live("change", function () {
                var _factura = $(this).val();
                var _id_oc = $(this).closest("tr").attr("id");
                update_factura_orden(_id_oc, _factura);
            });
            //==================================================================
            $(".fecha_factura").live("change", function () {
                var _id_oc = $(this).closest("tr").attr("id");
                var _fecha_factura = $(this).val();
                update_fecha_factura_orden(_id_oc, _fecha_factura);
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
