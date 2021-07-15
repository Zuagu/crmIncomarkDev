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

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-crs.js"></script>
        <script type="text/javascript" src="js/arcade-sucursal.js"></script>
        <script type="text/javascript" src="js/arcade-consumo.js"></script>

    </head>

    <body style="height: 150px;background: transparent;">

        <div  style="width: 100%;margin: 0px auto;max-width: 520px;">

            <h4>Archivo subido correctamente</h4>

            <!--BEGIN CONTENT-->
            <div id='mensaje' style="width: 100%;box-sizing: border-box;">

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
                            File archivo_server = new File("c:/sistema/cdr.csv");
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
                <div class="datagrid sombra" style="width: 100%;">
                    <table>
                        <thead>
                            <tr>
                                <th style="text-align: center;width: 25%;">SELECCIONE SUCURSALA LA QUE CORRESPONDE CONSUMO...</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <select id="id_sucursal"></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br>
                <input id="importar_consumo" type="button" style="width: 50%;" value="FINALIZAR">

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
                select_sucursal_combo("id_sucursal", false);
            }
            );
            //==================================================================
            $("#importar_consumo").click(function () {
                importar_consumo($("#id_sucursal").val(), "mensaje");
            }
            );
            //==================================================================
            // ARCADE Software®
    </script>
    <!--CORE JAVASCRIPT-->
</body>
</html>