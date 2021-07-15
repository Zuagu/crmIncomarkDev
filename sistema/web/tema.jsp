<%-- 
    Document   : tema
    Created on : 04-feb-2018, 9:27:11
    Author     : luiscortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    </head>
    <body>
        <div class="contenedor-responsive">
            <br>
            <div class="datagrid" style="max-width: 320px;border: none;text-align: center;">

                <h1>Configuración tema</h1>

                <br>

                <table style="border: solid 1px #f0f0f0;border-radius: 10px;" class="sombra">
                    <tr>
                        <td>
                            Color "Franja-Index"</td><td><input id="1" type="text" style="text-align: center;width: 80%;text-transform: uppercase;">
                            <input id="aux1" type="color" style="vertical-align: middle;width: 10%;min-width: 30px;padding: 0px;border: none;">
                        </td>
                    </tr>
                    <tr><td>Texto barra superior</td><td><input id="2" type="text" style="text-align: center;font-size: 1.6rem;"></td></tr>
                    <tr>
                        <td>Color sarra superior</td><td><input id="3" type="text" style="text-align: center;width: 80%;text-transform: uppercase;">
                            <input id="aux3" type="color" style="vertical-align: middle;width: 10%;min-width: 30px;padding: 0px;border: none;">
                        </td>
                    </tr>
                    <tr>
                        <td>Color menú</td><td><input id="4" type="text" style="text-align: center;margin: 0px auto;width: 80%;text-transform: uppercase;">
                            <input id="aux4" type="color" style="vertical-align: middle;width: 10%;min-width: 30px;padding: 0px;border: none;">
                        </td>
                    </tr>
                </table>

                <br>
                <input id="actualizar_tema" type="button" value="Guardar cambios y actualizar">

            </div>
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_config();
            }
            );
            //==================================================================
            $("#aux1").change(function () {
                $("#1").val($(this).val());
            });
            //==================================================================
            $("#aux3").change(function () {
                $("#3").val($(this).val());
            });
            //==================================================================
            $("#aux4").change(function () {
                $("#4").val($(this).val());
            });
            //==================================================================
            $("#1").change(function () {
                $("#aux1").val($(this).val());
            });
            //==================================================================
            $("#3").change(function () {
                $("#aux3").val($(this).val());
            });
            //==================================================================
            $("#4").change(function () {
                $("#aux4").val($(this).val());
            });
            //==================================================================
            $("#actualizar_tema").click(function () {
                update_config(
                        $("#1").val(),
                        $("#2").val(),
                        $("#3").val(),
                        $("#4").val()
                        );
            });
            //==================================================================
            function select_config() {
                var params = {
                    accion: "select_config"
                };
                $.ajax({
                    type: "POST",
                    url: "/sistema/ManageConfig",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        var dato = dataRes.split("#AND#");
                        var dato2 = dato[0].split("background: ");

                        $("#1").val(dato2[1]);
                        $("#2").val(dato[1]);
                        $("#3").val(dato[2]);
                        $("#4").val(dato[3]);
                        
                        $("#aux1").val($("#1").val());
                        $("#aux3").val($("#3").val());
                        $("#aux4").val($("#4").val());
                    }
                });
            }
            ;
            //==================================================================
            function update_config(_v1, _v2, _v3, _v4) {

                var params = {
                    accion: "update_config",
                    franja_index: _v1,
                    nombre_cliente: _v2,
                    color: _v3,
                    color_menu: _v4
                };
                $.ajax({
                    type: "POST",
                    url: "/sistema/ManageConfig",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        console.log(dataRes);
//                        top.frames['centro'].location.href = 'inicio.jsp';
                        parent.location.href = 'index.jsp';
                    }
                });
            }
            ;
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->

    </body>
</html>
