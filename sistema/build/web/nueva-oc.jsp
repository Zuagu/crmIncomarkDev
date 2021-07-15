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

        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>

        <!--ARCADE JS-->
        
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-proveedores.js"></script>
        <script type="text/javascript" src="js/arcade-productos.js"></script>
        <script type="text/javascript" src="js/arcade-metodospago.js"></script>
        <script type="text/javascript" src="js/arcade-nuevaordendecompra.js"></script>
        <script type="text/javascript" src="js/arcade-ordenesdecompra.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>

            <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div id="encabezado" class="page-title-breadcrumb option-demo">
                <div class="page-header pull-right">
                    <div class="page-title">
                        Nueva Orden de Compra
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
            <div id="todo" class="datagrid" style="border: none;padding: 1%;">

                <div style="float: left; width: 100%;">



                    <div style="float: left; width: 70%;" class="datagrid sombra">
                        <table>
                            <tr>
                                <td style="font-size: 16px;">PROVEEDOR:</td>
                                <td colspan="3">
                                    <select style="height:30px;font-size:26px;width: 98%;" id="id_proveedor">
                                        <option value="-1">SELECCIONE...</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;">REQUISICION:</td>
                                <td>
                                    <input id="id_requisicion" type="text" value="0" style="color: red;font-size: 20px;width: 150px;text-align: center;">
                                </td>
                                <td style="font-size: 14px;">SELECCIONE EMPRESA:</td>
                                <td>
                                    <select id="id_empresa" style="font-size:16px;">
                                        <option value="1">FRANCISCO RENE MEDINA GARZA</option>
                                        <option value="2">MEGAPARTS, S. A. DE C. V.</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="datagrid sombra" style="float: right; width: 22%;">
                        <table>
                            <tr><td>SUBTOTAL:</td><td><input id="subtotal" type="text" value="0.00" class="flotante" style="height:30px;font-size:26px;text-align: right;border: none;background-color: transparent;"></td></tr>
                            <tr><td>I. V. A.:</td><td><input id="iva" type="text" value="0.00" class="flotante" style="height:30px;font-size:26px;text-align: right;border: none;background-color: transparent;"></td></tr>
                            <tr><td>TOTAL:</td><td><input id="total" type="text" value="0.00" class="flotante" style="height:30px;font-size:26px;text-align: right;border: none;background-color: transparent;"></td></tr>
                        </table>
                    </div>
                </div>                

                <div style="float: left; width: 100%;" class="datagrid sombra">
                    <table>
                        <tr>
                            <td style="width: 1%">x</td>
                            <td style="width: 6%"><input id="cantidad" type="text" class="flotante" value="1" style="text-align: center;font-size: 26px;"></td>
                            <td style="width: 8%;text-align: center;">CODIGO</td>
                            <td style="width: 10%"><input id="codigo" type="text" style="text-align: center;font-size: 26px;"></td>
                            <td style="width: 34%"><select id="id_categoria" style="height: 30px;font-size: 26px;"><option>SELECCIONE...</option></select></td>
                            <td style="width: 36%"><select id="id_producto" style="height: 30px;font-size: 26px;"><option>SELECCIONE...</option></select></td>
                            <td style="width: 5%"><input id="agregar_producto_orden" type="button" value="+" style="height: 30px;font-size: 26px;"></td>
                        </tr>

                    </table>
                </div>

                <div style="float: left; width: 100%;height: 206px; overflow: auto;" class="datagrid sombra">
                    <table>
                        <thead>
                            <tr>
                                <th style="text-align: center;width: 2%;" class="lv">LV</th>
                                <th style="text-align: center;">CANT.</th>
                                <th style="text-align: center;">UNIDAD</th>
                                <th style="text-align: center;">CODIGO</th>
                                <th style="text-align: center;">DESCRIPCION</th>
                                <th style="text-align: center;">UNITARIO</th>
                                <th style="text-align: center;">IMPORTE</th>
                                <th style="text-align: center;"></th>
                            </tr>
                        </thead>
                        <tbody id="cuerpo_orden"></tbody>
                    </table>
                </div>

                <div style="float: right; width: 100%;">
                    <div class="datagrid sombra" style="float: right; width: 40%;">
                        <table>
                            <tr><td style="width: 35%;text-align: right;">FORMA DE PAGO:</td>
                                <td style="width: 65%;">
                                    <select id="id_formapago" type="text" value="0.00" class="flotante" style=";text-align: left;">
                                        <option value="1">PAGO EN UNA SOLA EXHIBICIÓN</option>
                                        <option value="2">PAGO EN PARCIALIDADES</option>
                                    </select>
                                </td></tr>
                            <tr id="tr_numero_parcialidades" style="display: none;">
                                <td style="text-align: right;">NUMERO DE PARCIALIDADES:</td>
                                <td><input id="numero_parcialidades" type="text" value="1" class="flotante" placeholder="Ej. 15" style=";text-align: left;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">METODO DE PAGO:</td>
                                <td><select id="id_metodopago" type="text" value="0.00" class="flotante" style=";text-align: left;"></select></td>
                            </tr>
                            <tr id="tr_cuenta_pago" style="display: none;">
                                <td style="text-align: right;">CUENTA DE PAGO:</td>
                                <td><input id="cuenta_pago" type="text" placeholder="Ej. 1234" value="0" class="flotante" style=";text-align: left;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">CONDICIONES DE PAGO:</td>
                                <td>
                                    <select id="id_condicionespago" type="text" value="0.00" class="flotante" style=";text-align: left;">
                                        <option value="1">CONTADO</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">DIAS DE CREDITO:</td>
                                <td><input id="dias_credito" type="text" value="0" class="flotante" placeholder="Ej. 15" style=";text-align: left;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">ENTREGA:</td>
                                <td style="text-align: left;">
                                    <select id="lugar_entrega" type="text" value="0.00" class="flotante" style=";">
                                        <option value="1">LAB EN PLANTA METALOSTUDIO</option>
                                        <option value="2">LAB PLANTA DEL CLIENTE</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">COMENTARIOS EXTRAS:</td>
                                <td><textarea id="comentarios" maxlength="1200" style="width: 96%;resize: none;"></textarea></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div style="float: right; width: 20%; text-align: right;">
                    <button id="insert_orden" style="float: right;background-color: #D51717;border: none;color: white;font-weight: bold;font-family: verdana;" class="sombra">FINALIZAR ORDEN DE COMPRA</button>
                </div>
            </div>
            <!--END OF TODO -->

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
                                <br><span id="cot_fecha" style="font-size: 12px;color: #888;"></span></td>
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
                </table>
            </div>
            <!--FORMATO ORDEN DE COMPRA-->
            <!--END CONTENT-->


            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_proveedores_combo("id_proveedor");
                select_categorias_combo("id_categoria");
                select_metodos_combo("id_metodopago");
                $("#codigo").focus();
                $("#subtotal").val('0.00');
                $("#iva").val('0.00');
                $("#total").val('0.00');
                select_datos_fiscales('cot_datosfiscales');
            }
            );
            //==================================================================
            $("#id_categoria").on("change", function () {
                select_productos_categoria_combo($("#id_categoria").val(), "id_producto");
            });
            //==================================================================
            $("#agregar_producto_orden").on("click", function () {
                agregar_producto_orden($("#cantidad").val(), $("#id_producto").val());
            });
            //==================================================================
            $("#id_formapago").on("change", function () {
                if ($("#id_formapago").val() == '2') {
                    $("#tr_numero_parcialidades").show('fast');
                } else {
                    $("#tr_numero_parcialidades").hide('fast');
                    $("#numero_parcialidades").val(1);
                }
            });
            //==================================================================
            $("#id_metodopago").on("change", function () {
                if ($("#id_metodopago").val() != '01') {
                    $("#tr_cuenta_pago").show('fast');
                } else {
                    $("#tr_cuenta_pago").hide('fast');
                }
            });
            //==================================================================
            $(".precio").live("change", function () {
                var _cantidad;
                var _precio;
                var _importe;

                _cantidad = $(this).closest('tr').find('input.cantidad').val();
                _precio = parseFloat($(this).closest('tr').find('input.precio').val());
                _importe = _cantidad * _precio;

                _precio = _precio.toFixed(2);
                _importe = _importe.toFixed(2);

                $(this).closest('tr').find('input.precio').val(_precio);
                $(this).closest('tr').find('input.importe').val(_importe);
                actualizar_importe_venta();
            });
            //==================================================================
            $(document).keyup(function (e) {
                if (e.keyCode == 106) {
                    $("#codigo").val('');
                    $("#cantidad").val('');
                    $("#cantidad").focus();
                }
            });
            //==================================================================
            $(document).keyup(function (e) {
                if (e.keyCode == 111) {
                    $("#codigo").focus();
                }
            });
            //==================================================================
            $("#cantidad").keyup(function (e) {
                if (e.keyCode == 106) {
                    $("#cantidad").val('');
                    $("#cantidad").focus();
                }
            });
            //==================================================================
            $("#cantidad").keyup(function (e) {
                if (e.keyCode == 13) {
                    $("#codigo").focus();
                }
            });
            //==================================================================
            $("#codigo").keyup(function (e) {
                if (e.keyCode == 13) {
                    if ($("#codigo").val() == '') {
                        agregar_producto_orden($("#cantidad").val(), $("#id_producto").val());
                    } else {
                        agregar_producto_orden($("#cantidad").val(), $("#codigo").val());
                    }
                    $("#codigo").val('');
                    $("#cantidad").val('1');
                }
            });
            //==================================================================
            $(".eliminar_linea_orden").live("click", function () {
                $(this).closest("tr").remove();
                $("#cantidad").val('1');
                var lv = 0;
                $('#cuerpo_orden  > tr').each(function () {
                    $(this).closest('tr').find('.lv').text(lv + 1);
                    lv++;
                });
                actualizar_importe_venta();
            });
            //==================================================================
            $("#insert_orden").on("click", function () {

                var lineas_orden = '';
                $('#cuerpo_orden tr input.prod').each(function () {
                    lineas_orden = lineas_orden + $(this).val();
                });

                insert_orden(
                        $('#usuario_sistema', parent.document).val(),
                        $("#id_proveedor").val(),
                        $("#id_requisicion").val(),
                        $("#id_empresa").val(),
                        $("#subtotal").val(),
                        $("#iva").val(),
                        $("#total").val(),
                        $("#id_formapago").val(),
                        $("#numero_parcialidades").val(),
                        $("#id_metodopago").val(),
                        $("#cuenta_pago").val(),
                        $("#id_condicionespago").val(),
                        $("#dias_credito").val(),
                        $("#lugar_entrega").val(),
                        $("#comentarios").val(),
                        lineas_orden
                        );
            });
            //==================================================================
            $("#imprimir").on("click", function () {
                window.print();
                location.href = 'ordenes-de-compra.jsp';
            });
            //==================================================================
            $("#folio").on("change", function () {
                select_datos_proveedor_orden($("#folio").val());
                select_cuerpo_orden($("#folio").val(), 'cot_cuerpo_orden');
                select_importes_orden($("#folio").val());
            });
            //==================================================================
            $("#id_requisicion").on("change", function () {
                select_cuerpo_orden_requisicion($("#id_requisicion").val(), 'cuerpo_orden');
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
