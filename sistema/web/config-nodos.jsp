<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />

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

        <!--ARCADE CSS-->
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">
        <!--ARCADE CSS-->

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <!--ARCADE JS-->

        <script type="text/javascript" src="js/arcade-organigrama.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>

    <body>

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Configuración de Nodos para Organigrama
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
            <div id="div_config_nodo" class="esconder" style="width: 100%;margin: 0px auto;box-sizing: border-box;padding: 1%;overflow: auto;float:left;">
                <div style="text-align: center;">
                    <h2>Configuración de nodos</h2>
                </div>
                <br>
                <div style="margin: 0px auto;width: 70%;">
                    <div style="float: left;background: #FFF;width: 40%;padding: 1%;box-sizing:border-box;margin-right: 1%;">
                        <h4 style="text-align: center;">
                            TIPOS DE NODO
                        </h4>
                        <div id="tipos_nodo" class="datagrid sombra"></div>
                    </div>
                    <div style="float: left;background: #FFF;width: 50%;padding: 1%;box-sizing:border-box;">
                        <h4 style="text-align: center;">
                            CONTENIDOS PARA TIPO DE NODO
                        </h4>
                        <div class="datagrid sombra">
                            <table border="0">
                                <thead>
                                    <tr>
                                        <th colspan="2" style="text-align: center;">AGREGAR CONTENIDOS</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>TIPO DE NODO:</td>
                                        <td>
                                            <select id="id_tipo_nodo">SELECCIONE...</select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input id="descripcion_contenido" type="text" placeholder="EJ. MISION, VISION..." class="alfanumerico"></td>
                                        <td>
                                            <input type="button" id="insert_contenido_tipo_nodo" value="AGREGAR CONTENIDO">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <br>
                        <div id="div_contenidos_tipo_nodo" class="datagrid sombra"></div>
                    </div>
                </div>
                <br>
            </div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_tipos_nodo("tipos_nodo");
                select_tipos_nodo_combo("id_tipo_nodo");
            }
            );
            //==================================================================
            $("#insert_contenido_tipo_nodo").live("click", function () {
                if ($("#descripcion_contenido").val() == "") {
                    alert("INGRESA UNA DESCRIPCION");
                } else {
                    insert_contenido_tipo_nodo($("#id_tipo_nodo").val(), $("#descripcion_contenido").val());
                }
            });
            //==================================================================
            $("#id_tipo_nodo").live("change", function () {
                select_contenidos_tipo_nodo($("#id_tipo_nodo").val(), "div_contenidos_tipo_nodo");
            });
            //==================================================================
            $(".delete_contenido_tipo_nodo").live("click", function () {
                var confirma = confirm("PRESIONE OK PARA CONTINUAR...");
                if (confirma) {
                    delete_contenido_tipo_nodo($(this).closest("tr").attr("id"));
                }
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>