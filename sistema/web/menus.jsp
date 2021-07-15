<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERP</title>
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />


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

        <!--ARCADE CSS-->
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">
        <!--ARCADE CSS-->

        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-puesto.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png');">

        <div class="contenedor-responsive">

            <br>
            <div id="listado_puestos" class="datagrid sombra" style="width: 29%;float: left;margin-left:3%;text-align: center;height: 500px;overflow: auto;"></div>

            <div class="datagrid sombra" style="width: 64%;float: right;margin-right:3%;text-align: center;height: 500px;">
                <input id="id_puesto" type="hidden" value="">
                <textarea id="html_menu" style="width:100%;height: 100%;border: none;resize: none;padding: 10px;"></textarea>
            </div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_puesto_tabla("listado_puestos");
            }
            );
            //==================================================================
            $(".select_menu_puesto").live("click", function () {
                var _id_puesto = $(this).closest("tr").attr("id");
                select_menu_puesto(_id_puesto, "html_menu");
                $("#id_puesto").val(_id_puesto);
            });
            //==================================================================
            $("#html_menu").live("change", function () {
                update_menu_puesto($("#id_puesto").val(), $("#html_menu").val());
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
