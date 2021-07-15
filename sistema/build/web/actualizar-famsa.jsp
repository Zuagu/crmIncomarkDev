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

        <script type="text/javascript" src="js/arcade-basegeneral.js"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Actualizar cuentas Famsa
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
        <div id="div_todo" class="contenedor-responsive" style="text-align: center;max-width: 520px;"> 

            <br>
            <h5>INGRESA LAS CUENTAS QUE QUIERAS ACTUALIZAR. <br><i>(SEPARADAS POR COMA)</i></h5>
            <textarea id="cuentas" style="width: 100%;height: 260px;" maxlength="25000"></textarea>

            <br>
            <h5>¿QUE LES QUIERES HACER A ESTAS CUENTAS?</h5>
            <select id="f_active" style="width: 40%;min-width: 120px;">
                <option value="1">PONERLAS ACTIVAS</option>
                <option value="0">PONERLAS INACTIVAS</option>
            </select>

            <br>
            <br>
            <input id="update_f_active_cuentas" value="ACTUALIZAR CUENTAS" type="button" style="width:40%;min-width: 120px;">
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
            $("#update_f_active_cuentas").click(function () {
                update_f_active_cuentas(
                        $('#usuario_sistema', parent.document).val(),
                        $('#cuentas').val(),
                        $("#f_active").val(),
                        "div_todo");
            });
            //==================================================================
            $("#cuentas").contextmenu(function () {
                $("#cuentas").val('');
            }
            );
            //==================================================================
            $("#cuentas").change(function () {
                var _cuentas;
                _cuentas = $("#cuentas").val();
                _cuentas = _cuentas.split("\n").join(", ");
                _cuentas = _cuentas.substring(0, _cuentas.length - 2);

                $("#cuentas").val(_cuentas);
            });
            //==================================================================
            $("#finalizar").live("click", function () {
                location.reload();
            });
            //==================================================================
            // ARCADE Software®
    </script>
    <!--CORE JAVASCRIPT-->
</body>
</html>