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
        <link rel="stylesheet" type="text/css" href="css/arcade-print-metricas.css">
        <!--MATERIALIZE-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-clientes.js"></script>
        <script type="text/javascript" src="js/arcade-region.js"></script>
        <script type="text/javascript" src="js/arcade-asignacion.js"></script>
        <script type="text/javascript" src="js/arcade-carteos.js"></script>
        <script type="text/javascript" src="js/arcade-variable-post.js"></script>
        <script type="text/javascript" src="js/arcade-visitas.js"></script>


        <style>
            label{font-size: 13px !important;}
            td{padding: 0px 14px!important;}
            .texto2{font-size:13px !important;;
            }
        </style>

    </head>
    <body style="font-size:13px">
        <!--BEGIN TITLE & BREADCRUMB PAGE-->

        <!--END TITLE & BREADCRUMB PAGE-->            

        <!--http://materializecss.com/ Guia Materialize-->               

        <!--BEGIN CONTENT--> 
        <!-- row linea si solo ocupas un div con la mitad o menos del tamaño pon un row siguiente y salta a la siguiente-->
        <!--Recuerda que la pantalla se divide en 12 dependiendo del col s que uses 12 como 100% -->
        <div class="row">

            <div class="carta col s12">
                <div class="col s6" style="border-bottom:solid 1px black; height:100px;text-align: left;">
                    <img onclick="window.print()" src="images/logo-cliente-z.png" height="100%">
                </div>
                <div class="col s6" style="border-bottom:solid 1px black;height:100px;text-align: right;">
                    <p>
                        e-mail: <label class="dato1"></label><br>
                        Tels: <label class="dato2"></label>
                        Fecha:<label class="dato22"></label>
                    </p>
                </div>
                <div class="col s12">
                    <p>
                        ESTIMADO(a): <label class="dato3"></label> <br>
                        RFC:<label class="dato4"></label> CUENTA: <label class="dato5"></label> <br>
                        DOMICILIO:<label class="dato6"></label> COLONIA:<label class="dato7"></label> <br>
                        CIUDAD:<label class="dato8"></label> C.P.: <label class="dato9"></label> <br>
                        LINEA:<label class="dato10"></label>  ADEUDO: <label class="dato11"></label>
                    </P>
                </div>
                 <div class="col s12">
                     <h4 class="center-align"><b style="text-decoration:underline;">PREVIA NOTIFICACION</b></h4>
                </div>
                <div class="col s12">
                    <p style="text-align: justify">
                        DEBIDO A QUE USTED NO ANTENDIÓ LOS REQUERIMIENTOS DE PAGO QUE EN FECHAS ANTERIORES SE LE HAN ENVIADO POR EL ADEUDO VENCIDO QUE PRESENTA
                        EN SU PLAN TARIFARO(TELCEL), SE LE NOTIFICA QUE SE PROCEDERÁ A EJERCER LA COBRANZA DE DICHA DEUDA POR MEDIO DE DEMANDA VÍA AFIANZADORA, DÁNDOSE POR ENTERADO
                        QUE YA SE ENCUENTRA BOLETINADO EN EL  <b style="text-decoration:underline;">BÚRO NACIONAL DE CRÉDITO</b> COMO PERSONA QUE NO CUMPLE CON SUS COMPROMISOS DE PAGO.
                    </p>
                </div>
                <div class="col s12"style="height:145px;">
                    <p style="text-align: justify">
                        POR LO TANTO, NOS VEMOS INSTADOS A REQUERIRLE DEL INMEDIATO PAGO TOTAL DEL ADEUDO VENCIDO, COMPUESTO DE PRINCIPAL Y SUERTES ACCESORIAS,
                        PARA QUE PASE AL CENTREO DE ATENCIÓN DE TELCEL HOY MISMO O SU DÍA INMEDIATO HÁBIL A LIQUIDAR PARA EVITAR LA DEMANDA POR MEDIO DE LA AFIANZADORA
                      
                    </p>
                </div>
                <div class="col s12" style="height:200px;">
                    <p><b style="text-decoration:underline;">
                            EVÍTESE UN PROBLEMA Y LA PENA MORAL DE VERSE PRESIONADO POR SU UNCUMPLIMIENTO DE PAGO EN EL CONTRATO DE SU LÍNE TELCEL, PUES NOSOTROS AÚN
                            CREEMOS EN LA HONORABILIDAD DE LAS PERSONAS Y SUS ACTOS DE COMERCIO Y SIEMPRE ESTAMOS DISPUESTOS A UN ARREGLO PERTINENTE. CUMPLA CON SUS OBLIGACIONES DE PAGO,
                        </b></p>
                </div>
                <div>
                    <img>
                </div>
                <div class="col s12 center-align">
                    <p>ATENTAMENTE<br>
                        Departamento de Recuperación Legal<br>
                        <label class="dato13"></label> <br>
                        (Teléfono Monterrey y Área Metropolitana)</p>
                </div>
                <div class="col s12">
                    <p style="text-align: justify">
                        <b>NOTA:</b> FAVOR DE HACER CASO OMISO EN CASO DE HABER YA REALIZADO EL PAGO SOLICITADO EN LA PRESENTE. NUESTROS 
                        REPRESENTANTES NO ESTARÁN AUTORIZADOS A RECIBIR EFECTIVO, EL PAGO DEBERA REALIZARSE EN CENTROS DE ATENCION TELCEL.
                    </p>
                </div>
            </div>

            <br>
            <div>

            </div>
            <div class="carta col s12 texto2" style="margin-top:100px;">
                <div class="col s6" style="text-align: left;">
                    <p>
                        Nombre:<label class="dato3"></label><br>
                        Dirección:<label class="dato6"></label> <br>
                        Colonia:<label class="dato7"></label> <br>
                        Ciudad: <label class="dato8"></label><br>
                        Cuenta:<label class="dato5"></label> <br>Expediente:<label class="dato14"></label> <br>
                    </p>
                </div>
                <div class="col s6" style="text-align: left;">
                    <p>
                        Asign: <label class="dato15"></label> <br>
                        Usuario:<label class="dato16"></label> <br>
                        Estatus:<label class="dato17"></label> <br>
                        Saldo: <label class="dato18"></label> <br>
                        Multa: <label class="dato19"></label> <br>
                        Total: <label class="dato20"></label> <br>
                        Saldo Act:<label class="dato21"></label> <br>
                    </p>
                </div>

                <div class="col s12">
                    <div class="col s6 intro-text">
                        <b>1.- CONTACTO</b> <br>   
                        <form action="#">
                            <p>
                                <input type="checkbox" id="test5"/>
                                <label for="test5">201 Promesa de pago / Convenio </label>
                                <br>
                                <input type="checkbox" id="test6"/>
                                <label for="test6">202 Titular ya realizó el pago</label>
                                <br>
                                <input type="checkbox" id="test7"/>
                                <label for="test7">203 Titular no reconoce el adeudo</label>
                                <br>
                                <input type="checkbox" id="test8"/>
                                <label for="test8">204 Deudor está en desacuerdo con adeudo</label>
                                <br>
                                <input type="checkbox" id="test9"/>
                                <label for="test9">205 Notificación con Familiar</label>
                                <br>
                                <input type="checkbox" id="test1"/>
                                <label for="test1">206 Notificación con Familiar/Tercero()</label>
                                <br>
                                <input type="checkbox" id="test2"/>
                                <label for="test2">207 Deudor Falleció</label>
                                <br>
                                <input type="checkbox" id="test3"/>
                                <label for="test3">208 Se niegan a recibir notificación</label>
                                <br>
                                <input type="checkbox" id="test4"/>
                                <label for="test4">215 Titular no define pago</label>
                                <br>
                            </p>   
                        </form>
                    </div>
                    <div class="col s6 intro-text">
                        <b>2.- NO CONTACTO</b> <br>
                        <form action="#">
                            <p>
                                <input type="checkbox" id="test11"/>
                                <label for="test11">209 Notificación en puerta</label>
                                <br>
                                <input type="checkbox" id="test12"/>
                                <label for="test12">210 No reconocen a Deudor </label>
                                <br>

                                <br>
                                <b>3.- ILOCALIZABLE</b><br>
                                <input type="checkbox" id="test13"/>
                                <label for="test13">211 Inmueble deshabitado</label>
                                <br>
                                <input type="checkbox" id="test14"/>
                                <label for="test14"> 212 No se localiza domicilio</label>
                                <br>
                                <input type="checkbox" id="test15"/>
                                <label for="test15"> 213 Zona de Riesgo</label>
                                <br>
                                <input type="checkbox" id="test16"/>
                                <label for="test16">214 Casa de Renta(Ya no vive en Domicilio)</label>
                                <br>
                            </p>
                        </form>
                    </div>

                    <div class="col s12">
                        <table>
                            <thead>
                                <tr>
                                    <th><b>TIPO INMUEBLE</b><br></th>
                                    <th><b><b>CARACTERISITICAS</b></b><br></th>
                                    <th><b>COMENTARIOS</b><br></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" id="test16"/>
                                        <label for="test16">Casa</label>
                                    </td>
                                    <td>
                                        Color:<input  style="width: 272px;height: 1rem;" type="text">
                                    </td>
                                    <td>
                                        <input style="height: .7rem;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" id="test17"/>
                                        <label for="test17">Vecindad</label>
                                    </td>
                                    <td>
                                        No. Pisos:<input  style="width: 243px;height: 1rem;" type="text">
                                    </td>
                                    <td>
                                        <input style="height: .7rem;">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" id="test18"/>
                                        <label for="test18">Departamento</label>
                                    </td>
                                    <td>
                                        No. Ventanas<input  style="width: 243px;height: 1rem;" type="text">
                                    </td>
                                    <td>
                                        <input style="height: .7rem;">
                                    </td>
                                </tr>    
                                <tr>
                                    <td>
                                        <input type="checkbox" id="test19"/>
                                        <label for="test19">Oficina/Negocio</label>

                                        <br>
                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <input style="height: .7rem;">
                                    </td>
                                </tr>  
                                <tr>
                                    <td>
                                        <input type="checkbox" id="test20"/>
                                        <label for="test20">Otro</label>
                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <input style="height: .7rem;">
                                    </td>
                                </tr> 
                            </tbody>
                        </table>


                        <br>
                        <div class="col s12 ceter-align" style="text-align:center;">

                            <b>INFORMACION ADICIONAL</b>
                        </div>
                        <div class="col s6">
                            Domicilio:<input  style="height: 1rem;" type="text"><br>
                            Telèfono:<input  style="height: 1rem;" type="text"><br>
                            Nombre y parentesco de quien proporciona info:
                            <input  style="height: 1rem;" type="text"><br>
                            Núm Medidor:<input  style="height: 1rem;width: " type="text"><br>
                            Servicio:<input  style="height: 1rem;" type="text"><br>
                            Ejecutivo de Campo:<input  style="height: 1rem;" type="text"><br>
                            Fecha y Hora:<input  style="height: 1rem;" type="text"><br>
                            Confirmaciòn del domicilio con Vecino:<input  style="height: 1rem;" type="text">
                        </div>
                        <div class="col s6" style="text-align:center;">
                            <div>
                                <b>MAPA DE UBICACIÓN:</b>
                            </div>    
                            <div style="border:solid 1px black;">
                                <img src="images/croquis-visita.png" alt="croquis-visitas"  width="100%"> 
                            </div>
                        </div>
                        <div class="col s12" style="text-align: center; margin-top:13px;">
                            *****(RECUERDA)QUE LOS CONVENIOS NO DEBEN SER MAYORES A 48HRS *****
                        </div>
                        <div class="col s12" style="text-align: center;">
                            <div class="col s3 offset-s2">F1Visita:<input   style="width: 50%;height: 1rem;"type="text"><br></div>
                            <div class="col s3">F2Visita:<input   style="width: 50%;height: 1rem;"type="text"><br></div>
                            <div class="col s3">F3Visita:<input   style="width: 50%;height: 1rem;"type="text"><br></div>
                        </div>
                    </div>
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
                alert(window.location.search.substring(1));
                var datos = window.location.search.substring(1);
                select_cadena_datos_carta_visita(datos);
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
