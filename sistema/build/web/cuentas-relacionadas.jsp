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
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-crs.js"></script>

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Carga de cuentas relacionadas
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
            <div style="width:20%;float: left;margin-left:3%;">
                <div class="datagrid sombra" style="width:100%;">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2" style="text-align: center;">BUSQUEDA DE PAGOS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="text-align: right;">CLIENTE:</td>
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
                        </tbody>
                    </table>
                </div>

                <br>
                <div style="text-align: center;width: 100%;">
                    <input id="insert_cr" class="sombra" type="button" value="CARGAR CR's"  style="width: 60%;min-width: 100px;"/>
                </div>

                <br>
                <iframe id="form_cargar_crs" src="cargar-crs.jsp" frameborder="0" style=" width: 100%;height: 170px;display: none;"></iframe>

                <br>
                <div id="finalizar" style=" width: 100%;height: 100px;display: none;">
                    <input id="actualizar" class="sombra" type="button" value="FINALIZAR"  style="width: 60%;min-width: 100px;"/>
                </div>

                <br>
                <div id="aviso" class="warning" style="display: none;">
                    Puedes volver a cargar las cuentas relacionadas de la misma asignacion.
                    El sistema eliminará las cuentas ya registrados y cargará todas las
                    cuentas del archivo nuevo.

                    <br>
                    * Las columnas que debe de tener el archivo CSV son:<br>
                    CUENTA, NUMERO, STATUS, FECHA, RFC, NOMBRE

                </div>

            </div>

            <div style="width:73%;float: right;margin-right: 3%;height: 400px;overflow: auto;">
                <div id="div_cr" class="datagrid sombra" style="width:100%;height: 340px;overflow: auto;"></div>
                <br>
                <!--tabla_crs-->
                <input onclick="tableToExcel('tabla_crs', 'CUENTAS RELACIONADAS')" type="button" value="EXPORTAR A EXCEL" style="float: right;width: 160px;background: #027A02;">
            </div>


        </div>
        <!--END CONTENT-->

        <!--END PAGE WRAPPER-->

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_clientes_combo("id_cliente");
            }
            );
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region");
            });
            //==================================================================
            $("#id_region").change(function () {
                select_asignacion_region_combo($("#id_region").val(), 2, "id_asignacion");
            });
            //==================================================================
            $("#id_asignacion").change(function () {
                select_cr_tabla($("#id_asignacion").val(), "div_cr");
            });
            //==================================================================
            $("#select_cr").click(function () {
                if ($("#id_asignacion").val() != null) {
                    select_cr_asignacion_tabla($("#id_asignacion").val(), "div_cr");
                }
            });
            //==================================================================
            $("#insert_cr").click(function () {
                $("#form_cargar_crs").show();
                $(".warning").show();
            });
            //==================================================================
            $("#actualizar").click(function () {
                select_cr_tabla($("#id_asignacion").val(), "div_cr");
                $("#aviso").hide();
                $("#actualizar").hide();
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>