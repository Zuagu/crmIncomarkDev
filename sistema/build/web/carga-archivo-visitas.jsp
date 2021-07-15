<%-- 
    Document   : carga-archivo-visitas
    Created on : 22/05/2021, 01:32:32 PM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Carga Archivos Visita</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
    </head>
    <body>
        
        <div class="row" id="contenido"></div>

        <div class="row">
            <div class="col s12 m12 l12">
                <div class="col s4 m4 l4 offset-l4 offset-m4 z-depth-2">
                    <form method="POST" action="ControllerUploadFileVisitas" enctype="multipart/form-data">
                        <div class="col s12 m12 l12">
                            <h6>Carga de Visitas</h6>
                        </div> 
                        <div class="file-field input-field">
                            <div class="btn blue">
                                <span>CSV Visita</span>
                                <input type="file" name="uploadFile" accept=".csv">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>  
                            <div class="col s4 m14 l14 offset-l4 offset-m4 input-field">
                                <button class="btn waves-effect waves-purple" type="submit" name="action">Cargar<i class="material-icons right">send</i></button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>


        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
    </body>
</html>
