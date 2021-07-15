<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" href="image/logoInco.fw.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sucursales</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="row">
            <div class="col offset-m1 offset-l1 s12 m10 l10 ">
                <h4>SUCURSALES</h4>    
            </div>



            <div class="col offset-m1 offset-l1 s12 m10 l10 ">

                <div class="row">
                    <div class="col s12">
                        <ul class="tabs">
                            <li class="tab col s3"><a class="active" href="#test1">Sucursal</a></li>
                            <li class="tab col s3"><a href="#test3">Area</a></li>
                            <li class="tab col s3"><a href="#test2">Departamento</a></li>
                            <li class="tab col s3"><a href="#test4">Puesto</a></li>
                        </ul>
                    </div>


                    <div id="test1" class="col s12">
                        <!--Sucursal-->
                        <div class="input-field col s6">
                            <input placeholder="Nueva Sucursal" id="nombre_sucursal" type="text" class="validate">
                            <label for="nombre_sucursal">Nombre Sucursal</label>
                        </div>
                        <div class="input-field col s6">
                            <a id="agregar_nueva_sucursal" class="btn waves-effect waves-light"><i class="material-icons right">send</i>Agregar</a>
                        </div>

                        <div class="col s12">
                            <table>
                                <thead class="blue">
                                    <tr>
                                        <th>id</th>
                                        <th>Sucursal</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="tbody_sucursales"></tbody>
                            </table>
                        </div>
                    </div>

                    <!--Departamentos-->
                    <div id="test2" class="col s12">

                        <div class="input-field col s6">
                            <input placeholder="Nuevo Departamentos" id="nombre_departamento" type="text" class="validate">
                            <label for="nombre_departamento">Nombre Departamento</label>
                        </div>
                        <div class="input-field col s6">
                            <a id="agregar_nuevo_departamento" class="btn waves-effect waves-light"><i class="material-icons right">send</i>Agregar</a>
                        </div>
                        <div class="col s12">
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

                    </div>

                    <!--Area-->
                    <div id="test3" class="col s12">
                        <div class="input-field col s6">
                            <input placeholder="Nueva Area" id="nombre_area" type="text" class="validate">
                            <label for="nombre_area">Nombre Area</label>
                        </div>
                        <div class="input-field col s6">
                            <a id="agregar_nueva_area" class="btn waves-effect waves-light"><i class="material-icons right">send</i>Agregar</a>
                        </div>
                        
                        <div class="col s12">
                            <table>
                                <thead class="blue">
                                    <tr>
                                        <th>Id</th>
                                        <th>Area</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="tbody_areas"></tbody>
                            </table>
                        </div>
                    </div>
                    
                    <!--Puestos-->
                    <div id="test4" class="col s12">
                        <div class="input-field col s6">
                            <input placeholder="Nueva Puesto" id="nombre_puesto" type="text" class="validate">
                            <label for="nombre_puesto">Nombre Puesto</label>
                        </div>
                        <div class="input-field col s6">
                            <a id="agregar_nuevo_puesto" class="btn waves-effect waves-light"><i class="material-icons right">send</i>Agregar</a>
                        </div>
                        
                        <div class="col s12">
                            <table>
                                <thead class="blue">
                                    <tr>
                                        <th>Id</th>
                                        <th>Puesto</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody_puesto"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>



            <div id="error"></div>
        </div>



        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <script type="text/javascript" src="js/js/sucursales.js"></script>
    </body>
</html>