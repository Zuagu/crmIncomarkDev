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

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
    </head>
    <body>

        <div class="contenedor-responsive" style="width: 94%;max-width: 320px;text-align: center;">
            
            <!--BEGIN CONTENT-->
            
            <h2>Regiones Clientes</h2>
            <h5>Captura las distintas regiones que operas para tu cliente (Ejem. Monterrey, Guadalajara)</h5>
            
            <div class="datagrid sombra">
                <table>
                    <thead>
                        <tr>
                            <th colspan="2" style="text-align: center;">CLIENTE</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>
                            <select id="id_cliente"></select>
                        </td>
                    </tr>
                </table>
            </div>

            <br>
            <div id="listado_region" class="datagrid sombra" style="max-width: 320px;"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_clientes_combo("id_cliente", true);
            }
            );
            //==================================================================
            $("#insert_region").live("click", function () {
                insert_region(
                        $("#region_insert").val(),
                        $("#id_cliente").val(),
                        "listado_region"
                        );
            });
            //==================================================================
            $(".delete_region").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_region($(this).closest("tr").attr("id"), $("#id_cliente").val(), "listado_region");
                }
            });
            //==================================================================
            $("#id_cliente").live("change", function () {
                select_region_tabla($("#id_cliente").val(), "listado_region");
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>