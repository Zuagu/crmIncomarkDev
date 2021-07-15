<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reglamento Interno</title>
        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <style>
            h3, h5{
                color: #8b1014;
            }
            h4{
                text-decoration: underline;
                text-decoration-color: #8b1014;
            }
            .size{
                font-size: 13px;
            }
            .margi{
                margin-left: 10px !important;
            }
            body{
                border-style: solid;
            }
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
            }

            td, th {
                border: 2px solid #000;
                text-align: left;
                padding: 8px;
                font-size: 11px;
            }
            @media print {
                .hide_print {
                    display: none!important;
                }
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row" style="padding-top:20px;">
                <h3 class="col s4 offset-s4 center-align"><b>Reglamento Interno</b></h3>
                <img src="images/SICSA.png" style="" class="col s2 offset-s1">
            </div>
            <div class="row" id="content">
                <div class="col s10 offset-s1 input-field" style="text-align:justify;">
                    <h4 class="center-align"><b>Personal General de GRUPO SICSA nos comprometeremos a</b></h4>
                    <br>
                    <p>
                        1. Llegar temprano a nuestras labores , recuerden que 2 retardos es 1 falta. Tendremos derecho a un retardo a la quincena menor a 15 minutos, 
                        después de los 15 minutos se considera falta (el supervisor será responsable de autorizar o negar la entrada). 
                        Se considera retardo a partir del minuto uno y en los cambios de turno sin previa autorización del supervisor.
                    </p>
                    <p>
                        2. Realizar nuestras gestiones en turno, de lo contrario no nos podremos retirar hasta terminarlas y no será tiempo extra.  
                        20 gestiones por hora.
                    </p>
                    <p>
                        3. Usar vestimenta  formal de lunes a  jueves , mujeres portar pantalón, blusa, falda o vestido formal 
                        ( no leggins, pantalones estilo pijama, capri, pesqueros, escotes, transparencias). Caballeros obligatorio pantalón, camisa y zapato de vestir 
                        (no zapato tipo tenis).
                        El viernes podrán anexar a su vestimenta formal pantalón de mezclilla y playera tipo polo, mujeres 
                        ( no leggins, pantalones estilo pijama, capri, pesqueros, escotes, transparencias). Caballeros (no zapato tipo tenis).
                        Los sábados podrán asistir casual, se permite portar tenis y playeras, pero sin caer en los excesos. 
                        (no tirantes, playeras sin manga, straples, pants,  pantalones rotos en exceso, chanclas, piercing o tatuajes visibles). 
                    </p>
                    <p>
                        4. No manejar aparatos de comunicación ajenos a la empresa (celulares, Nextel, ipods  y reproductores MP3) en el área de trabajo 
                        o sanitarios. 
                    </p>
                    <p>
                        5. No realizar llamadas de extensión a extensión con nuestros compañeros o hacer llamadas personales  
                        (solo se autorizan del teléfono del supervisor). 
                    </p>
                    <p>
                        6. Evitar permanecer tiempo excesivo fuera del área de trabajo (ir al baño, revisar cuentas con compañeros, permanecer de pie, 
                        tomar agua, etc.)             
                    </p>
                    <p>
                        7. Abstenerme de ingerir o tener cualquier tipo de comida dentro del call center. (solo se autorizan líquidos en termo o envase con tapa rosca).
                    </p>
                    <p>
                        8. No se permite el uso de palabras altisonantes ya que hay gente a nuestro alrededor y les puede perjudicar en su gestión. 
                    </p>
                    <p>
                        9. Las salidas al break las indica el supervisor y se deberá respetar el tiempo indicado. 
                    </p>
                    <p class="center-align">
                        <br>
                        <br>
                        _______________________________________________________________________ <br>
                                                      NOMBRE Y FIRMA
                    </p>
                    <h5 class="center-align">
                        Persona que Incurra en incumplimiento de alguno de los puntos anteriores será penalizado 
                        con un acta administrativa o suspensión. 
                    </h5>
                </div>    
            </div>
            <div class="row center-align">
                <a id="print" class="waves-effect waves-light btn pulse  hide_print" style="border-radius: 14px;margin-top: 14px;margin-left: 33px;;margin-right: 0px; background:#c60516;"><i class="material-icons" style="margin: -10px;">print</i></a>
            </div>
        </div>    
        <script type="text/javascript">
            //==================================================================
            $(document).ready(function () {
            });
            //==================================================================
            $("#print").on("click", function () {
                window.focus();
                window.print();

            });
        </script>
        <!--CORE JAVASCRIPT-->        
    </body>
</html>
