
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

        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>

        <script type="text/javascript" src="js/arcade-estatus-cuenta.js"></script>
        <script type="text/javascript" src="js/arcade-clipboard.js"></script>
        <script type="text/javascript" src="js/arcade-blaster.js"></script>

        <style>
            input[type="checkbox"] {
                cursor: pointer;
            }

            table tr input {
                border: solid 1px #7B7B7B;
            }
        </style>

    </head>

    <body>

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Generador de Blaster
                </div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-left">
                <li>Manuales de usuario de este modulo:</li>
                <li id="pdf_horas-clase-maestro"><img class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>
            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->

        <!--BEGIN CONTENT-->
        <div class="contenedor-responsive" style="text-align: center;width: 99%;max-width: 360px;">

            <br>
            <img src='images/logo-cliente.png' style="width:200px;">

            <br>
            <div id="paso1">
                <iframe src="cargar-blaster.jsp" frameborder="0" style=" width: 100%;height: 400px;"></iframe>
            </div>

            <br>
            <div id="paso2" style="vertical-align: top !important;display: none;">

                <div class="datagrid sombra">
                    <form name="blaster" action="">

                        <table>

                            <thead>
                                <tr>
                                    <th colspan="2" style="text-align:center;">CONFIGURACIÓN DE BLASTER</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>
                                    <td style="text-align: right;">NOMBRE:</td>
                                    <td><input id="nombre" type="text" value="" class="alfanumerico"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">REINTENTOS:</td>
                                    <td>
                                        <select id="reintentos" type="text">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">TIMBRADO(s):</td>
                                    <td><input id="timbrado" type="text" value="20" class="entero"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">TRONCAL:</td>
                                    <td>
                                        <select id="troncal">
                                            <option value="SICSABLASTER">TRONCAL BLASTER SYSTEL</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">PREFIJO:</td>
                                    <td><input id="prefijo" type="text" value="52" class="entero" title="Este prefijo depende del proveedor de telefonía. Ej. Contacta, sin prefijo. Flynode, 52"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">AUDIO:</td>
                                    <td>
                                        <select id="audio" type="text" title="Para escuchar el audio presiona 99 + el número del audio"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">CONFIRMAR:</td>
                                    <td>
                                        <select id="confirmar" type="text">
                                            <option value="0">NO CONFIRMAR</option>
                                            <option value="1">CONFIRMAR INICIO Y FIN CON LLAMADA</option>
                                        </select>
                                    </td>
                                </tr>

                            </tbody>

                        </table>

                    </form>
                </div>

                <br>
                <input id="insert_blaster" type="button"  value="GENERAR BLASTER">
            </div>


            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_audios_blaster("audio", 1);
            }
            );
            //==================================================================
            $("#insert_blaster").click(function () {
                insert_blaster(
                        $("#nombre").val(),
                        $("#reintentos").val(),
                        $("#timbrado").val(),
                        $("#troncal").val(),
                        $("#prefijo").val(),
                        $("#audio").val(),
                        $("#confirmar").val()
                        );
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
