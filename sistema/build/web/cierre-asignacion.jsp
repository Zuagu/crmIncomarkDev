
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cierre Asignacion</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style.css">
    </head>
    <% 
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("id_usuario")!= null){
            out.write("<script>var menu = "+ sesion.getAttribute("menu")+"; var id_usuario = "+ sesion.getAttribute("id_usuario") +"; </script>");
        }else{
            out.write("<script>location.replace('index.jsp');</script>");
        }
    %>
    <body onbeforeunload="return Cerrar(<%out.write(""+sesion.getAttribute("id_usuario")); %>)">
        <jsp:include page="header.jsp" />
        
        <div class="row" id="contenido">
            
        </div>
    </body>
    <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/js/materialize.min.js"></script>
    <script src="js/js/Script.js"></script>
</html>
