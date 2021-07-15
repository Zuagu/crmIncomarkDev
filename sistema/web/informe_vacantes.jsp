<%-- 
    Document   : informe_vacantes
    Created on : 25/01/2019, 12:32:51 PM
    Author     : Soportec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ERP</title>

        <!---cambio--->
        <!--ICONS PARA MATERIALIZE-->
        <link rel="shortcut icon" href="http://leimihost.com/mx/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="css/arcade-style-frame.css" media="screen">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--ICONS PARA MATERIALIZE-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>  
        <!--        <script type="text/javascript" src="path_to/jquery.leanModal.min.js"></script>-->
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <script type="text/javascript" src="js/arcade-solicitud.js"></script>

        <style>
            .row {
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 5px;
            }
            .font_size{
                font-family:"Courier New",Courier, monospace; 
                font-size:70%;
                border: black solid 2px;
            }
            th,td{
                padding: 1px 4px;
                border-left: black solid 1px;
                border-bottom: black solid 1px;
                text-align: center; 
                vertical-align: middle;
            }
            caption{
                border-left: black solid 2px;
                border-right: black solid 2px;
                border-top: black solid 2px;
            }
            .resalt{
                background-color: #bdbdbd ;
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
            <div class="row center-align">
                <h5>INFORMES DE VACANTES</h5>
                <hr>
                <div id='rango_fecha'>
                </div>
            </div>
            <div class="row">
                <div class="col s3 offset-s1">
                    <table class="font_size highlight">
                        <caption>ENTREVISTAS</caption>
                        <thead>
                            <tr>
                                <th>Medio de Contacto</th>
                                <th>Cantidad</th>
                                <th>Promedio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Publicidad Fija</td>
                                <td id="cantidad_pub_entr"></td>
                                <td id="prom_pub_entr"></td>
                            </tr>
                            <tr>
                                <td>Bolsas Electronicas</td>
                                <td id="cantidad_bole_entr"></td>
                                <td id="prom_bole_entr"></td>
                            </tr>
                            <tr>
                                <td>Trabajo en Campo</td>
                                <td id="cantidad_trab_entr"></td>
                                <td id="prom_trab_entr"></td>
                            </tr>
                            <tr>
                                <td>Redes Sociales</td>
                                <td id="cantidad_red_entr"></td>
                                <td id="prom_red_entr"></td>
                            </tr>
                            <tr>
                                <td>Otros</td>
                                <td id="cantidad_otros_entr"></td>
                                <td id="prom_otros_entr"></td>
                            </tr>
                            <tr>
                                <td>Escuelas</td>
                                <td id="cantidad_esc_entr"></td>
                                <td id="prom_esc_entr"></td>
                            </tr>
                            <tr>
                                <td>Periodico</td>
                                <td id="cantidad_per_entr"></td>
                                <td id="prom_per_entr"></td>
                            </tr>
                            <tr>
                                <td>Bolsas Municipales</td>
                                <td id="cantidad_bolm_entr"></td>
                                <td id="prom_bolm_entr"></td>
                            </tr>
                            <tr>
                                <td>Intercambio De Bolsas</td>
                                <td id="cantidad_inter_entr"></td>
                                <td id="prom_inter_entr"></td>
                            </tr>
                            <!-- agregado por emmanuel -->
                            <tr>
                                <td>Outsourcing</td>
                                <td id="cantidad_outsour_entr"></td>
                                <td id="prom_outsour_entr"></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th id="cant_tot_entr"></th>
                                <th id="prom_tot_entr"></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>    
                <div class="col s3 offset-s2">
                    <table class="font_size highlight">
                        <caption>INGRESOS</caption>
                        <thead>
                            <tr>
                                <th>Medio de Contacto</th>
                                <th>Cantidad</th>
                                <th>Promedio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Publicidad Fija</td>
                                <td id="cantidad_pub_ingre"></td>
                                <td id="prom_pub_ingre"></td>
                            </tr>
                            <tr>
                                <td>Bolsas Electronicas</td>
                                <td id="cantidad_bole_ingre"></td>
                                <td id="prom_bole_ingre"></td>
                            </tr>
                            <tr>
                                <td>Trabajo en Campo</td>
                                <td id="cantidad_trab_ingre"></td>
                                <td id="prom_trab_ingre"></td>
                            </tr>
                            <tr>
                                <td>Redes Sociales</td>
                                <td id="cantidad_red_ingre"></td>
                                <td id="prom_red_ingre"></td>
                            </tr>
                            <tr>
                                <td>Otros</td>
                                <td id="cantidad_otros_ingre"></td>
                                <td id="prom_otros_ingre"></td>
                            </tr>
                            <tr>
                                <td>Escuelas</td>
                                <td id="cantidad_esc_ingre"></td>
                                <td id="prom_esc_ingre"></td>
                            </tr>
                            <tr>
                                <td>Periodico</td>
                                <td id="cantidad_per_ingre"></td>
                                <td id="prom_per2_ingre"></td>
                            </tr>
                            <tr>
                                <td>Bolsas Municipales</td>
                                <td id="cantidad_bolm_ingre"></td>
                                <td id="prom_bolm_ingre"></td>
                            </tr>
                            <tr>
                                <td>Intercambio De Bolsas</td>
                                <td id="cantidad_inter_ingre"></td>
                                <td id="prom_inter_ingre"></td>
                            </tr>
                            <!-- agregado por emmanuel -->
                            <tr>
                                <td>Outsourcing</td>
                                <td id="cantidad_outsour_ingre"></td>
                                <td id="prom_outsour_ingre"></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th id="cant_tot_ingre"></th>
                                <th id="prom_tot_ingre"></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>    
                <div class="col s1 offset-s2">
                    <a id="print" class="waves-effect waves-light btn hide_print" style="border-radius: 14px;background:#c60516;"><i class="material-icons" style="margin: -10px;">print</i></a>
                </div>    
            </div>
            <div class="row">
                <div class="col s4 offset-s1">
                    <table class="font_size">
                        <thead>
                            <tr>
                                <th>Medio de Contacto</th>
                                <th>Programados</th>
                                <th>Entrevistados</th>
                                <th>Promedio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr Class="resalt">
                                <td><b>PUBLICIDAD FIJA</b></td>
                                <td id="proga_entr_publi"></td>
                                <td id="entrevist_entr_publi"></td>
                                <td id="promedio_entr_publi"></td>
                            </tr>
                            <tr>
                                <td>Anuncio Ventana</td>
                                <td id="proga_entr_publi1"></td>
                                <td id="entrevist_entr_publi1"></td>
                                <td id="promedio_entr_publi1"></td>
                            </tr>
                            <tr>
                                <td>Banner</td>
                                <td id="proga_entr_publi2"></td>
                                <td id="entrevist_entr_publi2"></td>
                                <td id="promedio_entr_publi2"></td>
                            </tr>
                            <tr Class="resalt">
                                <td><b>BOLSAS ELECTRONICAS</b></td>
                                <td id="proga_entr_bolse"></td>
                                <td id="entrevist_entr_blose"></td>
                                <td id="promedio_entr_bolse"></td>
                            </tr>
                            <tr>
                                <td>Computrabajo</td>
                                <td id="proga_entr_bolse1"></td>
                                <td id="entrevist_entr_bolse1"></td>
                                <td id="promedio_entr_bolse1"></td>
                            </tr>
                            <tr>
                                <td>Indeed</td>
                                <td id="proga_entr_bolse2"></td>
                                <td id="entrevist_entr_bolse2"></td>
                                <td id="promedio_entr_bolse2"></td>
                            </tr>   
                            <tr>
                                <td>Talenteca</td>
                                <td id="proga_entr_bolse3"></td>
                                <td id="entrevist_entr_bolse3"></td>
                                <td id="promedio_entr_bolse3"></td>
                            </tr>   
                            <tr Class="resalt">
                                <td><b>TRABAJO EN CAMPO</b></td>
                                <td id="proga_entr_trab"></td>
                                <td id="entrevist_entr_trab"></td>
                                <td id="promedio_entr_trab"></td>
                            </tr>
                            <tr>
                                <td>Brigada Monterrey</td>
                                <td id="proga_entr_trab1"></td>
                                <td id="entrevist_entr_trab1"></td>
                                <td id="promedio_entr_trab1"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo Guadalupe</td>
                                <td id="proga_entr_trab2"></td>
                                <td id="entrevist_entr_trab2"></td>
                                <td id="promedio_entr_trab2"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo San Nicolas</td>
                                <td id="proga_entr_trab3"></td>
                                <td id="entrevist_entr_trab3"></td>
                                <td id="promedio_entr_trab3"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo Escobedo</td>
                                <td id="proga_entr_trab4"></td>
                                <td id="entrevist_entr_trab4"></td>
                                <td id="promedio_entr_trab4"></td>
                            </tr>
                            <tr>
                                <td>Volanteo</td>
                                <td id="proga_entr_trab5"></td>
                                <td id="entrevist_entr_trab5"></td>
                                <td id="promedio_entr_trab5"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo</td>
                                <td id="proga_entr_trab6"></td>
                                <td id="entrevist_entr_trab6"></td>
                                <td id="promedio_entr_trab6"></td>
                            </tr>
                            <tr>
                                <td>Posteo</td>
                                <td id="proga_entr_trab7"></td>
                                <td id="entrevist_entr_trab7"></td>
                                <td id="promedio_entr_trab7"></td>
                            </tr>
                            <tr Class="resalt">
                                <td><b>REDES SOCIALES</b></td>
                                <td id="proga_entr_red"></td>
                                <td id="entrevist_entr_red"></td>
                                <td id="promedio_entr_red"></td>
                            </tr>
                            <tr>
                                <td>Facebook(Personal)</td>
                                <td id="proga_entr_red1"></td>
                                <td id="entrevist_entr_red1"></td>
                                <td id="promedio_entr_red1"></td>
                            </tr>
                            <tr>
                                <td>Facebook(Sicsa)</td>
                                <td id="proga_entr_red2"></td>
                                <td id="entrevist_entr_red2"></td>
                                <td id="promedio_entr_red2"></td>
                            </tr>
                            <tr Class="resalt">
                                <td><b>Otros</b></td>
                                <td id="proga_entr_otros"></td>
                                <td id="entrevist_entr_otros"></td>
                                <td id="promedio_entr_otros"></td>
                            </tr>
                            <tr>
                                <td>Recomendacion</td>
                                <td id="proga_entr_otros1"></td>
                                <td id="entrevist_entr_otros1"></td>
                                <td id="promedio_entr_otros1"></td>
                            </tr>
                            <tr>
                                <td>Ref. Conocido</td>
                                <td id="proga_entr_otros2"></td>
                                <td id="entrevist_entr_otros2"></td>
                                <td id="promedio_entr_otros2"></td>
                            </tr>
                            <tr>
                                <td>Reingreso</td>
                                <td id="proga_entr_otros3"></td>
                                <td id="entrevist_entr_otros3"></td>
                                <td id="promedio_entr_otros3"></td>
                            </tr>
                            <tr Class="resalt">
                                <td><b>ESCUELAS</b></td>
                                <td id="proga_entr_esc"></td>
                                <td id="entrevist_entr_esc"></td>
                                <td id="promedio_entr_esc"></td>
                            </tr>
                            <tr>
                                <td>UANL</td>
                                <td id="proga_entr_esc1"></td>
                                <td id="entrevist_entr_esc1"></td>
                                <td id="promedio_entr_esc1"></td>
                            </tr>
                            <tr>
                                <td>UMM</td>
                                <td id="proga_entr_esc2"></td>
                                <td id="entrevist_entr_esc2"></td>
                                <td id="promedio_entr_esc2"></td>
                            </tr>
                            <tr Class="resalt">
                                <td><b>PERIODICO</b></td>
                                <td id="proga_entr_per"></td>
                                <td id="entrevist_entr_per"></td>
                                <td id="promedio_entr_per"></td>
                            </tr>
                            <tr>
                                <td>El Metro</td>
                                <td id="proga_entr_per1"></td>
                                <td id="entrevist_entr_per1"></td>
                                <td id="promedio_entr_per1"></td>
                            </tr>
                            <tr>
                                <td>El Norte</td>
                                <td id="proga_entr_per2"></td>
                                <td id="entrevist_entr_per2"></td>
                                <td id="promedio_entr_per2"></td>
                            </tr>
                            <tr>
                                <td>El Sol de Puebla</td>
                                <td id="proga_entr_per3"></td>
                                <td id="entrevist_entr_per3"></td>
                                <td id="promedio_entr_per3"></td>
                            </tr>
                            <tr Class="resalt">
                                <td><b>BOLSAS MUNICIPALES</b></td>
                                <td id="proga_entr_bolm"></td>
                                <td id="entrevist_entr_bolm"></td>
                                <td id="promedio_entr_bolm"></td>
                            </tr>
                            <tr>
                                <td>San Pedro</td>
                                <td id="proga_entr_bolm1"></td>
                                <td id="entrevist_entr_bolm1"></td>
                                <td id="promedio_entr_bolm1"></td>
                            </tr>
                            <tr>
                                <td>Monterrey</td>
                                <td id="proga_entr_bolm2"></td>
                                <td id="entrevist_entr_bolm2"></td>
                                <td id="promedio_entr_bolm2"></td>
                            </tr>
                            <tr>
                                <td>Escobedo</td>
                                <td id="proga_entr_bolm3"></td>
                                <td id="entrevist_entr_bolm3"></td>
                                <td id="promedio_entr_bolm3"></td>
                            </tr>
                            <tr>
                                <td>Apodaca</td>
                                <td id="proga_entr_bolm4"></td>
                                <td id="entrevist_entr_bolm4"></td>
                                <td id="promedio_entr_bolm4"></td>
                            </tr>
                            <tr>
                                <td>San Nicolas</td>
                                <td id="proga_entr_bolm5"></td>
                                <td id="entrevist_entr_bolm5"></td>
                                <td id="promedio_entr_bolm5"></td>
                            </tr>
                            <tr>
                                <td>Guadalupe</td>
                                <td id="proga_entr_bolm6"></td>
                                <td id="entrevist_entr_bolm6"></td>
                                <td id="promedio_entr_bolm6"></td>
                            </tr>
                            <tr Class="resalt">
                                <td><b>INTERCAMBIO DE BOLSAS</b></td>
                                <td id="proga_entr_inter"></td>
                                <td id="entrevist_entr_inter"></td>
                                <td id="promedio_entr_inter"></td>
                            </tr>
                            <tr>
                                <td>Intercambio de Cartera</td>
                                <td id="proga_entr_inter1"></td>
                                <td id="entrevist_entr_inter1"></td>
                                <td id="promedio_entr_inter1"></td>
                            </tr>
                            <!-- agregado por emmanuel-->
                            <tr Class="resalt">
                                <td><b>OUTSOURCING</b></td>
                                <td id="proga_entr_outsour"></td>
                                <td id="entrevist_entr_outsour"></td>
                                <td id="promedio_entr_outsour"></td>
                            </tr>
                            <tr>
                                <td>Empresa</td>
                                <td id="proga_entr_outsour1"></td>
                                <td id="entrevist_entr_outsour1"></td>
                                <td id="promedio_entr_outsour1"></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th id="prog_tot_entr2"></th>
                                <th id="cant_tot_entr2"></th>
                                <th id="prom_tot_entr2"></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>    
                <div class="col s5 offset-s1">
                    <table class="font_size">
                        <thead>
                            <tr>
                                <th>Medio de Contacto</th>
                                <th>Programados</th>
                                <th>Promedio</th>
                                <th>Ingresaron</th>
                                <th>Promedio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr Class="resalt">
                                <td>PUBLICIDAD FIJA</td>
                                <td id="proga_ingr_publi"></td>
                                <td id="prom_ingr_publi"></td>
                                <td id="ingresaron_ingr_publi"></td>
                                <td id="promedio_ingr_publi"></td>
                            </tr>
                            <tr>
                                <td>Anuncio Ventana</td>
                                <td id="proga_ingr_publi1"></td>
                                <td id="prom_ingr_publi1"></td>
                                <td id="ingresaron_ingr_publi1"></td>
                                <td id="promedio_ingr_publi1"></td>
                            </tr>
                            <tr>
                                <td>Banner</td>
                                <td id="proga_ingr_publi2"></td>
                                <td id="prom_ingr_publi2"></td>
                                <td id="ingresaron_ingr_publi2"></td>
                                <td id="promedio_ingr_publi2"></td>
                            </tr>
                            <tr Class="resalt">
                                <td>BOLSAS ELECTRONICAS</td>
                                <td id="proga_ingr_bolse"></td>
                                <td id="prom_ingr_bolse"></td>
                                <td id="ingresaron_ingr_bolse"></td>
                                <td id="promedio_ingr_bolse"></td>
                            </tr>
                            <tr>
                                <td>Computrabajo</td>
                                <td id="proga_ingr_bolse1"></td>
                                <td id="prom_ingr_bolse1"></td>
                                <td id="ingresaron_ingr_bolse1"></td>
                                <td id="promedio_ingr_bolse1"></td>
                            </tr>
                            <tr>
                                <td>Indeed</td>
                                <td id="proga_ingr_bolse2"></td>
                                <td id="prom_ingr_bolse2"></td>
                                <td id="ingresaron_ingr_bolse2"></td>
                                <td id="promedio_ingr_bolse2"></td>
                            </tr>   
                            <tr>
                                <td>Talenteca</td>
                                <td id="proga_ingr_bolse3"></td>
                                <td id="prom_ingr_bolse3"></td>
                                <td id="ingresaron_ingr_bolse3"></td>
                                <td id="promedio_ingr_bolse3"></td>
                            </tr>   
                            <tr Class="resalt">
                                <td>TRABAJO EN CAMPO</td>
                                <td id="proga_ingr_trab"></td>
                                <td id="prom_ingr_trab"></td>
                                <td id="ingresaron_ingr_trab"></td>
                                <td id="promedio_ingr_trab"></td>
                            </tr>
                            <tr>
                                <td>Brigada Monterrey</td>
                                <td id="proga_ingr_trab1"></td>
                                <td id="prom_ingr_trab1"></td>
                                <td id="ingresaron_ingr_trab1"></td>
                                <td id="promedio_ingr_trab1"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo Guadalupe</td>
                                <td id="proga_ingr_trab2"></td>
                                <td id="prom_ingr_trab2"></td>
                                <td id="ingresaron_ingr_trab2"></td>
                                <td id="promedio_ingr_trab2"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo San Nicolas</td>
                                <td id="proga_ingr_trab3"></td>
                                <td id="prom_ingr_trab3"></td>
                                <td id="ingresaron_ingr_trab3"></td>
                                <td id="promedio_ingr_trab3"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo Escobedo</td>
                                <td id="proga_ingr_trab4"></td>
                                <td id="prom_ingr_trab4"></td>
                                <td id="ingresaron_ingr_trab4"></td>
                                <td id="promedio_ingr_trab4"></td>
                            </tr>
                            <tr>
                                <td>Volanteo</td>
                                <td id="proga_ingr_trab5"></td>
                                <td id="prom_ingr_trab5"></td>
                                <td id="ingresaron_ingr_trab5"></td>
                                <td id="promedio_ingr_trab5"></td>
                            </tr>
                            <tr>
                                <td>Feria Empleo</td>
                                <td id="proga_ingr_trab6"></td>
                                <td id="prom_ingr_trab6"></td>
                                <td id="ingresaron_ingr_trab6"></td>
                                <td id="promedio_ingr_trab6"></td>
                            </tr>
                            <tr>
                                <td>Posteo</td>
                                <td id="proga_ingr_trab7"></td>
                                <td id="prom_ingr_trab7"></td>
                                <td id="ingresaron_ingr_trab7"></td>
                                <td id="promedio_ingr_trab7"></td>
                            </tr>
                            <tr Class="resalt">
                                <td>REDES SOCIALES</td>
                                <td id="proga_ingr_red"></td>
                                <td id="prom_ingr_red"></td>
                                <td id="ingresaron_ingr_red"></td>
                                <td id="promedio_ingr_red"></td>
                            </tr>
                            <tr>
                                <td>Facebook(Personal)</td>
                                <td id="proga_ingr_red1"></td>
                                <td id="prom_ingr_red1"></td>
                                <td id="ingresaron_ingr_red1"></td>
                                <td id="promedio_ingr_red1"></td>
                            </tr>
                            <tr>
                                <td>Facebook(Sicsa)</td>
                                <td id="proga_ingr_red2"></td>
                                <td id="prom_ingr_red2"></td>
                                <td id="ingresaron_ingr_red2"></td>
                                <td id="promedio_ingr_red2"></td>
                            </tr>
                            <tr Class="resalt">
                                <td>Otros</td>
                                <td id="proga_ingr_otros"></td>
                                <td id="prom_ingr_otros"></td>
                                <td id="ingresaron_ingr_otros"></td>
                                <td id="promedio_ingr_otros"></td>
                            </tr>
                            <tr>
                                <td>Recomendacion</td>
                                <td id="proga_ingr_otros1"></td>
                                <td id="prom_ingr_otros1"></td>
                                <td id="ingresaron_ingr_otros1"></td>
                                <td id="promedio_ingr_otros1"></td>
                            </tr>
                            <tr>
                                <td>Ref. Conocido</td>
                                <td id="proga_ingr_otros2"></td>
                                <td id="prom_ingr_otros2"></td>
                                <td id="ingresaron_ingr_otros2"></td>
                                <td id="promedio_ingr_otros2"></td>
                            </tr>
                            <tr>
                                <td>Reingreso</td>
                                <td id="proga_ingr_otros3"></td>
                                <td id="prom_ingr_otros3"></td>
                                <td id="ingresaron_ingr_otros3"></td>
                                <td id="promedio_ingr_otros3"></td>
                            </tr>
                            <tr Class="resalt">
                                <td>ESCUELAS</td>
                                <td id="proga_ingr_esc"></td>
                                <td id="prom_ingr_esc"></td>
                                <td id="ingresaron_ingr_esc"></td>
                                <td id="promedio_ingr_esc"></td>
                            </tr>
                            <tr>
                                <td>UANL</td>
                                <td id="proga_ingr_esc1"></td>
                                <td id="prom_ingr_esc1"></td>
                                <td id="ingresaron_ingr_esc1"></td>
                                <td id="promedio_ingr_esc1"></td>
                            </tr>
                            <tr>
                                <td>UMM</td>
                                <td id="proga_ingr_esc2"></td>
                                <td id="prom_ingr_esc2"></td>
                                <td id="ingresaron_ingr_esc2"></td>
                                <td id="promedio_ingr_esc2"></td>
                            </tr>
                            <tr Class="resalt">
                                <td>PERIODICO</td>
                                <td id="proga_ingr_per"></td>
                                <td id="prom_ingr_per"></td>
                                <td id="ingresaron_ingr_per"></td>
                                <td id="promedio_ingr_per"></td>
                            </tr>
                            <tr>
                                <td>El Metro</td>
                                <td id="proga_ingr_per1"></td>
                                <td id="prom_ingr_per1"></td>
                                <td id="ingresaron_ingr_per1"></td>
                                <td id="promedio_ingr_per1"></td>
                            </tr>
                            <tr>
                                <td>El Norte</td>
                                <td id="proga_ingr_per2"></td>
                                <td id="prom_ingr_per2"></td>
                                <td id="ingresaron_ingr_per2"></td>
                                <td id="promedio_ingr_per2"></td>
                            </tr>
                            <tr>
                                <td>El Sol de Puebla</td>
                                <td id="proga_ingr_per3"></td>
                                <td id="prom_ingr_per3"></td>
                                <td id="ingresaron_ingr_per3"></td>
                                <td id="promedio_ingr_per3"></td>
                            </tr>
                            <tr Class="resalt">
                                <td>BOLSAS MUNICIPALES</td>
                                <td id="proga_ingr_bolm"></td>
                                <td id="prom_ingr_bolm"></td>
                                <td id="ingresaron_ingr_bolm"></td>
                                <td id="promedio_ingr_bolm"></td>
                            </tr>
                            <tr>
                                <td>San Pedro</td>
                                <td id="proga_ingr_bolm1"></td>
                                <td id="prom_ingr_bolm1"></td>
                                <td id="ingresaron_ingr_bolm1"></td>
                                <td id="promedio_ingr_bolm1"></td>
                            </tr>
                            <tr>
                                <td>Monterrey</td>
                                <td id="proga_ingr_bolm2"></td>
                                <td id="prom_ingr_bolm2"></td>
                                <td id="ingresaron_ingr_bolm2"></td>
                                <td id="promedio_ingr_bolm2"></td>
                            </tr>
                            <tr>
                                <td>Escobedo</td>
                                <td id="proga_ingr_bolm3"></td>
                                <td id="prom_ingr_bolm3"></td>
                                <td id="ingresaron_ingr_bolm3"></td>
                                <td id="promedio_ingr_bolm3"></td>
                            </tr>
                            <tr>
                                <td>Apodaca</td>
                                <td id="proga_ingr_bolm4"></td>
                                <td id="prom_ingr_bolm4"></td>
                                <td id="ingresaron_ingr_bolm4"></td>
                                <td id="promedio_ingr_bolm4"></td>
                            </tr>
                            <tr>
                                <td>San Nicolas</td>
                                <td id="proga_ingr_bolm5"></td>
                                <td id="prom_ingr_bolm5"></td>
                                <td id="ingresaron_ingr_bolm5"></td>
                                <td id="promedio_ingr_bolm5"></td>
                            </tr>
                            <tr>
                                <td>Guadalupe_bolm</td>
                                <td id="proga_ingr_bolm6"></td>
                                <td id="prom_ingr_bolm6"></td>
                                <td id="ingresaron_ingr_bolm6"></td>
                                <td id="promedio_ingr_bolm6"></td>
                            </tr>
                            <tr Class="resalt">
                                <td>INTERCAMBIO DE BOLSAS</td>
                                <td id="proga_ingr_inter"></td>
                                <td id="prom_ingr_inter"></td>
                                <td id="ingresaron_ingr_inter"></td>
                                <td id="promedio_ingr_inter"></td>
                            </tr>
                            <tr>
                                <td>Intercambio de Cartera</td>
                                <td id="proga_ingr_inter1"></td>
                                <td id="prom_ingr_inter1"></td>
                                <td id="ingresaron_ingr_inter1"></td>
                                <td id="promedio_ingr_inter1"></td>
                            </tr>
                            <!-- agregado por emmanuel-->
                            <tr Class="resalt">
                                <td><b>OUTSOURCING</b></td>
                                <td id="proga_ingr_outsour"></td>
                                <td id="prom_ingr_outsour"></td>
                                <td id="ingresaron_ingr_outsour"></td>
                                <td id="promedio_ingr_outsour"></td>
                            </tr>
                            <tr>
                                <td>Empresa</td>
                                <td id="proga_ingr_outsour1"></td>
                                <td id="prom_ingr_outsour1"></td>
                                <td id="ingresaron_ingr_outsour1"></td>
                                <td id="promedio_ingr_outsour1"></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th id="porg_tot_ingre2"></th>
                                <th id="porm2_tot_ingre2"></th>
                                <th id="cant_tot_ingre2"></th>
                                <th id="prom_tot_ingre2"></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>    
            </div>
            <div class="row">
                <div class="col s4 offset-s1">
                    <table class="font_size highlight">
                        <tbody>
                            <tr>
                                <td class="resalt">Entrevistas Programadas</td>
                                <td id="tot_entr"></td>
                                <td class="resalt">Porcentaje Total</td>
                                <td id="porcent_tot_entr"></td>
                            </tr>
                            <tr>
                                <td class="resalt">Se Presentaron a Entrevista</td>
                                <td id="entr_present"></td>
                                <td class="resalt">Porcentaje Equivalente</td>
                                <td id="equiv_porcent_entr"></td>
                            </tr>
                        </tbody>    
                    </table>
                </div>       
                <div class="col s5 offset-s1">
                    <table class="font_size highlight">
                        <tbody>
                            <tr>
                                <td class="resalt">Ingresos Programados</td>
                                <td id="tot_ingr"></td>
                                <td class="resalt">Porcentaje Total</td>
                                <td id="porcent_tot_ingr"></td>
                            </tr>
                            <tr>
                                <td class="resalt">Se Presentaron a Ingreso</td>
                                <td id="ingr_present"></td>
                                <td class="resalt">Porcentaje Equivalente</td>
                                <td id="equiv_porcent_ingr"></td>
                            </tr>
                        </tbody>                           
                    </table>
                </div>       
            </div>
            <div class="row">
                <div class="col s4 offset-s1">
                    <table class="font_size highlight">
                        <caption>ENTREVISTAS</caption>
                        <thead>
                            <tr>
                                <th>Reclutador</th>
                                <th>Citados</th>
                                <th>Entrevistados</th>
                            </tr>
                        </thead>
                        <tbody id="entrevistados_table">
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th id="tot_citados"></th>
                                <th id="tot_entrevist"></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>       
                <div class="col s4 offset-s1">
                    <table class="font_size highlight">
                        <caption>INGRESOS</caption>
                        <thead>
                            <tr>
                                <th>Reclutador</th>
                                <th>Ingresos</th>
                                <th>Ingresaron</th>
                            </tr>
                        </thead>
                        <tbody id="ingresaron_table">
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th id="tot_ingresos"></th>
                                <th id="tot_ingresaron"></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>       
            </div>
            <div id="prueba"></div>
        </div>
        <script>
            $(document).ready(function () {
                var desde = window.location.search.substring(1, 11);
                var hasta = window.location.search.substring(11);
                function pad(n) {
                    return n < 10 ? '0' + n : n;
                }
                var currentDate = new Date();
                var date = currentDate.getDate();
                var month = currentDate.getMonth();
                var year = currentDate.getFullYear();
                var firstDayYear = year + '-' + '01' + '-' + '01';
                var todayDate = year + '-' + pad(month + 1) + "-" + pad(date);
                if (desde == '' || hasta == '') {
                    select_datos_informe_vacantes(firstDayYear, todayDate);
                    select_datos_informe_reclutadores(firstDayYear, todayDate);
                } else {
                    select_datos_informe_vacantes(desde, hasta);
                    select_datos_informe_reclutadores(desde, hasta);
                }
            });
            ////////////////////////////////////////////////////////////////////
            $("#print").on("click", () => {
                window.focus();
                window.print();
            });
        </script>
    </body>
</html>
