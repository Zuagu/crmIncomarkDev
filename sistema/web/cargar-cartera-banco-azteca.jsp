<%-- 
    Document   : cargar-cartera-banco-azteca
    Created on : 30/06/2020, 07:51:12 AM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cargar Cartera Banco Azteca</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <!--<link rel="stylesheet" type="text/css" href="css/css/style.css">-->
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
        <style>
            .encabezados_csv span {
                background-color: rgba(0, 0, 0, 0.13);
                margin: 0.5rem;
                width: 200px;
                display: none;
                text-align: center;
                padding: 4px;
                border-radius: 3px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="row" id="contenido"></div>

        <div class="row">
            <div class="col s12 m12 l12">
                <div class="col s12 m10 l10 offset-m1 offset-l1 z-depth-2">
                    <form method="POST" action="ControllerUploadFiles" enctype="multipart/form-data">
                        <div class="col s12 m12 l12">
                            <h6>Carga de Cuentas</h6>
                        </div> 
                        <div class="file-field input-field">
                            <div class="btn blue">
                                <span>CSV</span>
                                <input type="file" name="uploadFile" accept=".csv">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>  
                            <div class="col s4 m14 l14 offset-l4 offset-m4 input-field">
                                <button class="btn waves-effect blue-grey waves-purple" type="submit" name="action">Cargar<i class="material-icons right">send</i></button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="row"></div>
                <div class="col s12 m10 l10 offset-m1 offset-l1 z-depth-2">
                    <h5>Relacion de Coreccion</h5>
                    <div class="input-field col s12 m4 l4">
                        <input id="cliente_a_corregir" type="text" class="validate">
                        <label for="cliente_a_corregir">Cliente Unico</label>
                    </div>
                    <div class="input-field col s12 m4 l4">
                        <input id="celda_a_corregir"  type="text" class="validate">
                        <label for="celda_a_corregir">Celda a Eliminar</label>
                    </div>
                    <div class="input-field col s12 m4 l4">
                        <a class="btn waves-effect blue">Enviar<i class="material-icons right">send</i></a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Cliente Unico</th>
                                <th>Columna</th>
                            </tr>
                        </thead>
                        <tbody id="div_lista_eliminacion">

                        </tbody>
                    </table>
                </div>
                <div class="row"></div>
                <div class="col s12 m10 l10 offset-l1 offset-m1 z-depth-1">
                    <div class="col s12 m4 l4">
                        <h5>Archivos Actuales</h5>
                        <a id="getArchivos" class="btn">ver archivos</a>
                    </div>

                    <div class="col s12 m8 l8">
                        <h5>Archivos</h5>
                        <div class="card">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nombre Archivo</th>
                                        <th>Descargar</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody id="div_lista_archivos">

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col s12 m12 l12 input-field">
                        <h5>Procesar Archivos</h5>
                        <a id="procesarArchivos" class="btn">Procesar archivos</a>
                        <div id="consola_error">

                        </div>
                    </div>

                </div>


            </div>
        </div>


        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <script>
            window.onload = function () {
                lista_archivos();
                lista_eliminacion();
            };
            function lista_archivos() {
                let params = {
                    action: 'lista_archivos'
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerProcesarCartera",
                    data: params,
                    dataType: "json",
                    success: function (response) {
                        console.log("Response de lista_archivos: ", response);
                        $("#div_lista_archivos").empty();
                        for (let row of response) {
                            if (row.split('.').length === 2) {
                                $("#div_lista_archivos").append('<tr><td>' + row + '</td><td><a class="btn blue"><i class="material-icons">file_download</i></a></td><td><a class="btn red"><i class="material-icons">delete</i></a></td></tr>');
                            }
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }

            function lista_eliminacion() {
                let params = {
                    action: 'lista_eliminacion'
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerProcesarCartera",
                    data: params,
                    dataType: "json",
                    success: function (response) {

                        $("#div_lista_eliminacion").empty();
                        for (let row of response) {
                            $("#div_lista_eliminacion").append('<tr>' +
                                    '<td>' + row.cliente_unico + '</td>' +
                                    '<td>' + row.cols_delete + '</td>' +
                                    '</tr>');
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
            
            function enviar_correccion() {
                let params = {
                    action: 'enviar_correccion',
                    cliente_a_corregir: $("#cliente_a_corregir").val(),
                    celda_a_corregir: $("#celda_a_corregir").val()
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerProcesarCartera",
                    data: params,
                    dataType: "json",
                    success: function (response) {
                        window.alert(response.message);
                        lista_archivos();
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }

            function eliminar_archivo(_nombre_archivo) {
                let params = {
                    action: 'eliminar_archivo',
                    nombre_archivo: _nombre_archivo
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerProcesarCartera",
                    data: params,
                    dataType: "json",
                    success: function (response) {
                        window.alert(response.message);
                        lista_archivos();
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }

            function procesar_cartera() {
                let params = {
                    action: 'procesar_cartera'
                };
                $.ajax({
                    type: "POST",
                    url: "ControllerProcesarCartera",
                    data: params,
                    dataType: "json",
                    success: function (response) {
                        $("#consola_error").empty();
                        for (let row of response) {
                            $("#consola_error").append('<div class="col s12 card">' + row + '</div>');
                        }
                        console.log(response);

                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }

            $("#getArchivos").click(function () {
                lista_archivos();
            });

            $("#div_lista_archivos").on('click', '.collection-item', function () {
                eliminar_archivo($(this).text());
                window.alert($(this).text());
            });

            $("#procesarArchivos").click(function () {
                procesar_cartera();
            });
        </script>
    </body>
</html>
