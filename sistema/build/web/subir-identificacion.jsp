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

        <style>
            h3{
                color: #FFFFFF;
                background: #001840;
                padding: 15px;
                margin-top: 0px;
                font-size: 3rem;
            }
            h4{
                color: #FFFFFF;
                font-size: 1.7rem;
                padding: 10px;

            }
            span{
                color: #666666;
                font-size: 1.7rem;
            }
            img{
                width: 100%;
            }
            #datos_cliente{
                width: 94%;
                margin: 0px auto;
            }
            #datos_cliente tbody tr td input{
                width: 100%;
                border-radius: 5px;
                border: solid 1px #d5cccc;
                padding: 6px;
                color: #484848;
            }
            #datos_cliente tbody tr td{
                text-align: right;
                color: #5A5A5A;
            }
        </style>

    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <br>
        <div class="sombra" style="width: 70%;margin: 20px auto;background: #FFFFFF;height: 454px;">

            <div style="background: #001840;">
                <div style="margin: 0px auto;max-width: 920px;">
                    <img id="imprimir" src="images/logo_arcade2018-b-p.png" style="width: 180px;float: right;margin-top: 6px;">
                    <h3 id="titulo-ayuda" style="text-align: left;">Archivo subido correctamente</h3>
                </div>
            </div>

            <!--BEGIN CONTENT-->
            <br>
            <div style="width: 35%;box-sizing: border-box;float: left;text-align: right;">
                <div class="datagrid sombra" style="max-width: 320px;padding: 10px;">

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
                                File archivo_server = new File("c:/sistema/identifica.csv");
                                /*y lo escribimos en el servido*/
                                item.write(archivo_server);
                                out.print("Nombre --> " + item.getName());
                                out.print("<br> Tipo --> " + item.getContentType());
                                out.print("<br> Tamaño del archivo --> " + (item.getSize() / 1240) + "KB");
                                out.print("<br>");
                            }
                        }
                    %>

                    <br>Ahora que tu archivo ha sido cargado, debes de <br><a id="identificar" style="cursor:pointer;font-size: 2rem;">IDENTIFICARLO</a>.

                </div>
            </div>
            <div style="width: 65%;box-sizing: border-box;float: right;text-align: left;">
                <div id="numeros" class="datagrid sombra" style="height: 300px;overflow: auto;"></div>
                <div id="caja_excel" style="text-align: right;margin-right: 3%;display: none;">
                    <br>
                    <input type="button" value="EXPORTAR A EXCEL" class="sombra" onclick="tableToExcel('numeros_identificados', 'RESULTADO')"  style="background:#1F804D;color:#FFF;border-radius:3px;padding: 5px 12px;border:none;font-weight: bold;width: 140px;">
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
        $("#identificar").click(function () {
            identificar();
        });
        //==============================================================================
        function identificar() {
            $("#numeros").empty();
            $("#numeros").append("<div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>");
            var params = {
                accion: "identificar"
            };
            $.ajax({
                type: "POST",
                url: "/sistema/ManageMarcacion",
                data: params,
                dataType: "html",
                success: function (dataRes) {
                    alert(dataRes);
                    $("#numeros").empty();
                    select_numeros_tabla("numeros");
                    $("#caja_excel").show();
                }
            });
        }
        ;
        //==============================================================================
        function select_numeros_tabla(_id_caja) {
            var params = {
                accion: "select_numeros_tabla"
            };
            $.ajax({
                type: "POST",
                url: "/sistema/ManageMarcacion",
                data: params,
                dataType: "html",
                success: function (dataRes) {
                    $("#" + _id_caja).empty();
                    $("#" + _id_caja).append(dataRes);
                }
            });
        }
        ;
        //==================================================================
        // ARCADE Software®
    </script>
    <!--CORE JAVASCRIPT-->
</body>
</html>