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
        <script type="text/javascript" src="js/arcade-gestion.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">


        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Gestionar Blaster
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

        <div class="contenedor-responsive" style="text-align: center;">

            <!--BEGIN CONTENT-->
            <br>
            <div id="mensaje_inicio" style="padding: 20px 40px;color: #9CB8C3;text-align: center;">
                <h4>
                    Con esta herramienta, podrás GESTIONAR los resultados de tu blaster.<br>
                    Tu archivo .CSV, debe contener como encabezados:<br>
                    * CUENTA<br>
                    * NUMERO MARCADO<br>
                    * FECHA_LARGA (FORMATO AAA-MM-DD HH:MM:SS)<br>
                    * ID_ESTATUS (ID DEL ESTATUS DE LA TABLA arcade_estatus_cuenta)<br>
                    * ID_CODIGO (ID DEL ESTATUS DE LA TABLA arcade_estatus_llamada)<br>
                    * GESTION<br>
                    * ID_REGION<br>
                    * ID_ASIGANCION<br>
                    * EXPEDIENTE<br>
                </h4>
                <img src="images/e_joy-128.png" alt="" style="width: 32px;"><br>
            </div>

            <br>
            <iframe id="form_carga_archivo" src="cargar-gestiones-blaster.jsp" frameborder="0" style="width: 100%;height: 160px;margin: 0px auto;max-width: 420px;"></iframe>

            <br>
            <div id="paso_1" style="max-width: 420px;width: 100%;margin: 0px auto;display: none;">
                <div class="datagrid sombra" style="width: 100%;">
                    <table>
                        <thead>
                            <tr>
                                <th>¿DE QUE CLIENTE SON ESTAS GESTIONES?</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><select id="id_cliente"></select></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br>
                <input id="import_gestiones_blaster" type="button" value="CARGAR GESTIONES" style="width: 50%;max-width: 180px;">
                <br>
            </div>
            <br>

            <div id="paso_2" style="max-width: 520px;width: 100%;margin: 0px auto;display: none;font-size: 1.6rem;"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software ®
            //==================================================================
            $(document).ready(function () {
                select_clientes_combo("id_cliente", true);
            }
            );
            //==================================================================
            $(".help").on("click", function () {
                var src = location.href;
                var aux;
                var jsp;
                aux = src.split('/sistema/');
                jsp = aux[1];
                jsp = jsp.replace('.jsp', '');
                window.open("ayuda.jsp?tema=" + jsp, "_blank");
            });
            //==================================================================
            $("#import_gestiones_blaster").live("click", function () {

                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    import_gestiones_blaster($('#usuario_sistema', parent.document).val(), $("#id_cliente").val(), "paso_1");
                }

            });
            //==================================================================
            // ARCADE Software ®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>