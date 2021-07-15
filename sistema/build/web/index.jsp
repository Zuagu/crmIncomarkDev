<%@page contentType="text/html" pageEncoding="UTF-8"%>                                                                                                                                                                                 
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>INCOMARK CRM</title>
        <!--icono de la pestaña del explorador-->
        <link rel="shortcut icon" href="image/logoInco.fw.png">
        <link rel="apple-touch-icon" href="">
        <link href="css/css/icons-material.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/login_1.css">
    </head>
    <!--hola soy emmaunel-->
    <body id="loginjsp" class="style">
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form id="solicitud"  name="solicitud" action="/sistema/solicitud.jsp" method="post">
                    <img  width="100%" src="image/incomark.png">
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>Registrate</span>
                    <input id="nombre_solicitante" type="text"  name="nombre_solicitante" placeholder="Nombre" />
                    <input id="email_solicitante" type="email"  name="email_solicitante"  placeholder="Email" />
                    <input id="telefono_solicitante" type="Telefono"   name="telefono_solicitante" placeholder="Telefono"/>
                    <!--<button id="iniciar_solicitud" class="z-depth-2">Enviar</button>-->
                    <a id="iniciar_solicitud" class="boton_login z-depth-2 hoverable">Enviar</a>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form id="login" class="" style="" name="login" action="/sistema/main.jsp" method="post">
                    <input id="ip" type="hidden">
                    <input id="id_perfil" name="id_perfil" type="hidden" value="2">
                    <img width="100%" src="image/incomark.png">
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>Inicia tu Sesion </span>
                    <input id="id_usuario" type="text" name="id_usuario" placeholder="Usuario" />
                    <input id="password" type="password" name="password" placeholder="Contraseña" />
                    <a href="#">Olivdaste tu contraseña?</a>
                    <!--<button id="iniciar_sesion" class="z-depth-2">Acceder</button>-->
                    <a id="iniciar_sesion" class="boton_login z-depth-2 hoverable">Acceder</a>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Regresa!</h1>
                        <p>Si ya tienes cuenta regresa para iniciar tu session</p>
                        <button class="ghost z-depth-2" id="signIn">Regresar</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Trabaja con Nosotros!</h1>
                        <p>Ingresa tu informacion para ser parte de nuesto Equipo</p>
                        <button class="ghost z-depth-2" id="signUp">Acceder</button>
                    </div>
                </div>
            </div>
        </div>
        <%
            //System.out.println(request.getSession().getAttribute("id_usuario"));

            if (request.getSession().getAttribute("id_usuario") != null) {
                out.write("<script> location.replace('" + request.getSession().getAttribute("puesto") + ".jsp'); </script>");
            }
        %>
        <script src="js/js/jquery-2.2.4.min.js"></script>
        <script src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/login.js"></script>
    </body>
</html>

