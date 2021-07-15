<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>

        <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="styles/main.css">
        <link type="text/css" rel="stylesheet" href="styles/all.css">
        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">

        <!-- INICIA CALENDARIO ARCADE -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>        
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>
        <script>
            $(function () {
                $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 1});
            });
        </script>
        <!-- INICIA CALENDARIO ARCADE -->

        <!--ARCADE CSS-->
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">
        <!--ARCADE CSS-->

        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-sucursal.js"></script>
        <script type="text/javascript" src="js/arcade-puesto.js"></script>
        <script type="text/javascript" src="js/arcade-clientes.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-asignacionoriginal.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
    </head>
    <body style="background-image: url('images/background-cliente.png');">

        <div class="contenedor-responsive">

            <!--BEGIN CONTENT-->
            <br>
            <div style="width: 80%;margin: 0px auto;">
                <table style="margin: 0px auto;">
                    <thead>
                        <tr>
                            <th style="text-align: center;">
                                <h4>ALTA DE ASIGNACION</h4>
                            </th>
                        </tr>
                    </thead>
                </table>
            </div>

            <br>
            <div style="width: 98%;margin: 0px auto;max-width: 320px;">
                <div id="paso1" class="paso datagrid sombra" style="text-align: center;margin: 0px auto;max-width: 520px;">
                    <table style="width: 100%;border-spacing: 7px;">
                        <thead><tr><th colspan="2" style="text-align: center;">PASO 1: DATOS DE LA NUEVA ASIGNACION</th></tr></thead>
                        <tbody>
                            <tr>
                                <td>NOMBRE <b>*</b></td>
                                <td><input id="asignacion" class="dato" type="text" style='width:100%;'></td>
                            </tr>
                            <tr>
                                <td>SUCURSAL</td>
                                <td>
                                    <select id="id_sucursal" style='width:100%;'></select>
                                </td>
                            </tr>
                            <tr>
                                <td>CLIENTE</td>
                                <td>
                                    <select id="id_cliente" style='width:100%;'></select>
                                </td>
                            </tr>
                            <tr>
                                <td>REGION</td>
                                <td>
                                    <select id="id_region" style='width:100%;'></select>
                                </td>
                            </tr>
                            <tr>
                                <td>FECHA ASIGNACION:</td>
                                <td><input id="fecha_inicio" type="text" class="datepicker dato" style='width:100%;'></td>
                            </tr>
                            <tr>
                                <td>FECHA DEVOLUCION:</td>
                                <td><input id="fecha_fin" type="text" class="datepicker dato" style='width:100%;'></td>
                            </tr>
                            <tr>
                                <td>DIAS ANTICIPADOS:</td>
                                <td><input id="dias_anticipados" type="text" value="0" class="dato entero" style='width:100%;'></td>
                            </tr>
                            <tr>
                                <td>META RECUPERACION:</td>
                                <td><input id="meta" type="text" value="00.00" class="dato flotante" style='width:100%;'></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;padding: 10px 0px;">
                                    <input class="siguiente" type="button" value="SIGUIENTE" style='width:50%;'>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="paso2" class="paso" style="display: none;height: 300px;">
                    Paso 2...
                    <iframe id="form_cargar_pagos" src="cargar-asignacion.jsp" frameborder="0" style=" width: 100%;height: 300px;"></iframe>
                </div>

                <div id="paso3" class="paso" style="display: none;height: 300px;">
                    Paso 3...
                    <iframe id="form_cargar_pagos" src="cargar-datos.jsp" frameborder="0" style=" width: 100%;height: 300px;"></iframe>
                </div>

                <div id="paso4" class="paso" style="display: none;">
                    Ultimo paso...
                    <input id="insert_asignacion" name="accion" class="sombra" type="button" value="FINALIZAR" />
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
                select_sucursal_combo("id_sucursal", false);
                select_clientes_combo("id_cliente", false);
            }
            );
            //==================================================================

            $("#insert_asignacion").click(
                    function () {
                        insert_asignacion(
                                $('#usuario_sistema', parent.document).val(),
                                $("#asignacion").val(),
                                $("#id_sucursal").val(),
                                $("#id_cliente").val(),
                                $("#id_region").val(),
                                $("#fecha_inicio").val(),
                                $("#fecha_fin").val(),
                                $("#dias_anticipados").val(),
                                $("#meta").val()
                                );
                    }
            );
            //==================================================================
            $("#id_cliente").on("change", function () {
                select_region_combo($("#id_cliente").val(), "id_region");
            });
            //==================================================================
            $(".dato").on("blur", function () {
                if ($(this).val() == "") {
                    $(this).val("-");
                }
            });
            //==================================================================
            $(".siguiente").click(function () {
                var _paso = $(this).closest("div").attr("id");
                _paso = _paso.replace("paso", "");
                $(".paso").hide();
                _paso = parseInt(_paso) + 1;
                $("#paso" + _paso).show();
            }
            );
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>