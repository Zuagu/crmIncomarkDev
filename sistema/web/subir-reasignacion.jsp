<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>

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
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>

    <body style="height: 150px;background: transparent;">

        <br>
        <div id="div_resultado"  style="width: 50%;margin: 0px auto;text-align: center;">

            <h4>Archivo subido correctamente</h4>

            <!--BEGIN CONTENT-->
            <div style="width: 100%;box-sizing: border-box;text-align: center;">

                <%
                    /*FileItemFactory es una interfaz para crear FileItem*/
                    FileItemFactory file_factory = new DiskFileItemFactory();

                    /*ServletFileUpload esta clase convierte los input file a FileItem*/
                    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
                    /*sacando los FileItem del ServletFileUpload en una lista */
                    List items = servlet_up.parseRequest(request);

                    for (int i = 0; i < items.size(); i++) {
                        /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
                        FileItem item = (FileItem) items.get(0);
                        /*item.isFormField() false=input file; true=text field*/
                        if (!item.isFormField()) {
                            /*cual sera la ruta al archivo en el servidor*/
                            File archivo_server = new File("c:/sistema/reasignacion.csv");
                            /*y lo escribimos en el servido*/
                            item.write(archivo_server);
                            out.print("Nombre --> " + item.getName());
                            out.print("<br> Tipo --> " + item.getContentType());
                            out.print("<br> Tamaño del archivo --> " + (item.getSize() / 1024) + "KB");
                            out.print("<br>");
                        }
                    }
                %>

                <br>
                Ahora, selecciona la asignacion que sera <b>REASIGNADA</b>.
                <br>

                <br>
                <div class="datagrid" style="border: none;background: transparent;height: 70px;">
                    <div class="datagrid sombra" style="width: 100%;float: left;">
                        <table>
                            <thead>
                                <tr>
                                    <th style="text-align: center;width: 25%;">CLIENTE</th>
                                    <th style="text-align: center;width: 25%;">REGION</th>
                                    <th style="text-align: center;width: 25%;">ASIGNACION</th>
                                    <th style="width: 25%;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <select id="id_cliente"></select>
                                    </td>
                                    <td>
                                        <select id="id_region"></select>
                                    </td>
                                    <td>
                                        <select id="id_asignacion"></select>
                                    </td>
                                    <td>
                                        <input id="reasignar" type="button" style="width: 98%;max-width: 200px;display: none;" value="REASIGNAR">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
                select_clientes_combo("id_cliente");
            }
            );
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo($("#id_cliente").val(), "id_region", true);
            });
            //==================================================================
            $("#id_region").change(function () {
                select_asignacion_region_combo($("#id_region").val(), 1, "id_asignacion");
            });
            //==================================================================
            $("#id_asignacion").change(function () {
                $("#reasignar").show();
            });
            //==================================================================
            $("#reasignar").click(function () {
                if ($("#id_asignacion").val() == "") {
                    alert("SELECCIONE UNA ASIGNACION...");
                } else {
                    reasignar($("#id_asignacion").val(), "div_resultado");
                }
            }
            );
            //==================================================================
            function reasignar(_id_asignacion, _id_caja) {
                $("#" + _id_caja).empty();
                $("#" + _id_caja).append("<div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>");
                var params = {
                    accion: "reasignar",
                    id_asignacion: _id_asignacion
                };
                $.ajax({
                    type: "POST",
                    url: "/sistema/ManageAsignacion",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        $("#" + _id_caja).empty();
                        $("#" + _id_caja).append(dataRes);
                    }
                });
            }
            //==================================================================
            // ARCADE Software®
    </script>
    <!--CORE JAVASCRIPT-->
</body>
</html>