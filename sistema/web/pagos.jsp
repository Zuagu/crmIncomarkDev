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

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-pagocuenta.js"></script>

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Cargar pagos
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
            <div style="width:25%;float: left;margin-left:3%;">
                <div class="datagrid sombra" style="width:100%;">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2" style="text-align: center;">BUSQUEDA DE PAGOS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="text-align: right;width: 40%;">CLIENTE:</td>
                                <td>
                                    <select id="id_cliente"></select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">REGION</td>
                                <td>
                                    <select id="id_region"></select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">ASIGNACION:</td>
                                <td>
                                    <select id="id_asignacion"></select>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">FILTRAR FECHA</td>
                                <td><input id="fecha" type="text" class="datepicker"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <a id="select_pagos" href="#">[ VER TODOS LOS PAGOS DE LA ASIGNACION SELECCIONADA ]</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br>
                <div style="text-align: center;width: 100%;">
                    <input id="cargar_pagos" class="sombra" type="button" value="CARGAR PAGOS" style="width: 50%;"/>
                    <br>

                </div>

                <br>
                <iframe id="form_cargar_pagos" name="form_cargar_pagos" src="cargar-pagos.jsp" frameborder="0" style=" width: 100%;height: 160px;display: none;"></iframe>

                <div id="paso_siguiente" class="datagrid" style="display: none;">
                    <table border="0">
                        <thead>
                            <tr>
                                <th colspan="2">ULTIMO PASO...</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="2">SELECCIONA EL RANGO DE FECHAS DE LOS PAGOS QUE HAS CARGADO.</td>
                            </tr>
                            <tr>
                                <td>DESDE: </td>
                                <td><input id="desde" type="text" class="datepicker"></td>
                            </tr>
                            <tr>
                                <td>HASTA: </td>
                                <td><input id="hasta" type="text" class="datepicker"></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                    <input id="insert_pagos" type="button" value="FINALIZAR" style="width: 50%;">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="cargando" style="display: none;">
                    <div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>
                </div>

            </div>

            <div id="div_pagos" class="datagrid sombra" style="width:68%;float: right;margin-right: 3%;height: 480px;overflow: auto;"></div>

        </div>
        <!--END CONTENT-->

        <!--END PAGE WRAPPER-->

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                fecha_hoy("fecha");
                select_clientes_combo("id_cliente");
            }
            );
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region", true);
            });
            //==================================================================
            $("#id_region").change(function () {
                select_asignacion_region_combo($("#id_region").val(), 1, "id_asignacion");
            });
            //==================================================================
            $("#id_asignacion").change(function () {
                select_pagos_asignacion_tabla($("#id_asignacion").val(), "div_pagos");
                $("#form_cargar_pagos").attr("src", "cargar-pagos.jsp");
            });
            //==================================================================
            $("#select_pagos").click(function () {
                if ($("#id_asignacion").val() != null) {
                    select_pagos_asignacion_tabla($("#id_asignacion").val(), "div_pagos");
                }
            });
            //==================================================================
            $("#cargar_pagos").click(function () {
                $(this).hide();
                $("#form_cargar_pagos").show();
            });
            //==================================================================

            $("#fecha").change(function () {
                select_pagos_asignacion_tabla_fecha($("#id_asignacion").val(), $("#fecha").val(), "div_pagos");
            });
            //==================================================================
            $("#insert_pagos").click(function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    if ($("#id_asignacion").val() == 0) {
                        alert("SELECCIONE UNA ASIGNACION");
                    } else {
                        insert_pagos_asignacion(
                                $('#usuario_sistema', parent.document).val(),
                                $("#id_cliente").val(),
                                $("#id_region").val(),
                                $("#id_asignacion").val(),
                                $("#desde").val(),
                                $("#hasta").val(),
                                "paso_siguiente"
                                );
                    }
                }
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>