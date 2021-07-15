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

        <div class="contenedor-responsive">

            <!--BEGIN CONTENT-->
            <div style="padding: 20px 40px;color: #9CB8C3;text-align: center;">
                <h4>
                    Con esta herramienta, podrás reasignar las cuentas a distintos equipos.<br>
                    Tu archivo .CSV, debe contener como encabezados:<br>
                    * CUENTA<br>
                    * ID EQUIPO (NUEVO)
                </h4>
                <img src="images/e_joy-128.png" alt="" style="width: 32px;"><br>
            </div>

            <form action="subir-reasignacion.jsp" enctype="multipart/form-data" method="post" style="margin: 0px auto;width: 100%;text-align: center;">
                <input type="file" class="sombra" name="file" style="margin: 0px auto;background: #F0FFFF;border: solid 1px #DADADA;padding: 12px;"/><br/>
                <input class="sombra" type="submit" value="CARGAR ARCHIVO" style="width: 50%;max-width: 200px;"/>
            </form>
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
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>