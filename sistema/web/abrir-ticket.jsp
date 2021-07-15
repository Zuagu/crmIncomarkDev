<%-- 
    Document   : abrir-ticket.jsp
    Created on : Sep 15, 2017, 1:56:55 PM
    Author     : Luis Cortez
--%>

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

        <script type="text/javascript" src="js/arcade-ticket.js"></script>

    </head>
    <body>

        <div style="text-align: center;">

            <!--BEGIN CONTENT-->
            <br>
            <h2>Abrir ticket</h2>
            <h5>Fecha de vencimiento de la licencia</h5>

            <div class="datagrid" class="sombra" style="text-align: center;margin:0px auto;max-width: 420px;width:100%;">
                <table>
                    <tr>
                        <td style="width: 30%;">TITULO:</td>
                        <td><input id="ticket" type="text" placeholder="EJEMPLO: REPORTE DE VENTAS" class="alfanumerico"></td>
                    </tr>
                    <tr>
                        <td colspan="2">COMENTARIOS:<br>
                            <textarea id="comentarios" type="text" style="text-align: left;width: 98%;resize: none;height: 160px;" maxlength="1200" placeholder="Comentarios..." class="alfanumerico"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>DEPARTAMENTO:</td>
                        <td>
                            <select id="id_departamento">
                                <option value="1">SOPORTE TECNICO</option>
                                <option value="2">TELEFONIA</option>
                                <option value="3">DESARROLLO</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <br>
            <input id="insert_ticket" type="button" value="ABRIR TICKET">
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
            $("#insert_ticket").click(function () {
                insert_ticket(
                        $("#usuario_sistema", parent.document).val(),
                        $("#ticket").val(),
                        $("#comentarios").val(),
                        $("#id_departamento").val()
                        );
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>