<%-- 
    Document   : permisoAusenciaLaboral
    Created on : 11/04/2019, 08:03:18 PM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Permiso Ausencia Laboral</title>
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <style type="text/css">
            .cuadro {
                border: 1px solid black;
                width: 10%;
            }
            td {
                text-align: left;
                padding: 0px 5px;
            }
            input[type=text]:not(.browser-default) {
                height: 2rem;
                font-weight: bold;
                margin: 0 0 0 0;
            }
            /*            table input[type=text]:not(.browser-default) {
                            margin: 0;
                            text-align: center;
                            font-weight: bold;
                            font-size: 18px;
                        }*/
            #textarea1 {
                height: 150px;
                font-weight: bold;
            }
            .firmas input[type=text]:not(.browser-default) {
                text-align: center;
                height: 3 rem;
            }
            td {
                border: 2px solid rgb(0, 0, 0);
            }
            p {
                margin: 7px 0 0 0;
            }
            .linea {
                border-bottom: 1px solid black;
                margin: 0 0 0 0;
                padding: 0 !important;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <br><br>
            
            <table>
                <tr>
                    <td colspan="2">
                        <div class="col s12">
                            <br>
                            <div class="col s2 offset-s1">
                                <img src="image/logo.png" width="100%">
                            </div>
                            <div class="col s6 center-align">
                                <h5><b>PERMISO AUSENCIA LABORAL</b></h5>
                            </div>
                            <div class="col s3"></div>
                        </div>
                        <div class="col s12">
                            <p class="col s2 offset-s1">Fecha:</p>
                            <input id="fecha" class="col s8" type="text" name="">
                        </div>
                        <div class="col s12">
                            <p class="col s2 offset-s1">Se le Autoriza a:</p>
                            <input class="col s8" type="text" name="">
                        </div>
                        <div class="col s12">
                            <p class="col s2 offset-s1">No Empleado:</p>
                            <input class="col s3" type="text" name="">
                            <p class="col s2">Region:</p>
                            <input class="col s3" type="text" name="">
                        </div> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="input-field col s12">
                            <textarea id="textarea1" class="materialize-textarea"></textarea>
                            <label for="textarea1">Comentario</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="center-align firmas">
                        <p>CONFORMIDAD</p>
                        <div class="col s12 center-align">
                            <input class="col s10 offset-s1" type="text" name="">
                            <p>Nombre del Empleado</p>
                        </div>
                    </td>
                    <td class="center-align firmas">
                        <p>AUTORIZACION <small>(Nombre y Firma)</small></p>
                        <div class="col s6 center-align">
                            <input class="col s10 offset-s1" type="text" name="">
                            <p>Recursos Humanos</p>
                        </div>

                        <div class="col s6 center-align">
                            <input class="col s10 offset-s1" type="text" name="">
                            <p>Recursos Humanos</p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript">
            var MyDate = new Date();
            MyDate.setDate(MyDate.getDate());
            var MyDateString = ('0' + MyDate.getDate()).slice(-2) + '-' + ('0' + (MyDate.getMonth() + 1)).slice(-2) + '-' + MyDate.getFullYear();
            document.getElementById("fecha").value = MyDateString;
        </script>
    </body>
</html>
