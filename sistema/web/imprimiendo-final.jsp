<%-- 
    Document   : impriminedo-carteo
    Created on : 24/03/2018, 02:15:19 PM
    Author     : Luis Cortez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>


        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>        
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!--HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script>
        <script type="text/javascript" src="highcharts/exporting.js"></script> 
        <!--HIGHCHARTS-->


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-carteos.js"></script>
        <script type="text/javascript" src="js/arcade-variable-post.js"></script>


        <style>

        </style>

    </head>
    <body style="font-size:13px;">
        <!--BEGIN TITLE & BREADCRUMB PAGE-->

        <!--END TITLE & BREADCRUMB PAGE-->            

        <!--http://materializecss.com/ Guia Materialize-->               

        <!--BEGIN CONTENT--> 
        <!-- row linea si solo ocupas un div con la mitad o menos del tamaño pon un row siguiente y salta a la siguiente-->
        <!--Recuerda que la pantalla se divide en 12 dependiendo del col s que uses 12 como 100% -->
        <div class="row">
            <!--                <div class="col s6 offset-s1 z-depth-3">
                                <div class="input-field col s6">
                                    <select id="id_region"></select>
                                    <label>REGION</label>
                                </div>
                                <div class="input-field col s4">
                                    <select id="id_asignacion"></select>
                                    <label>ASIGNACION</label>
                                </div>
                                <div class="col s2 " style="height:53.5px; padding-top:7px">
                                    <a id="enviar" class="waves-effect waves-light btn blue" style="margin-left: 5px;width: 80px;"><i class="material-icons left">send</i></a> 
                                </div> 
                            </div>-->

            <div class="carta col s12">
                <div class="col s6" style="border-bottom:solid 1px black; height:100px;text-align: left;">
                    <img onclick="window.print()" src="images/logo-cliente-z.png" height="100%">
                </div>
                <div class="col s6" style="border-bottom:solid 1px black;height:100px;text-align: right;">
                    <p>
                       e-mail:#emailsicsa#<br>
                        Tels:#telefonosicsa#
                    </p>
                </div>
                <div class="col s6">
                    <p>
                        DEMANDADO:##<br>
                        DOMICILIO:#DOMICILIO# COLONIA:#colonia#<br>
                        CIUDAD:#CIUDAD# C.P.:#codigopostal#<br>
                        NO. CUENTA:#cuenta#<br>
                        SALDO AL CORTE:#total#
                    </P>
                </div>
                <div class="col s6">
                    <p>
                        #fecha#<br>
                        CONTROL:##<br>
                        CELULAR:#celular#
                    </p>
                </div>
                <div class="col s12 center-align">
                    <h5 style="text-decoration:underline;"><b>NOTIFICACIÓN FINAL</b></h5>
                </div>
                <div class="col s12">
                    <p style="text-align: justify">
                        Ante la negativa de pago a los diversos requerimientos hechos en su domicilio así como en teléfonos de contacto y el incumplimiento
                        al convenio realizado para el pago de su adeudo, por disposición de la empresa que representamos <b> Radio Móvil Dipsa, S.A. DE C.V.</b>,
                        le informamos que se procede a integrar expediente para escrito inicial en su contra, por lo que se le requiere se comunique dentro de las 24 hrs.
                        después de haber recibido esta notificación con la finalidad de informarle el avance de su procedimiento y garantizar su adeudo.
                    </p>
                    <p>
                        De no comunicarse se visitará de inmediato su domicilio para confirmar inspección ocular de bienes muebles e inmueblea, entendiéndonos
                        con la persona que se encuentre al momento de la visita y le exigiremos el pago inmediato tanto de la suerte principal como de los gastos
                        e intereses que se generen por la falta de pagos en esta cuenta:<b>#CUENTA#</b>que puede ser por un monto de hasta 3 veces el valor del contrato
                        para garantizar el cumplimiento de la obligación.
                    </p>
                    <p>
                        En caso de oposición a las prácticas ordenadas se le informa que a futuro se solicitarn las medidas de apremio necesarias para garantizar
                        el pago del adeudo y las costas.
                    </p>
                    <p>
                        Es por esa razón, que se le requiere el pago imediato de la cantidad que adeuda, ahora bien, entendiendo que la comunicación es acto importante, le solicitamos
                        que dentro del termino de 24 horas se comunique con nuestros asesores jurídicos a los números telefónicos impresos y aclaremos su situación
                        en el entendido que tendrá que regularizarse en el pago de su adeudo, evitando erogaciones de su parte por concepto de gastos, honorarios u otras prestaciones
                        que corresponden al despacho jurídico.

                    </p>
                    <p>
                        Le solicitamos se comunique con nosotros lo mas pronto posible, ya que, aun sin conocerle creemos que usted es una persona consciente, y en su caso para no 
                        distraerle mucho su tiempo le pedimos mencione el expendiente<b>_#EXPEDIENTE#</b>.
                    </p>
                    <p>
                        nota: todos los pagos deberán ser realizados antes de 48horas para poder respetar cualquier negociación.
                    </p>
                    <p>
                        <b>SI EN UN PLAZO MAYOR DE 24HRS NO REPORTA EL PAGO REALIZADO A ESTAS OFICINAS</b>  
                        <b style="text-decoration:underline;">DICHO PAGO SE TOMARA COMO PAGO PARCIAL"</b>
                    </p>
                </div>

                <div class="col s12 center-align">
                    <p>ATENTAMENTE<br>
                        Departamento de Recuperación Legal<br>
                        <br>
                        <b style="text-decoration:underline;">Tel.(81)19323834.</b><br>
                </div>

            </div>



            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->

        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                var _id_asignacion_visitador = obtener_variable_post('tel');
                alert(_id_asignacion_visitador);
            });
            //==================================================================
            $(".help").on("click", function () {
                var src = location.href;
                var aux;
                var jsp;
                aux = src.split('/sistema/');
                jsp = aux[1];
                jsp = jsp.replace('.jsp', '');
                window.open("ayuda.jsp?tema=" + jsp, "_blank");
            });
            //==================================================================
            $("#insert_xxyyzz").live("click", function () {
                insert_xxyyzz($("#xxyyzz_insert").val());
            });
            //==================================================================
            $(".delete_xxyyzz").live("click", function () {
                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_xxyyzz($(this).closest("tr").attr("id"));
                }
            });
            //==================================================================
            $("#id_cliente").change(function () {
                select_region_combo_materialize($("#id_cliente").val(), "id_region", true);
            });
            //==================================================================
            $("#id_region").change(function () {
                select_asignacion_region_combo_materialize($("#id_region").val(), 1, "id_asignacion");
            });
            //==================================================================
            $("#enviar").on("click", function () {
                if (_id_region !== 0) {
                    select_datos_carteo($("#id_asignacion").val(), "datos_carteo");
                }
            })
                    ;
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>