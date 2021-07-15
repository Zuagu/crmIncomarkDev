<%-- 
    Document   : licencia
    Created on : 04-feb-2018, 9:27:37
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
            <div class="datagrid" style="max-width: 300px;border: none;text-align: center;">

                <img src="images/logo-clienteC.png" style="width: 86%;">

                <h2>Licencia</h2>
                <h5>Fecha de vencimiento de la licencia</h5>
                <h5 id="fecha_vencimiento" type="text" style="font-weight: bold;"></h5>

                <br>
                <h2>Usuarios</h2>
                <h5>Número de usuarios concurrentes <br>permitidos en esta licencia</h5>
                <h5 id="usuarios" value="12" type="text" style="font-weight: bold;"></h5>

                <br>
                <h6>
                    Después de la fecha de vencimiento de la licencia,
                    <br>ningún usuario pordrá loggearse al sistema.
                    <br>Deberá contactar al Administrador.
                    <br>Si tiene un código de licencia, puede introducirlo <a id="code" href="#ou">aquí</a>
                </h6>

            </div>
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_license();
            }
            );
            //==================================================================
            function select_license() {
                var params = {
                    accion: "select_license"
                };
                $.ajax({
                    type: "POST",
                    url: "/sistema/ManageConfig",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        var dato = dataRes.split("#AND#");

                        $("#fecha_vencimiento").text(dato[0]);
                        $("#usuarios").text(dato[1]);

                    }
                });
            }
            ;
            //==================================================================
            $("#code").click(function () {
                var _code = prompt("INGRESA TU CÓDIGO DE LICENCIA:", "");
                var _codelen = _code.length;

                if (_code == "") {
                    console.log("Código de licencia vacio...");
                } else if (_codelen < 28) {
                    alert("CÓDIGO NO VALIDO");
                } else {
                    alert("CODIGIO VALIDA");
                }
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->

    </body>
</html>
