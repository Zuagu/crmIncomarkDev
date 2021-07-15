<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Manual de usuario ::</title>

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

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-manual.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-variable-post.js"></script>

        <style>
            h3{
                color: #000033;
                background: transparent;
                padding: 15px;
                margin-top: 0px;
                font-size: 3rem;
                font-weight: bold;
            }
            .titulo{
                color: #000033;
                font-size: 2.2rem;
                font-weight: bold;
                padding: 6px 0px 0px 0px;
            }
            .parrafo{
                color: #666666;
                font-size: 1.7rem;
                padding: 2px 0px 6px 0px;
            }
            .imagen{
                text-align:center;
            }
            .imagen img{
                max-width: 100%;
                padding-bottom: 10px;
            }
            #color_superior{
                /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#e2e2e2+0,dbdbdb+50,fefefe+100 */
                background: rgb(226,226,226); /* Old browsers */
                background: -moz-linear-gradient(top, rgba(226,226,226,1) 0%, rgba(219,219,219,1) 50%, rgba(254,254,254,1) 100%); /* FF3.6-15 */
                background: -webkit-linear-gradient(top, rgba(226,226,226,1) 0%,rgba(219,219,219,1) 50%,rgba(254,254,254,1) 100%); /* Chrome10-25,Safari5.1-6 */
                background: linear-gradient(to bottom, rgba(226,226,226,1) 0%,rgba(219,219,219,1) 50%,rgba(254,254,254,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e2e2e2', endColorstr='#fefefe',GradientType=0 ); /* IE6-9 */
            }
        </style>

    </head>

    <body style="background-image: url('images/background-cliente.png')">

        <div style="width: 100%;">

            <!--BEGIN CONTENT-->
            <div id='color_superior' class="sombra">
                <div style="margin: 0px auto;max-width: 920px;">
                    <img src="images/logo-cliente.png" style="width: 180px;float: right;">
                    <h3 id="titulo-ayuda">Manual del módulo </h3>
                </div>
            </div>

            <div id="manual" class="sombra" style="text-align:left;padding: 40px;max-width: 920px;margin: 0px auto;border: solid 1px #DADADA;background: #FFFFFF;">
                <div class="titulo">Equipos Cuentas</div>
                <div class="parrafo">
                    En este modulo se pueden ver las cuentas que ...
                </div>
                <div class="imagen">
                    <img src="images/manual/1.png">
                </div>
            </div>

            <br>
            <div style="text-align: center;color: #8C8C8C;">
                <!--                ARCADE Software, S. A. de C. V.<br>-->
                Manual de Usuario<br>
                ARCADE Software :: Departamento de Sistemas
                <br>
            </div>
            <br>
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                var _tema = obtener_variable_post('tema');
                $("#titulo-ayuda").append("'", _tema, "'");

                select_manual(_tema, "manual");
            }
            );
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>