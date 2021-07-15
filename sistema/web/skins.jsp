
<%-- 
Document   : predictivo.jsp
Created on : 04/06/2015, 12:22:36 AM
Author     : AYCM & LECA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
    "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
    <head>
        <title>ARCADE CTI</title>

        <!--FAVICON AND IPHONE ICONS-->
        <link rel="shortcut icon" href="http://leimihost.com/favicons/arcade-favicon.ico">

        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="http://leimihost.com/favicons/arcade-57.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://leimihost.com/favicons/arcade-114.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="http://leimihost.com/favicons/arcade-72.png" />
        <!--FAVICON AND IPHONE ICONS-->

        <!--ARCADE CSS-->
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-default.css">
        <link type="text/css" rel="stylesheet" href="css/arcade-responsive-740.css">

        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="styles/all.css">
        <link type="text/css" rel="stylesheet" href="styles/main.css">
        <!--ARCADE CSS-->

        <!-- INICIA CALENDARIO -->
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>        
        <link rel="stylesheet" href="datepicker/jquery-ui.css">
        <script src="datepicker/jquery-ui.js"></script>
        <script>
            $(function () {
                $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 3});
            });
        </script>
        <!-- TERMINA CALENDARIO -->

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-organigrama.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--        <link rel="stylesheet" type="text/css" href="css/style-operacion.css" media="screen"/>-->
        <script type="text/javascript" src="js/arcade-call-operacion.js"></script>

        <script type="text/javascript" src="js/arcade-estatus-llamada.js"></script>
        <script type="text/javascript" src="js/arcade-estatus-cuenta.js"></script>

        <script type="text/javascript" src="js/arcade-variable-post.js"></script>

        <script type="text/javascript" src="js/arcade-puesto.js"></script>

        <style>
            #barra_menus .div_boton_menu, #barra_menus .div_boton_menu_format {
                height:32px;
                width: 32px;
                cursor: pointer;
                float: left;
                margin-right: 5px;
                opacity: .8;
                border-radius: 4px;
                background:#424242;
                background-position: 0px 0px;
                background-repeat: no-repeat;
                background-size: 100%;
            }
            #barra_menus .div_boton_menu_selected {
                height:32px;
                width: 32px;
                cursor: pointer;
                float: left;
                margin-right: 5px;
                opacity: 1;
                border-radius: 4px;
                background:#424242;
                background-position: 0px 0px;
                background-repeat: no-repeat;
                background-size: 100%;
            }
            #relojes table tbody td input{
                width: 100%;
            }
            #insert_gestion{
                border-radius: 4px;background: #04B196;color: #FFF;border:none;padding: 4px 12px;width: 100%;font-size: 1.5rem;
            }
            #btnsiguiente{
                border-radius: 4px;background: #E14D57;color: #FFF;border:none;padding: 4px 12px;width: 100%;font-size: 1.2rem;
            }
            #insert_gestion_buzon{
                width: 50px;font-weight: bold;height: 50px;border-radius: 5px;background: #CF2222;color: #FFF;font-size: 13px;border: none;
            }
            #insert_gestion_promesa{
                width: 50px;font-weight: bold;height: 50px;border-radius: 5px;background: #2C8BD1;color: #FFF;font-size: 13px;border: none;
            }
            label{
                font-weight: bold;
                text-align: right;
            }
            .etiqueta_dinamica{
                background: #C9FE1D;
            }
        </style>
    </head>

    <body style="background-image: url('images/background-cliente.png');">

        <!--BEGIN CONTENT-->

        <div class="contenedor-responsive">

            <!-- TOOLS NEW -->

            <!--<div style="width: 100%; height: 5px;float: left;background:#0080FF;"></div>-->
            <div style="width: 100%; height: 5px;float: left;"></div>

            <div id="barra_menus" class="datagrid" style="width: 99%;border:none;padding: 0px;background: transparent;">

                <div id="bm1" class="div_boton_menu" title="GESTIONES DE LA CUENTA." style="background-image: url('images/botones-operacion/btn1.png');"></div>
                <div id="bm2" class="div_boton_menu" title="REFERENCIAS BANCARIAS." style="background-image: url('images/botones-operacion/btn2.png');"></div>
                <div id="bm3" class="div_boton_menu" title="PAGOS DE LA CUENTA." style="background-image: url('images/botones-operacion/btn4.png');"></div>
                <!--                <div id="bm4" class="div_boton_menu" title="CUENTAS RELACIONADASDE LA CUENTA ACTUAL." style="background-image: url('images/botones-operacion/btn5.png');"></div>
                
                                <div id="bm5" class="div_boton_menu" title="MIS CUENTAS CON ESTATUS PR." style="background-image: url('images/botones-operacion/btn6.png');"></div>
                                <div id="bm6" class="div_boton_menu" title="MIS CUENTAS CON PROMESA INCUMPLIDA." style="background-image: url('images/botones-operacion/btn7.png');"></div>-->
                <div id="bm7" class="div_boton_menu" title="AGENDAS." style="background-image: url('images/botones-operacion/btn8.png');"></div>
                <div id="bm8" class="div_boton_menu" title="CALENDARIO Y NOTAS." style="background-image: url('images/botones-operacion/btn9.png');"></div>

                <div id="bm9" class="div_boton_menu" title="VISITAS A LA CUENTA." style="background-image: url('images/botones-operacion/btn10.png');"></div>
                <div id="bm10" class="div_boton_menu" title="CONVENIOS DE LA CUENTA." style="background-image: url('images/botones-operacion/btn11.png');"></div>
                <!--<div id="bm11" class="div_boton_menu" title="CALCULADORA." style="background-image: url('images/botones-operacion/btn12.png');"></div>-->
                <!--<div id="bm12" class="div_boton_menu" title="MIS PAGOS." style="background-image: url('images/botones-operacion/btn13.png');"></div>-->

                <div id="bm13" class="div_boton_menu" title="SCRIPTS." style="background-image: url('images/botones-operacion/btn14.png');"></div>
                <div id="bm14" class="div_boton_menu" title="MI CONFIGURACION." style="background-image: url('images/botones-operacion/btn15.png');"></div>
                <!--<div id="bm15" class="div_boton_menu" title="MI ESTADISTICA (PASTEL)." style="background-image: url('images/botones-operacion/btn16.png');"></div>-->

                <div id="consola" class="div_boton_menu_format consola" style="float:left;background:#000000;max-width:18%;width:230px;margin-right:0px;border-radius:4px 0 0 4px;opacity:1;color:#ECE000;padding:8px;font-weight: bold;"></div>
                <div id="consola2" class="div_boton_menu_format consola" style="float:left;background:#000000;max-width:20%;width:252px;border-radius:0 4px 4px 0;opacity:1;color:#ECE000;padding:8px;font-weight:bold;"></div>

                <input id="valor_f_seguimiento" type="hidden" value="0">
                <div id="f_seguimiento"></div>

                <div id="bm16" class="div_boton_menu" style="float: right;margin: 0px;width: 26%;border: 1px solid #9cb8c3;background: #FFF;background-image: url('images/i_lupa24.png');background-repeat: no-repeat;background-position-x:4px;background-position-y:4px;">
                    <input id="busqueda" type="text" class="filtro" placeholder="Escribe algo y presiona enter..." style="background: transparent;padding-left: 32px;height: 100%;color: #4A4A4A;font-size: 1.5rem;border:none;width: 100%;">
                </div>

            </div>

            <div style="width: 73%;float: left;">

                <!-- DATOS DE LOCALIZACION-->
                <div style="width: 100%; height: 5px;float: left;"></div>
                <div class="datagrid" style="width: 99%;">
                    <table style="background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th colspan="11" style="font-size: 12px;">DATOS DEL CLIENTE</th>
                            </tr>
                        </thead>
                        <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 12px">
                            <td><label id="etiqueta1" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general1" type="button" readonly></td>
                            <td><label id="etiqueta2" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td style="width: 25%;"><input type="text" id="dato_general2" readonly></td>
                            <td><label id="etiqueta3" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general3" readonly></td>
                            <td><label id="etiqueta4" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general4" readonly></td>
                        </tr>
                        <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 12px">
                            <td><label id="etiqueta5" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general5" readonly></td>
                            <td><label id="etiqueta6" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general6" readonly></td>
                            <td><label id="etiqueta7" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general7" readonly></td>
                            <td><label id="etiqueta8" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general8" readonly></td>
                        </tr>
                        <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 12px">
                            <td><label id="etiqueta9" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general9" readonly></td>
                            <td><label id="etiqueta10" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general10" readonly></td>
                            <td><label id="etiqueta11" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general11" readonly></td>
                            <td><label id="etiqueta12" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input type="text" id="dato_general12" readonly></td>
                        </tr>
                    </table>
                </div>
                <!-- DATOS DE LOCALIZACION-->

                <!-- SALDOS -->
                <div style="width: 100%; height: 5px;float: left;"></div>
                <div class="datagrid" style="width: 99%;">
                    <table style="background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th colspan="11" style="font-size: 12px;">INFORMACIÓN ECONÓMICA DE LA CUENTA</th>
                            </tr>
                        </thead>
                        <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 12px;">
                            <td align="right"><label id="etiqueta13" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td style="width: 15%;"><input id="dato_general13" style="font-size: 17px;width: 98%;" readonly type="text" ></td>
                            <td align="right"><label id="etiqueta14" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input readonly type="text"  id="dato_general14" style="font-size: 17px;width: 98%;"></td>
                            <td align="right"><label id="etiqueta15" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input readonly type="text"  id="dato_general15" style="font-size: 17px;width: 98%;"></td>
                            <td align="right"><label id="etiqueta16" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input readonly type="text"  id="dato_general16" style="font-size: 17px;width: 98%;"></td>
                        </tr>
                        <tr>
                            <td align="right"><label id="etiqueta17" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input id="dato_general17" readonly type="text"  id=""></td>
                            <td align="right"><label id="etiqueta18" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input id="dato_general18" readonly type="text"  id=""></td>
                            <td align="right"><label id="etiqueta19" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input id="dato_general19" readonly type="text"  id=""></td>
                            <td align="right"><label id="etiqueta20" class="etiqueta_dinamica" contenteditable="true"></label></td>
                            <td><input id="dato_general20" readonly type="text"  id=""></td>
                        </tr>
                    </table>
                </div>
                <!-- SALDOS -->

            </div>

            <div style="width: 27%;float: right;padding: 0px 5px 0px 0px;border: none;height: 212px;overflow: auto;">

                <div style="width: 100%; height: 5px;float: left;"></div>
                <div id="numeros_contacto" class="datagrid" style="width: 100%;height: 207px;overflow: auto;"></div>

            </div>

            <!-- GESTION DE LA LLAMADA -->
            <div style="width: 100%; height: 5px;float: left;"></div>
            <div class="datagrid" style="width: 99.3%;">
                <table style="background-color: #E4EEF3;">

                    <thead>
                        <tr>
                            <th colspan="2" style="font-size: 12px;">INFORMACIÓN EXTRA</th>
                            <th colspan="1" style="font-size: 12px;">DISPOSICION DE LA LLAMADA</th>
                            <th colspan="3" style="font-size: 12px;">CONCLUIR GESTIÓN</th>
                        </tr>
                    </thead>

                    <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 9px">
                        <td align="right"><label id="etiqueta21" class="etiqueta_dinamica" contenteditable="true"></label></td>
                        <td><input id="dato_general21" readonly type="text" ></td>
                        <td rowspan="2" style="width: 61%;"><textarea rows="2" id="gestion" maxlength="255" value="" class="alfanumerico" style="resize: none;width: 100%;" tabindex="1"></textarea></td>
                        <td align="right"><b>ESTATUS:</td>
                        <td><select style="width: 100px;" id="id_estatus_cuenta" required="required" tabindex="2"><option value="0">SELECCIONE</option></select></td>

                        <td><input id='insert_gestion' type="button" value="OK" tabindex="4"></td>
                    </tr>

                    <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 9px;">
                        <td align="right"><label id="etiqueta22" class="etiqueta_dinamica" contenteditable="true"></label></td>
                        <td><input id="dato_general22" readonly type="text"  id=""></td>
                        <td align="right"><b>CODIGO:</b></td>
                        <td><select style="width: 100px;" id="id_estatus_llamada" required="required" tabindex="3"><option value="0">SELECCIONE</option></select></td>

                        <td><input id="btnsiguiente"  type="button" value=" > " tabindex="5"></td>
                    </tr>

                </table>
            </div>
            <!-- GESTION DE LA LLAMADA -->

            <!-- CUADROS DE APPS -->
            <div style="width: 100%; height: 5px;float: left;"></div>
            <div class="datagrid" class="esconder_tool" style="width: 72%;margin-left: .5%;float: left;height:182px;overflow:auto;">

                <!-- GESTIONES -->
                <div id="divapp1" class="esconder_tool" style="height: 180px; overflow: auto;text-align: center;">
                    <div style="padding: 0px 40px;color: #9CB8C3;text-align: center;">
                        <h4>
                            Seleccione un puesto para comenzar a editar sus etiquetas.
                        </h4>
                    </div>

                    PUESTO: <select id="id_puesto" style="width: 160px;"></select>

                    CLONAR A: <select id="id_puesto2" style="width: 160px;"></select>

                    <input id="clonar_etiquetas" type="button" value="CLONAR" style="width: 74px;">

                    <br>
                    <br>
                    <p style="color: grey;">
                        Edite las etiquetas y una vez que haya terminado presione el boton "OK", para guardar los cambios realizados.
                        <br>Recuerde que las etiquetas en la pantalla "MANUAL" se cargar en dos ocaciones, cuando el usuario (empleado) entra por primera vez al sistema y cuando busca una cuenta.
                        <br>También puede, seleccionar el puesto al cual desea que sean copiadas estas etiquetas.
                    </p>
                </div>
                <!-- GESTIONES -->

                <!-- TERMINAN LOS DIVS-->
            </div>
            <!-- CUADROS DE APPS -->

            <!-- RELOJES -->
            <div id='relojes' class="datagrid" style="width: 26%; margin-right: .5%; float: right;background-color: #E4EEF3;height:182px;">
                <table>
                    <thead>
                        <tr>
                            <th colspan="2" style='font-size: 12px;'>CONTROL DE TIEMPOS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td style="width: 50%;"><b>PRIMER LLAMADA:</b></td><td><input id="hora_entrada" type="text" value="00:00:00" ></td></tr>
                        <tr><td><b>ACTUAL:</b></td><td><input id="reloj_llamada_actual" type="text" value="00:00:00" readonly></td></tr>
                        <tr><td><b>CUENTAS:</b></td><td><input id="contador_cuentas" type="text" readonly></td></tr>
                        <tr><td><b>LLAMADAS:</b></td><td><input id="contador_llamadas" type="text" readonly></td></tr>
                        <tr><td><b>R. ACTUAL:</b></td><td><input id="retraso_actual" type="text" value="00:00:00" readonly></td></tr>
                    </tbody>
                </table>
            </div>
            <!-- RELOJES -->

            <input id="telefono" type="text" style="display: none;">
            <input id="cuenta" type="text" style="display: none;">
            <input id="agente" type="text" style="display: none;">
            <input id="id_campana" type="text" style="display: none;">
            <!-- MARCACION -->
            <!--<object type="text/html" data="webphone/esoftphone.html" style="width: 16%;height: 320px;margin: 0 .5%;float: right;border-radius: 5px;"></object>-->
            <!-- MARCACION -->

            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
            <!--CORE JAVASCRIPT-->

        </div>

        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(
                    function () {
                        select_puesto_combo("id_puesto");
                        select_puesto_combo("id_puesto2");
                        select_etiquetas_puesto_usuario($('#usuario_sistema', parent.document).val());
                        $(".etiqueta_dinamica").parents('td').css("text-align", "right");
                    }
            );
            //==================================================================
            $("#insert_gestion").click(function () {
                if ($("#id_puesto").val() == '0') {
                    alert("SELECCIONE UN PUESTO...");
                } else {
                    var _etiquetas = "";
                    for (i = 1; i <= 31; i++) {
                        _etiquetas = _etiquetas + $("#etiqueta" + i).text() + "#AND#";
                    }
                    insert_etiquetas_cliente($("#id_puesto").val(), _etiquetas);
                }
            });
            //==================================================================
            $("#id_puesto").live("change", function () {

                var _etiquetas = "";
                for (i = 1; i <= 31; i++) {
                    _etiquetas = _etiquetas + $("#etiqueta" + i).text() + "#AND#";
                }

                if ($("#id_puesto").val() != '0') {
                    select_etiquetas_cliente($("#id_puesto").val(), _etiquetas);
                }

            });
            //==================================================================
            $(".consola").dblclick(
                    function () {
                        $(this).empty();
                    }
            );
            //==================================================================
            $("#clonar_etiquetas").click(
                    function () {
                        var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                        if (confirma) {
                            clonar_etiquetas($("#id_puesto").val(), $("#id_puesto2").val());
                        }
                    }
            );
            //==================================================================
            // ARCADE Software®
        </script>
    </body>
</html>
