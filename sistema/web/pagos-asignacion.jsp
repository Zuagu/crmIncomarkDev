<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>
 
        <!--ARCADE CSS-->
        <!--        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
                <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">-->
 
        <!--        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
                <link type="text/css" rel="stylesheet" href="styles/all.css">
                <link type="text/css" rel="stylesheet" href="styles/main.css">-->
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
 
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
 
        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="highcharts/js/exporting.js"></script>
        <script type="text/javascript" src="highcharts/js/series-label.js"></script>
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
 
 
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <!--ARCADE JS-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    </head>
    <body>
        <div>
 
            <!--BEGIN CONTENT-->
            <br>
            <div class="container-fluid">
                <div class="row">
                    <div class="col s1">
 
                    </div>
                    <div class="input-field col s2">
                        <select id="id_region"></select>
                        <label>REGION</label>
                    </div>
                    <div class="input-field col s2">
                        <form id="envia_id_asignacion" name="envia_id_asignacion" action="/sistema/grafica.jsp" target="frame_grafica">
                            <select id="id_asignacion" name="id_asignacion"></select>
                            <label>ASIGNACION</label>
                        </form>
                    </div>
 
                    <div class="col s12">
                        <iframe id="frame_grafica" name="frame_grafica" frameborder="0" style="width:100%;float: left;height: 420px;"></iframe>
                        <!--<div id="container" style="min-width: 320px; height: 420px; margin: 0 auto"></div>-->
 
                    </div>
                    <div class="col s12" style="display: none">
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
                select_region_combo_materialize(1, "id_region", true);
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
            $("#id_cliente").change(function () {
                select_region_combo_materialize($("#id_cliente").val(), "id_region", true);
            });
            //==================================================================
            $("#id_region").change(function () {
                select_asignacion_region_combo_materialize($("#id_region").val(), 1, "id_asignacion");
            });
            //==================================================================
            $("#id_asignacion").change(function () {
                document.envia_id_asignacion.submit();
            });
            //==================================================================
            $("#insert_xxyyzz").live("click", function () {
                insert_xxyyzz($("#xxyyzz_insert").val());
            });
            //==================================================================
            $(".delete_xxyyzz").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_xxyyzz($(this).closest("tr").attr("id"));
                }
            });
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>