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
        <script type="text/javascript" src="js/arcade-pem.js"></script>
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
                        Consulta de Proveedores
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
            <div id="todo" style="width: 94%;margin: 1% auto;">

                <div>
                    <div style="float: right;">
                        <h3 style="float: right;"></h3>
                        <br>
                        <h5 style="float: right;"><a id="img_insert_proveedor" href="#">Agregar nuevo</a></h5>
                    </div>

                    <div id="div_filtro" class="datagrid" style="width: 500px;float: left;padding: 2px;">
                        <input id="filtro" style="width: 100%;padding: 5px;border: solid 0px grey;" class="alfanumerico" maxlength="45">
                    </div>
                </div>

                <div style="width: 100%;float: left;">
                    <div class="datagrid sombra" id="listado_proveedores" style="height: 600px;overflow: auto;width: 100%;"></div>
                    <div class="datagrid sombra" id="div_insert_proveedor" style="height: 470px;overflow: auto;width: 520px;display:none;border:none;">
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="2" style="text-align: center;">AGREGAR NUEVO PROVEEDOR</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>RAZON SOCIAL</td>
                                    <td><input id="razon_social" class="alfanumerico" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>R. F. C.</td>
                                    <td><input id="rfc" class="alfanumerico" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>CODIGO POSTAL:</td>
                                    <td><input id="codigo_postal" class="entero" type="text" placeholder="" maxlength="6"></td>
                                </tr>
                                <tr>
                                    <td>COLONIA:</td>
                                    <td><input id="colonia" class="alfanumerico" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>CALLE:</td>
                                    <td><input id="calle" class="alfanumerico" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>NUMERO EXTERIOR:</td>
                                    <td><input id="num_ext" class="alfanumerico" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>NUMERO INTERIOR:</td>
                                    <td><input id="num_int" value=" " class="alfanumerico" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>PAIS:</td>
                                    <td>
                                        <select id="id_pais" type="text" placeholder="">
                                            <option value="0">SELECCIONE...</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ESTADO:</td>
                                    <td>
                                        <select id="id_estado" type="text" placeholder="">
                                            <option value="0">SELECCIONE...</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>MUNICIPIO:</td>
                                    <td>
                                        <select id='id_municipio' type="text" placeholder="">
                                            <option value="0">SELECCIONE...</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>TELEFONOS:</td>
                                    <td><input id="telefonos" class="alfanumerico" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>EMAIL:</td>
                                    <td><input id="email" type="text" placeholder=""></td>
                                </tr>
                                <tr>
                                    <td>COMENTARIOS:</td>
                                    <td><textarea id="comentarios" class="alfanumerico" type="text" style="width: 96%;resize: none;" placeholder="" maxlength="1200"> </textarea></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;padding: 22px;">
                                        <button id="insert_proveedor" style="background-color: #3A6F9F;border: none;color: white;font-weight: bold;font-family: verdana;" class="sombra">AGREGAR PROVEEDOR</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--END CONTENT-->

            </div>
            <!--FORMATO ESTADO DE CUENTA-->
            <div id="formato_edc" style="width:1080px;max-width: 1080px; margin: 2px;border: none;float: left;padding: 20px 50px;box-shadow: 2px 2px 5px #444;display: none;">

                <div id="encabezado_edc" style="float: left;width: 100%;">

                    <table border="0" style="width: 100%;">
                        <tr>
                            <td><img id="imprimir" src="images/logo-cliente.png" style="float:left;"></td>
                            <td></td>
                            <td></td>
                            <td style="font-weight: bold;font-size: 20px;text-align: right;">
                                ESTADO DE CUENTA DE PROVEEDOR
                                <br><input id="folio" type="text" style="float: right;text-align: right;color: red;border: none;">
                            </td>
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
                            <td id="p_razon_social" style="font-weight: bold;font-size: 14px;"></td>
                            <td style="text-align: right;">RFC:</td>
                            <td id="p_rfc" style="font-weight: bold;font-size: 14px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">DIRECCION:</td>
                            <td colspan="3" id="p_direccion" style="font-weight: bold;font-size: 14px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">EMAIL:</td>
                            <td id="p_telefonos" style="font-weight: bold;font-size: 14px;"></td>
                            <td style="text-align: right;">TELEFONOS:</td>
                            <td id="p_contacto" style="font-weight: bold;font-size: 14px;"></td>
                        </tr>
                    </table>

                    <br>
                    <div id="cuerpo_edc" class="datagrid" style="width: 100%;"></div>

                    <div style="float: left;width: 100%;height:2px;"></div>

                    <div class="datagrid" style="width: 30%; float: right;margin-top: 10px;">
                        <table border="1" style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td style="text-align: right;">TOTAL CARGOS:</td>
                                    <td style="text-align: right;" id="edc_cargos"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">TOTAL ABONOS:</td>
                                    <td style="text-align: right;" id="edc_abonos"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">SALDO DOCUMENTO:</td>
                                    <td style="text-align: right;font-weight: bold;" id="edc_saldo"></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                </div>
            </div>
            <!--FORMATO ESTADO DE CUENTA-->

            <!--END PAGE WRAPPER-->

            <!--CORE JAVASCRIPT-->
            <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_proveedores_tabla('listado_proveedores');
                select_paises_combo('id_pais');
                $("#filtro").val('');
            }
            );
            //==================================================================
            $("#id_pais").on("change", function () {
                select_estados_pais_combo($("#id_pais").val(), 'id_estado');
            });
            //==================================================================
            $("#id_estado").on("change", function () {
                select_municipios_estado_combo($("#id_estado").val(), 'id_municipio');
            });
            //==================================================================
            $("#insert_proveedor").on("click", function () {
                insert_proveedor($("#razon_social").val(), $("#rfc").val(), $("#codigo_postal").val(), $("#colonia").val(), $("#calle").val(), $("#num_ext").val(), $("#num_int").val(), $("#id_pais").val(), $("#id_estado").val(), $("#id_municipio").val(), $("#telefonos").val(), $("#email").val(), $("#comentarios").val());
            });
            //==================================================================
            $("#filtro").on("keyup", function () {
                select_proveedores_filtro($("#filtro").val(), 'listado_proveedores');
            });
            //==================================================================
            $(".update_proveedor").live("click", function () {

                var params = [];
                var i = 0;

                $('#' + $(this).closest('tr').attr('id') + ' td input').each(function () {
                    params[i] = $(this).val();
                    i++;
                });

                update_proveedor(params);
            });
            //==================================================================
            $(".deuda_proveedor").live("click", function () {
                var _id_proveedor = $(this).closest("tr").attr("id");
                select_datos_proveedor(_id_proveedor);
                cuerpo_estado_de_cuenta_deudaactual(_id_proveedor, 'cuerpo_edc');
                select_importes_edc_deudaactual(_id_proveedor);

                $("#formato_edc").show('fast');

                $("#encabezado").hide();
                $('#todo').hide();
            });
            //==================================================================
            $(".archivo_proveedor").live("click", function () {
                var _id_proveedor = $(this).closest("tr").attr("id");
                select_datos_proveedor(_id_proveedor);
                cuerpo_estado_de_cuenta(_id_proveedor, 'cuerpo_edc');
                select_importes_edc(_id_proveedor);

                $("#formato_edc").show('fast');

                $("#encabezado").hide();
                $('#todo').hide();

            });
            //==================================================================
            $(".delete_proveedor").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_proveedor($(this).closest('tr').attr('id'), $('#usuario_sistema', parent.document).val());
                }
            });
            //==================================================================
            $("#img_insert_proveedor").live("click", function () {

                if ($('#div_insert_proveedor').is(':hidden')) {
                    $('#div_insert_proveedor').show("fast");
                    $('#div_filtro').hide("fast");
                    $("#listado_proveedores").hide("fast");
                    $("#div_archivo_proveedor").hide();
                } else {
                    $("#listado_proveedores").show("fast");
                    $('#div_filtro').show("fast");
                    $('#div_insert_proveedor').hide("fast");
                    $("#div_archivo_proveedor").hide();
                }
            });
            //==================================================================
            $("#formato_edc").live("contextmenu", function () {
                $("#formato_edc").hide();
                $("#encabezado").show();
                $("#todo").show();
                return false;
            });
            //==================================================================
            $("#imprimir").live("click", function () {
                window.print();
                $("#formato_edc").hide();
                $("#encabezado").show();
                $("#todo").show();
            });
            //==================================================================
            // ARCADE Software®
            </script>
            <!--CORE JAVASCRIPT-->
    </body>
</html>
