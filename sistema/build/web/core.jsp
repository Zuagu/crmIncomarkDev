<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>
        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <!--TERMINA CALENDARIO -->

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-core.js"></script>
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!-- HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script> 
        <script type="text/javascript" src="highcharts/exporting.js"></script>
        <!-- HIGHCHARTS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            .tipo_tel{
                width: 60px !important;
                text-align: center !important;
            }
            .telefono_core{
                width: 110px !important;
                text-align: center !important;
            }
            .nombre{
                width: 310px !important;
            }
            #core_datos{
                max-height: 360px; margin: 0px auto; overflow: auto; margin-bottom: 0px; border-radius: 4px; padding-left: 10px;
            }
        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div class="row">
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Concentrado de teléfonos</a>
                        <ul class="right hide-on-med-and-down"  style="margin-right:2%;">
                            <li id="pdf_horas-clase-maestro"><a href="#"><i id="nav_i" class="material-icons help">picture_as_pdf</i></a></li>
                            <li id="roboto">Manuales de usuario de este modulo</li>
                        </ul>
                    </div>
                </nav>
            </div>

            <!--END TITLE & BREADCRUMB PAGE-->           

            <!--BEGIN CONTENT-->
            <div class="row">
                <div class="col s12">
                    <div class="col s4"></div>
                    <div class="input-field col s4">
                        <input id="filtro" type="text" class="validate" maxlength="45">
                        <label class="center-align" for="first_name">Filtro</label>
                    </div>
                    <div class="col s4"></div>
                </div>
                <div class="col s12">
                    <div class="col s12" id="core_datos" style="height: 500px;"></div>
                </div>
                </form>
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
            $('select').material_select();
            select_core_tabla("", "core_datos");
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 15, // Creates a dropdown of 15 years to control year,
                today: 'Today',
                clear: 'Clear',
                close: 'Ok',
                closeOnSelect: false // Close upon selecting a date,
            });
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
        $("#filtro").keyup(function (e) {
            if (e.keyCode == 13) {
                select_core_tabla($('#filtro').val(), "core_datos");
            }
        });
        //==================================================================
        $(".editar_dato").live("change", function () {
            update_dato_core(
                    $('#usuario_sistema', parent.document).val(),
                    $(this).closest("tr").attr("id"),
                    $(this).closest("td").attr("class"),
                    $(this).val()
                    );
        });
        //==================================================================
        // ARCADE Software®
    </script>
    <!--CORE JAVASCRIPT-->
</body>
</html>