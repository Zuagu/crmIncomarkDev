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

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <div style="width: 100%;">

            <!--BEGIN CONTENT-->
            <div style="text-align: center;margin:0px auto;">

                <br>
                <div style="text-align: center;width: 100%;height: 80px;">
                    <input id="cargar_asignacion" class="sombra" type="button" value="CARGAR DATOS" />
                    <img id="cargando" src='images/cargando-fb.gif' style="display: none;">
                    <div id="fin" style="border:none;background: transparent;text-align: center;display: none;">
                        <h4 id="perra_respuesta"><br>DATOS CARGADOS CON EXITO</h4>
                        <input id="paso_siguiente" type="button" style="width: 50%;" value="SIGUIENTE">
                    </div>
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
            }
            );
            //==================================================================
            $("#cargar_asignacion").click(function () {
                insert_asignacion_original("perra_respuesta");
            });
            //==================================================================
            $("#perra_respuesta").dblclick(function () {
                location.reload();
            });
            //==================================================================
            $("#paso_siguiente").click(function () {
                $("#paso4", parent.document).show();
                $("#paso3", parent.document).hide();
            }
            );
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>