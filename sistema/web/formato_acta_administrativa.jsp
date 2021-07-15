<%-- 
    Document   : formatoActaAdministrativa
    Created on : 11/04/2019, 07:50:09 PM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Acta Administrativa</title>
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
            table input[type=text]:not(.browser-default) {
                margin: 0;
                text-align: center;
                font-weight: bold;
                font-size: 18px;
            }
            #textarea1 {
                height: 150px;
                border: 1px solid grey;
                font-weight: bold;
            }
            .firmas input[type=text]:not(.browser-default) {
                text-align: center;
            }
            tr {
                border-bottom: 1px solid rgba(0, 0, 0, 0);
            }
            p {
                margin: 7px 0 0 0;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col s12">
                <br><br>
                <div class="col s3 offset-s1">
                    <img src="image/logo.png" width="100%">
                </div>
                <div class="col s6 center-align valign-wrapper">
                    <h4><b>ACTA ADMINISTRATIVA</b></h4>
                </div>
            </div>

            <div class="col s12">
                <p class="col s2 offset-s6 right-align">Fecha:</p>
                <div class="col s3">
                    <input id="fecha" type="text" name="">
                </div>
                <p class="col s2 offset-s6 right-align">No Reporte:</p>
                <div class="col s3">
                    <input id="fecha" type="text" name="">
                </div>
            </div>

            <div class="col s12">
                <p class="col s2 offset-s1">Colaborador:</p>
                <input class="col s6" type="text" name="">
            </div>
            <div class="col s12">
                <p class="col s2 offset-s1">No Empleado:</p>
                <input class="col s3" type="text" name="">
            </div>
            <div class="col s12">
                <p class="col s2 offset-s1">Region:</p>
                <input class="col s3" type="text" name="">
            </div>

            <div class="col s12">
                <h6 class="center-align"><b>Motivos</b></h6>
                <table class="col s10 offset-s1">
                    <tr>
                        <td>Retardos</td>
                        <td class="cuadro"><input type="text" name=""></td>
                        <td></td>
                        <td></td>
                        <td>Bajo Desempeño</td>
                        <td class="cuadro"><input type="text" name=""></td>
                    </tr>
                    <tr>
                        <td>Faltas injustificadas </td>
                        <td class="cuadro"><input type="text" name=""></td>
                        <td></td>
                        <td></td>
                        <td>Faltas al Reglamentos</td>
                        <td class="cuadro"><input type="text" name=""></td>
                    </tr>
                    <tr>
                        <td>Conducta Negativa</td>
                        <td class="cuadro"><input type="text" name=""></td>
                        <td></td>
                        <td></td>
                        <td>Daño o Mal uso de las Instalaciones</td>
                        <td class="cuadro"><input type="text" name=""></td>
                    </tr>
                </table>
                <p class="col s1 offset-s1">Otro:</p>
                <input class="col s4" type="text" name="">
            </div>


            <div class="col s12">
                <br><br>
                <div class="input-field col s10 offset-s1">
                    <textarea id="textarea1" class="materialize-textarea"></textarea>
                    <label for="textarea1">Comentario</label>
                </div>
            </div>

            <div class="col s12 firmas">
                <div class="col s6 center-align">
                    <input class="col s10 offset-s1" type="text" name="">
                    <p>Nombre del Empleado</p>
                </div>
                <div class="col s6 center-align">
                    <input class="col s10 offset-s1" type="text" name="">
                    <p>Supervisor/Subgerencia</p>
                </div>
                <div class="col s6 center-align">
                    <input class="col s10 offset-s1" type="text" name="">
                    <p>Recursos Humanos</p>
                </div>
                <div class="col s6 center-align">
                    <input class="col s10 offset-s1" type="text" name="">
                    <p>Coordinacion Operaciones</p>
                </div>
            </div>

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
