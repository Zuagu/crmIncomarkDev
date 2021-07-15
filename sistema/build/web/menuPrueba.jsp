<%-- 
    Document   : menuPrueba
    Created on : 12/08/2019, 10:04:10 AM
    Author     : zuagu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/menuprueba.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <% 
            HttpSession sesion = request.getSession();

            if(sesion.getAttribute("id_usuario")!= null){
                out.write("<script>var menu = "+ sesion.getAttribute("menu")+"; var id_usuario = "+ sesion.getAttribute("id_usuario") +"; </script>");
            }else{
                out.write("<script>location.replace('index.jsp');</script>");
            }
        %>
        <!--dropdown1 usuario-->
        <ul id="dropdown1" class="dropdown-content">
            <li><img id="foto_perfil" src="images/yuna.jpg" class="foto-user"></li>
            <li><a href="#!">Reloj</a></li>
            <li class="divider"></li>
            <li><a href="index.jsp?cerrar=true">Cerrar Sesion</a></li>
        </ul>
        <!--barra de navegacion-->
        <nav>
            <div class="nav-wrapper">
                <a href="#" class="brand-logo"  data-target="slide-out"> <img src="image/12.png" class="logo-sicsa img_log"> </a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="#">Acceso</a></li>
                    <li><a href="#">Zoiper</a></li>
                    <!-- Dropdown Trigger usuario-->
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Emmanuel Medina<i class="material-icons right">arrow_drop_down</i></a></li>
                </ul>
                <input id="filtro" placeholder="Buscar" onkeyup="myFunction_buscar()" class="right" type="text" name="buscar">
            </div>
        </nav>
        <!--barra lateral del menu-->
        <ul id="slide-out" class="sidenav">
        </ul>
        <div id="resultado_menu" class="div-resultado hide">
            <div id="colect" class="collection">
            </div>
        </div>
        
        <div id="contenido" class="row"></div>
    </body>
    <script src="js/js/jquery-2.2.4.min.js"></script>
    <script src="js/js/materialize.min.js"></script>
    <script src="js/js/menu.js"></script>

</html>
