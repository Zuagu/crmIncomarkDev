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

        <!--ARCADE CSS-->
        <!--        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
                <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">
       
                <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
                <link type="text/css" rel="stylesheet" href="styles/all.css">
                <link type="text/css" rel="stylesheet" href="styles/main.css">-->
        <!--ARCADE CSS-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>       
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>
        <!--    <script>
                    $(function () {
                        $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 1});
                    });
                </script>-->
        <!--TERMINA CALENDARIO -->

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <script type="text/javascript" src="js/arcade-excel.js"></script>
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!-- HIGHCHARTS-->
        <script type="text/javascript" src="js/arcade-dashboard-reclutador.js"></script>
        <!-- HIGHCHARTS-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="https://code.highcharts.com/highcharts.js"></script>

        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <style>
            .pointer{
                cursor: pointer;
            }
            html {
                height: 100%;
            }
            body {
                background:#ffffff;
                /*                min-height: 100%;*/
            }
            .highcharts-background {
                fill:rgba(255, 255, 255, 0.2);
                stroke:rgba(0, 0, 0, 0.2);
                stroke-width:0px;
            }
            .letcolor{
                color: white !important;
            }
            .letcolor2{
                background-color: white !important;
                border-radius: 4%;
                transform: scale(1.0, .9);
            }
            .chi{
                padding: 0px 8px;
            }
            .size_button{
                transform: scale(.8, .8);
                width: 150px;
                margin-right: 50px !important;
                border-radius: 7px;
            }
            .size_button2{
                transform: scale(.5, .8);
                margin-right: 50px !important;
                margin-left: 0px !important;
                border-radius: 7px;
                padding-left: 16px;
                padding-right: 0px;
                /*                width: 1px;*/
            }
            .size_button3{
                transform: scale(.5, .7);
                margin-right: 70px !important;
                margin-left: 0px !important;
                border-radius: 7px;
                padding-left: 16px;
                padding-right: 0px;
                background-color: #616161;
                /*                width: 1px;*/
            }
            .select-wrapper input.select-dropdown {
                margin: 0px 0px 0px 8px;
                width: 90%;
                position: relative;
                cursor: pointer;
                background-color: transparent;
                border: none;
                border-bottom-color: currentcolor;
                border-bottom-style: none;
                border-bottom-width: medium;
                border-bottom: 1px solid #fff;
                outline: none;
                height: 2rem;
                line-height: 3rem;
                font-size: 1rem;
                padding: 0;
                display: block;
            }
            .innerb{
                overflow: auto;
                height : 25em;

            }
            .inner2{
                overflow: auto;
                height : 23em;

            }
            .highcharts-container{
                height : 26em;  
            }
            .modalin {
                width: 40% !important ; height:auto !important;
                background-image: linear-gradient(to right bottom, rgb(189, 189, 189), rgba(224, 224, 224));
                color: #000000;
                border-top: 0px solid #5e5e5e;
                border-radius: 10px;
                overflow: unset;
            }  

            .select-wrapper{
                border-radius:20px;
                height:38px;
            }
            .select-dropdown.dropdown-content li.selected {
                background: linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));
                color: #fff;
            }
            .select_tr tr:hover {
                background: linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));
                color:#ffffff;
            }


        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div class="row">
                <nav id="ayuda_nav" class="hide_print" style="background:linear-gradient(to left, rgba(189,189,189,0.1), rgba(189,189,189,1));">
                    <div class="nav-wrapper">
                        <ul class="right"  style="margin-right:2%;">   
                            <li><i class="medium material-icons" style="margin-top: -13px;">access_time</i></li>
                            <li><input id="desde" name="fecha" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;margin-left: 10px;background: white;"></li>
                            <li style="margin-left: 10px;margin-top: -13px;"><i class="medium material-icons">access_time</i></li>
                            <li><input id="hasta" name="fecha" type="text" class="validate datepicker" readonly="" style="text-align: center;border: solid 1px gray !important;border-radius: 4px !important;font-weight: bold; width:100px; padding:-5px;margin-bottom: -5px;height: 27px;margin-right: 0px;margin-left: 10px;background: white;"></li>
                            <li  style="margin-top: -1px; margin-left: -10px;"><a id="enviar" class="waves-effect waves-light btn size_button3" style="color:white;"><i class="material-icons left">send</i></a></li>
                            <li id="pdf_horas-clase-maestro" style="margin-left: 117px;"><a href="#"><i id="nav_i" class="material-icons help">picture_as_pdf</i></a></li>
                            <li id="roboto">Manuales de usuario de este modulo</li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="row" style="margin-top: -20px;">

                <div class="col s12 m12 l12  "  style="margin-left:1.5%">
                    <div class="col s6 m6 l2"> 
                        <div class="col s12 m12 l10  z-depth-3 letcolor" style=" background:linear-gradient(to left, rgba(103,45,188,0.6), rgba(103,45,188,0.9));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align">Entrevistas.</h6>
                            <h4 id="entrevista" class="center-align"></h4>
                        </div>
                    </div>
                    <div class="col s6 m6 l2"> 
                        <div class="col s12 m12 l10  z-depth-3 letcolor" style="background:linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align">Citas.</h6>
                            <h4 id="cita" class="center-align"></h4>
                        </div>
                    </div>
                    <div class="col s6 m6 l2"> 
                        <div class="col s12 m12 l10  z-depth-3 letcolor" style="background:linear-gradient(to left, rgba(107,182,29,0.6), rgba(107,182,29,1));border-radius: 3px;padding-right: 18px; padding-left: 18px;"  >
                            <h6 class="center-align">Ingresos</h6>
                            <h4 id="ingreso" class="center-align pointer"></h4>
                        </div>
                    </div>
                    <div class="col s6 m6 l2"> 
                        <div class="col s12 m12 l10  z-depth-3 letcolor" style=" background:linear-gradient(to left, rgba(255,109,0,0.6), rgba(255,109,0,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align">Permanencia.</h6>
                            <h4 id="permanencia" class="center-align"></h4>
                        </div>
                    </div>
                    <div class="col s6 m6 l2"> 
                        <div class="col s12 m12 l10  z-depth-3 letcolor" style=" background:linear-gradient(to left, rgba(255,0,0,0.6), rgba(255,0,0,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align">Bajas</h6>
                            <h4 id="baja" class="center-align pointer"></h4>
                        </div>
                    </div>
                    <div class="col s6 m6 l2"> 
                        <div class="col s12 m12 l10  z-depth-3 letcolor" style=" background:linear-gradient(to left, rgba(255,109,0,0.6), rgba(255,109,0,1));border-radius: 3px; padding-right: 18px; padding-left: 18px;"> 
                            <h6 class="center-align">METAS.</h6>
                            <h4 id="metas" class="center-align"></h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="">
                <div class="col s12 m12 l12 "style="margin-left:1.5%" >
                    <div class="col s12 m6 l8">
                        <div class="col s12 m12 l11  z-depth-3" id="citados" style=" border-radius: 3px;"></div> 
                        <div class="col s12 m12 l11" style="margin-top:10px">
                            <a id="generar" class="waves-effect waves-light btn right" style="background:linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));border-radius: 3px;"><i class="material-icons right">send</i>Citar</a>
                        </div> 
                    </div>
                    <div class="col s12 m6 l4">
                        <div class="col s12 m12 l11  z-depth-3 highcharts-container" id="container" style=" border-radius: 3px;"></div>    
                    </div>

                </div>
            </div>




            <!--END CONTENT-->
            <!------------------------------------------------INICIO MODALES------------------------------------------------>
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <h4>Citas</h4>
                    <div id="citas_div"></div>
                </div>
                <div class="modal-footer">
                    <a onclick="tableToExcel('citas_div', 'ENTREVISTAS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a>
                </div>
            </div>
            <div id="modal2" class="modal">
                <div class="modal-content">
                    <h4>Bajas</h4>
                    <div id="baja_div"></div>
                </div>
                <div class="modal-footer">
                    <a onclick="tableToExcel('baja_div', 'ENTREVISTAS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a>
                </div>
            </div>
            <div id="modal3" class="modal">
                <div class="modal-content">
                    <h4>Ingresos</h4>
                    <div id="ingreso_div"></div>
                </div>
                <div class="modal-footer">
                    <a onclick="tableToExcel('ingreso_div', 'ENTREVISTAS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a>
                </div>
            </div>
            <div id="modal5" class="modal">
                <div class="modal-content">
                    <h4>Entrevistas</h4>
                    <div id="entrevista_div"></div>
                </div>
                <div class="modal-footer">
                    <a onclick="tableToExcel('entrevista_div', 'ENTREVISTAS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a> 
                </div>
            </div>
            <div id="modal6" class="modal modal-on ">
                <div class="modal-content">
                    <h4>Permanencia</h4>
                    <div id="permanenecia_div"></div>
                </div>
                <div class="modal-footer">
                    <a onclick="tableToExcel('permanenecia_div', 'ENTREVISTAS')" class="waves-effect waves-light btn green" style="margin-left: 5px;width: 50px;border-radius: 4px;height:29px;margin-bottom: 5px;"><i class="material-icons" style="margin: -10px;">explicit</i></a>
                </div>
            </div>
            <div id="modal7" class="modal modalin">
                <div class="modal-content">
                    <div class="row">
                        <h4 class="center-align">Generar Cita </h4>
                        <div class="input-field col s12">
                            <input id="nombre" type="text" value="" class="validate buscar center-align grey lighten-4" type="text" style="border-radius:20px;height:38px; text-transform:uppercase">
                            <label for="nombre">Nombre</label>
                        </div>
                        <div class="input-field col s6" style="border-radius:20px;height:38px;">
                            <select id="medio" class="seleccionador sele center-align grey lighten-4" style="border-radius:20px;height:38px;">
                                <option value="" disabled selected></option>
                                <option value="Publicidad Fija">Publicidad Fija</option>
                                <option value="Bolsas Electronicas">Bolsas Electronicas</option>
                                <option value="Trabajo en Campo">Trabajo en Campo</option>
                                <option value="Redes Sociales">Redes Sociales</option>
                                <option value="Otros">Otros</option>
                                <option value="Escuelas">Escuelas</option>
                                <option value="Periodico">Periodico</option>
                                <option value="Bolsas Municipales">Bolsas Municipales</option>
                                <option value="Intercambio de Bolsas">Intercambio de Bolsas</option>
                                <option value="Outsourcing">Outsourcing</option>
                            </select>
                            <label>Medio por el cual te enteraste?</label>
                        </div>
                        <input id="especificaMedio" class="hide" style="border-radius:20px;height:38px;">
                        <div id="medioDiv0" class="input-field col s5 offset-s1" style="border-radius:20px;height:38px;">
                            <select id="especificaMedio0" class="grey lighten-4">
                                <option value="" disabled selected></option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv1" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio1" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="Anuncio Ventana">Anuncio Ventana</option>
                                <option value="Banner">Banner</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv2" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio2" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="COMPUTRABAJO">COMPUTRABAJO</option>
                                <option value="INDEED">INDEED</option>
                                <option value="TALENTECA">TALENTECA</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv3" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio3" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="BRIGADA MONTERREY">BRIGADA MONTERREY</option>
                                <option value="FERIA EMPLEO GUADALUPE">FERIA EMPLEO GUADALUPE</option>
                                <option value="FERIA EMPLEO SAN NICOLAS">FERIA EMPLEO SAN NICOLAS</option>
                                <option value="FERIA EMPLEO ESCOBEDO">FERIA EMPLEO ESCOBEDO</option>
                                <option value="VOLANTEO">VOLANTEO</option>
                                <option value="FERIA DE EMPLEO">FERIA DE EMPLEO</option>
                                <option value="POSTEO">POSTEO</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv4" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio4" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="FACEBOOK(PERSONAL)">FACEBOOK(PERSONAL)</option>
                                <option value="FACEBOOK(PAGINA SICSA)">FACEBOOK(PAGINA SICSA)</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv5" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio5" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="RECOMENDACION">RECOMENDACION</option>
                                <option value="REF. CONOCIDO">REF. CONOCIDO</option>
                                <option value="REINGRESO">REINGRESO</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv6" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio6" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="UANL">UANL</option>
                                <option value="UMM">UMM</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv7" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio7" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="EL METRO">EL METRO</option>
                                <option value="EL NORTE">EL NORTE</option>
                                <option value="EL SOL DE PUEBLA">EL SOL DE PUEBLA</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv8" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio8" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="BOLSA SAN PEDRO">BOLSA SAN PEDRO</option>
                                <option value="BOLSA MONTERREY">BOLSA MONTERREY</option>
                                <option value="BOLSA ESCOBEDO">BOLSA ESCOBEDO</option>
                                <option value="BOLSA APODACA">BOLSA APODACA</option>
                                <option value="BOLSA SAN NICOLAS">BOLSA SAN NICOLAS</option>
                                <option value="BOLSA GUADALUPE">BOLSA GUADALUPE</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv9" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio9" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="INTERCAMBIO DE CARTERA">INTERCAMBIO DE CARTERA</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div id="medioDiv10" class="input-field col s5 offset-s1 hide">
                            <select id="especificaMedio10" class="grey lighten-4">
                                <option value="" disabled selected></option>
                                <option value="EMPRESA">EMPRESA</option>
                            </select>
                            <label>Especifica el Medio</label>
                        </div>
                        <div class="input-field col s5">
                            <input id="fecha" type="text" class="validate center-align grey lighten-4 datepicker" style="border-radius:20px;height:38px;">
                            <label for="fecha">Fecha</label>
                        </div>
                        <div class="input-field col s5 offset-l2">
                            <input id="hora" type="text" class="validate center-align grey lighten-4 timepicker" style="border-radius:20px;height:38px;">
                            <label for="hora">Hora</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="desc" type="text" class="validate center-align grey lighten-4" style="border-radius:20px;height:38px;">
                            <label for="desc">Last Name</label>
                        </div>
                        <div class="input-field col s12 right">
                            <a id="generador" class="waves-effect waves-light btn right" style="background:linear-gradient(to left, rgba(0,93,170,0.6), rgba(0,93,170,1));border-radius: 5px;"><i class="material-icons right">send</i>Generar</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="modal_alert" class="modal">
                <div class="modal-content center-align">
                    <h4 id="titulo"></h4>
                    <div id="mensaje_estatus" class="center-align" style="font-size: 2rem;"></div>
                </div>
                <div class="modal-footer">
                    <a class="waves-effect waves-light modal-close btn green" style="background: linear-gradient(to left, rgba(255,0,0,0.6), rgba(255,0,0,1));border-radius: 3px;"><i class="material-icons" style="margin: -10px;">close</i></a>
                </div>
            </div>
        </div>
        <!------------------------------------------------FIN MODALES------------------------------------------------>
        <!--END PAGE WRAPPER-->

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                $('.modal').modal();
                select_citados_rango("cita", "0000-00-00", "0000-00-00", "valor", $('#usuario_sistema', parent.document).val());
                select_tabla_citados("citados", "0000-00-00", "0000-00-00", $('#usuario_sistema', parent.document).val());
                select_ingresos_rango("ingreso", "0000-00-00", "0000-00-00", "valor", $('#usuario_sistema', parent.document).val());
                select_entrevistas_rango("entrevista", "0000-00-00", "0000-00-00", "valor", $('#usuario_sistema', parent.document).val());
                select_bajas_rango("baja", "0000-00-00", "0000-00-00", "valor", $('#usuario_sistema', parent.document).val());
                select_permanencia("permanencia", "0000-00-00", "0000-00-00", "valor", $('#usuario_sistema', parent.document).val());
                select_grafica_entrevistas(1, "0000-00-00", "0000-00-00", $('#usuario_sistema', parent.document).val());
                $('select').material_select();
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 15, // Creates a dropdown of 15 years to control year,
                    today: 'Today',
                    clear: 'Clear',
                    close: 'Ok',
                    closeOnSelect: true, // Close upon selecting a date,
                    container: 'body'
                });
                $('.timepicker').pickatime({
                    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
                    fromnow: 0, // set default time to * milliseconds from now (using with default = 'now')
                    twelvehour: false, // Use AM/PM or 24-hour format
                    donetext: 'OK', // text for done-button
                    cleartext: 'Clear', // text for clear-button
                    canceltext: 'Cancel', // Text for cancel-button
                    autoclose: true, // automatic close timepicker
                    ampmclickable: true, // make AM PM clickable
                    container: 'body',
                    aftershow: function () {} //Function for after opening timepicker
                });
            });
            //            //==================================================================
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
            function rotacion_chunung() {
                var ingres = parseInt($("#ingreso").text(), 10);
                var baj = parseInt($("#baja").text(), 10);
                var res = baj / ingres;
                var resu = res * 100;
                var resu = resu.toFixed(2) + "%";
                $("#rotacion").text(resu);
            }
            //==================================================================
            function rotacion_chunung_2() {
                var act = parseInt($("#activo").text(), 10);
                var baj = parseInt($("#baja").text(), 10);
                var res = baj / act;
                var resu = res * 100;
                var resu = resu.toFixed(2) + "%";
                $("#rotacion_glob").text(resu);
            }
            //==================================================================
            $("#baja").on("click", () => {
                $('#modal2').modal('open');
                if ($("#desde").val() == "" && $("#hasta").val() == "") {
                    select_bajas_rango("baja_div", "0000-00-00", "0000-00-00", "tabla", $('#usuario_sistema', parent.document).val());
                } else {
                    select_bajas_rango("baja_div", $("#desde").val(), $("#hasta").val(), "tabla", $('#usuario_sistema', parent.document).val());
                }
            });
            $("#ingreso").on("click", () => {
                $('#modal3').modal('open');
                if ($("#desde").val() == "" && $("#hasta").val() == "") {
                    select_ingresos_rango("ingreso_div", "0000-00-00", "0000-00-00", "tabla", $('#usuario_sistema', parent.document).val());
                } else {
                    select_ingresos_rango("ingreso_div", $("#desde").val(), $("#hasta").val(), "tabla", $('#usuario_sistema', parent.document).val());
                }
            });
            $("#cita").on("click", () => {
                $('#modal1').modal('open');
                if ($("#desde").val() == "" && $("#hasta").val() == "") {
                    select_citados_rango("citas_div", "0000-00-00", "0000-00-00", "tabla", $('#usuario_sistema', parent.document).val());
                } else {
                    select_citados_rango("citas_div", $("#desde").val(), $("#hasta").val(), "tabla", $('#usuario_sistema', parent.document).val());
                }
            });
            $("#entrevista").on("click", () => {
                $('#modal5').modal('open');
                if ($("#desde").val() == "" && $("#hasta").val() == "") {
                    select_entrevistas_rango("entrevista_div", "0000-00-00", "0000-00-00", "tabla", $('#usuario_sistema', parent.document).val());
                } else {
                    select_entrevistas_rango("entrevista_div", $("#desde").val(), $("#hasta").val(), "tabla", $('#usuario_sistema', parent.document).val());
                }
            });
            $("#permanencia").on("click", () => {
                if ($("#desde").val() == "") {
                    alerta("Este datos solo esta disponible con un rango de fechas");
                }else{
                    $('#modal6').modal('open');
                    select_permanencia("permanenecia_div", $("#desde").val(), $("#hasta").val(), "tabla", $('#usuario_sistema', parent.document).val());
                }

            });
            $("#generar").on("click", () => {
                $('#modal7').modal('open');
            });
            //==================================================================
            $("#enviar").on("click", () => {
                select_citados_rango("cita", $("#desde").val(), $("#hasta").val(), "valor", $('#usuario_sistema', parent.document).val());
                select_tabla_citados("citados", $("#desde").val(), $("#hasta").val(), $('#usuario_sistema', parent.document).val());
                select_permanencia("permanencia", $("#desde").val(), $("#hasta").val(), "valor", $('#usuario_sistema', parent.document).val());
                select_ingresos_rango("ingreso", $("#desde").val(), $("#hasta").val(), "valor", $('#usuario_sistema', parent.document).val());
                select_bajas_rango("baja", $("#desde").val(), $("#hasta").val(), "valor", $('#usuario_sistema', parent.document).val());
                select_entrevistas_rango("entrevista", $("#desde").val(), $("#hasta").val(), "valor", $('#usuario_sistema', parent.document).val());
                select_grafica_entrevistas(0, $("#desde").val(), $("#hasta").val(), $('#usuario_sistema', parent.document).val());
                window.setTimeout(() => {
                    rotacion_chunung();
                    rotacion_chunung_2();
                }, 300);
            });
            //================================================================== 
            $(".seleccionador").change(function () {
                if ($('#medio').val() == "Publicidad Fija") {
                    $('#medioDiv1').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Bolsas Electronicas") {
                    $('#medioDiv2').removeClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Trabajo en Campo") {
                    $('#medioDiv3').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Redes Sociales") {
                    $('#medioDiv4').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Otros") {
                    $('#medioDiv5').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Escuelas") {
                    $('#medioDiv6').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Periodico") {
                    $('#medioDiv7').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Bolsas Municipales") {
                    $('#medioDiv8').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                } else if ($("#medio").val() == "Intercambio de Bolsas") {
                    $('#medioDiv9').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv10").addClass('hide');
                }else if ($("#medio").val() == "Outsourcing") {
                    $('#medioDiv10').removeClass('hide');
                    $("#medioDiv2").addClass('hide');
                    $("#medioDiv3").addClass('hide');
                    $("#medioDiv4").addClass('hide');
                    $("#medioDiv5").addClass('hide');
                    $("#medioDiv6").addClass('hide');
                    $("#medioDiv7").addClass('hide');
                    $("#medioDiv8").addClass('hide');
                    $("#medioDiv1").addClass('hide');
                    $("#medioDiv0").addClass('hide');
                    $("#medioDiv9").addClass('hide');
                }
            });
            $("#especificaMedio1").change(function () {
                $("#especificaMedio").val($("#especificaMedio1").val());
            });
            $("#especificaMedio2").change(function () {
                $("#especificaMedio").val($("#especificaMedio2").val());
            });
            $("#especificaMedio3").change(function () {
                $("#especificaMedio").val($("#especificaMedio3").val());
            });
            $("#especificaMedio4").change(function () {
                $("#especificaMedio").val($("#especificaMedio4").val());
            });
            $("#especificaMedio5").change(function () {
                $("#especificaMedio").val($("#especificaMedio5").val());
            });
            $("#especificaMedio6").change(function () {
                $("#especificaMedio").val($("#especificaMedio6").val());
            });
            $("#especificaMedio7").change(function () {
                $("#especificaMedio").val($("#especificaMedio7").val());
            });
            $("#especificaMedio8").change(function () {
                $("#especificaMedio").val($("#especificaMedio8").val());
            });
            $("#especificaMedio9").change(function () {
                $("#especificaMedio").val($("#especificaMedio9").val());
            });
            $("#especificaMedio10").change(function () {
                $("#especificaMedio").val($("#especificaMedio10").val());
            });
            
            // Splice in transparent for the center circle
            function alerta(mensaje) {
                $('#modal_alert').modal('open');
                $('#titulo').addClass("red-text");
                $('#titulo').text("Error");
                $('#mensaje_estatus').html(mensaje);
            }
            //==================================================================
            $("#generador").on("click", () => {



                if ($("#nombre").val() == "") {
                    alerta('Ingresa el <b class="red-text">nombre</b> de la Persona');
                } else if ($("#medio").val() == "") {
                    alerta('Ingresa la <b class="red-text">medio</b>');
                } else if ($("#especificaMedio").val() == "") {
                    alerta('Ingresa  <b class="red-text">el Medio y especifica Medio</b>');
                } else if ($("#fecha").val() == "") {
                    alerta('Ingresa la <b class="red-text">fecha</b>');
                } else if ($("#hora").val() == "") {
                    alerta("Ingresa la <b class='red-text'>hora</b>");
                } else {
                    insert_cita(
                            $('#usuario_sistema', parent.document).val(),
                            $("#nombre").val(),
                            $("#medio").val(),
                            $("#especificaMedio").val(),
                            $("#fecha").val(),
                            $("#hora").val(),
                            $("#desc").val()
                            );

                }
            });
            //================================================================== 
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>