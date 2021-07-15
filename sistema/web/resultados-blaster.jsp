<%-- 
    Document   : resultados-blaster
    Created on : 13-feb-2018, 18:47:23
    Author     : luiscortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados Blaster ::</title>
        <!--FAVICON AND IPHONE ICONS-->
        <link rel="shortcut icon" href="images/arcade-favicon.ico">

        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="http://leimihost.com/favicons/arcade/arcade-57.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://leimihost.com/favicons/arcade/arcade-114.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="http://leimihost.com/favicons/arcade/arcade-72.png" />
        <!--FAVICON AND IPHONE ICONS-->

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

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <script type="text/javascript" src="js/arcade-variable-post.js"></script>
        <script type="text/javascript" src="js/arcade-blaster.js"></script>

    </head>
    <body>

        <div class="contenedor-responsive">

            <h1 style="margin-left: 3%;">Resultados Blaster</h1>

            <div id="resultados" class="datagrid sombra" style="height: 420px;overflow: auto;"></div>

            <br>
            <input onclick="tableToExcel('resultado', 'RESULTADOS DE BLASTER')" type="button" value="Exportar a Excel (CSV)" style="float: right; margin-right: 3%;background: #006500;">

        </div>
        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                var _id_blaster = obtener_variable_post('id_blaster');
                var _ans = obtener_variable_post('ans');

                select_blaster_resultado_tabla(_id_blaster, _ans, "resultados");
            }
            );
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>