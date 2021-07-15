<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="image/logoInco.fw.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Departamentos</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="row">
            <div class="col offset-m1 offset-l1 s12 m10 l10 ">
                <h4>Departamentos</h4>    
            </div>
            <div class="col offset-m1 offset-l1 s12 m10 l10 ">
                <div class="input-field col s6">
                    <input placeholder="Nuevo Departamentos" id="nombre_departamentos" type="text" class="validate">
                    <label for="nombre_departamentos">Nombre Departamento</label>
                </div>
                <div class="input-field col s6">
                    <a id="agregar_nueva_departamentos" class="btn waves-effect waves-light"><i class="material-icons right">send</i>Agregar</a>
                </div>
            </div>
            <div class="col offset-m1 offset-l1 s12 m10 l10 ">
                <table>
                    <thead class="blue">
                        <tr>
                            <th>Id</th>
                            <th>Departamento</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="tbody_departamentos"></tbody>
                </table>
            </div>
            <div id="error"></div>
        </div>



        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <script type="text/javascript" src="js/js/sucursales.js"></script>
    </body>
</html>