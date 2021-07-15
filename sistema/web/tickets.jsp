<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>

        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->

        <!-- INICIA JQUERTY -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <!--TERMINA JQUERTY -->

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

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-ticket.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            .resumen_tickets{
                display: inline-block;
                width: 140px !important;
                height: 70px;
                /*background: transparent;*/
                text-align: center;
                cursor: pointer;
            }
            .resumen_tickets span{
                font-size: 2.3rem;
            }

            .prioridad{
                width: 66% !important;
                text-align: center;
                border: solid 1px #c9c9c9;
                border-radius: 11px;
                padding: 7px;
                font-weight: bold;
                font-size: 1.4rem;
            }
        </style>

    </head>
    <body>

        <div class="container-fluid">

            <div class="row">
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Mis Tickets asignados</a>
                        <ul class="right hide-on-med-and-down"  style="margin-right:2%;">
                            <li><a href="#"><i id="nav_i" class="material-icons help">picture_as_pdf</i></a></li>
                            <li id="roboto">Manuales de usuario de este modulo</li>
                        </ul>
                    </div>
                </nav>
            </div>

            <!--BEGIN CONTENT-->
            <div class="row">
                <div class="col s10 offset-l1" style="border:1px solid #dadada;border-radius: 4px;max-height: 500px;overflow: auto;">
                    <table class="striped bordered highlight">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>TICKET</td>
                                <td>DESCRIPCION</td>
                                <td>ESTIMADO</td>
                                <td>REAL</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody id="tbody_tickets">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                alert($('#usuario_sistema', parent.document).val()); // depa, abierto
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
            $(".ticket").live("click", function () {
                $("#id_ticket").val($(this).closest("tr").attr("id"));
            });
            //==================================================================
            $("#insert_ticket").live("click", function () {
                insert_ticket($("#ticket_insert").val());
            });
            //==================================================================
            $(".delete_ticket").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_ticket($(this).closest("tr").attr("id"));
                }
            });
            //==================================================================
            $(".prioridad").live("change", function () {
                update_prioridad_ticket($(this).closest("tr").attr("id"), $(this).val());
            });
            //==================================================================
            $("#mostrar_dup").live("click", function () {
                $("#div_update_ticket").show();
            });
            //==================================================================
            $("#update_ticket").click(function () {
                update_ticket(
                        $('#usuario_sistema', parent.document).val(),
                        $("#id_ticket").val(),
                        $("#respuesta").val(),
                        $("#id_estatus").val()
                        );
            });
            //==================================================================
            $("#st1").click(function () {
                select_ticket_tabla(3, 1, "listado_ticket"); // depa, abierto
            });
            //==================================================================
            $("#st2").click(function () {
                select_ticket_tabla(2, 1, "listado_ticket"); // depa, abierto
            });
            //==================================================================
            $("#st3").click(function () {
                select_ticket_tabla(1, 1, "listado_ticket"); // depa, abierto
            });
            //==================================================================
            $("#st4").click(function () {
                select_ticket_tabla(0, 1, "listado_ticket"); // depa, abierto
            });
            //==================================================================
            $("#st5").click(function () {
                select_ticket_tabla(0, 0, "listado_ticket"); // depa, abierto
            });
            //==================================================================
            $("#nuevo_ticket").live("click",
                    function () {
                        location.href = "abrir-ticket.jsp";
                    }
            );
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>