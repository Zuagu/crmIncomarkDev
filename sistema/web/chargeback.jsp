
<%-- 
Document   : chargeback.jsp
Created on : 05/09/2017 06:05:36 AM
Author     : Luis Cortez
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
        <!--<script type="text/javascript" src="js/arcade-organigrama.js"></script>-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--        <link rel="stylesheet" type="text/css" href="css/style-operacion.css" media="screen"/>-->

        <script type="text/javascript" src="js/arcade-call-operacion.js"></script>
        <script type="text/javascript" src="js/arcade-estrategia.js"></script>

        <script type="text/javascript" src="js/arcade-estatus-llamada.js"></script>
        <script type="text/javascript" src="js/arcade-estatus-cuenta.js"></script>

        <script type="text/javascript" src="js/arcade-variable-post.js"></script>

        <script type="text/javascript" src="js/arcade-asignacion.js"></script>

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
            .select_eyc{
                padding-bottom: 3px;
                font-weight:bold;
                font-size:16px;
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
                <div id="bm4" class="div_boton_menu" title="CUENTAS RELACIONADASDE LA CUENTA ACTUAL." style="background-image: url('images/botones-operacion/btn5.png');"></div>

                <div id="bm5" class="div_boton_menu" title="MIS CUENTAS CON ESTATUS PR." style="background-image: url('images/botones-operacion/btn6.png');"></div>
                <div id="bm6" class="div_boton_menu" title="MIS CUENTAS CON PROMESA INCUMPLIDA." style="background-image: url('images/botones-operacion/btn7.png');"></div>
                <div id="bm7" class="div_boton_menu" title="AGENDAS." style="background-image: url('images/botones-operacion/btn8.png');"></div>
                <div id="bm8" class="div_boton_menu" title="CALENDARIO Y NOTAS." style="background-image: url('images/botones-operacion/btn9.png');"></div>

                <div id="bm9" class="div_boton_menu" title="VISITAS A LA CUENTA." style="background-image: url('images/botones-operacion/btn10.png');"></div>
                <div id="bm10" class="div_boton_menu" title="MIS CONVENIOS." style="background-image: url('images/botones-operacion/btn11.png');"></div>
                <!--<div id="bm11" class="div_boton_menu" title="CALCULADORA." style="background-image: url('images/botones-operacion/btn12.png');"></div>-->
                <div id="bm12" class="div_boton_menu" title="MIS PAGOS." style="background-image: url('images/botones-operacion/btn13.png');"></div>

                <div id="bm13" class="div_boton_menu" title="SCRIPTS." style="background-image: url('images/botones-operacion/btn14.png');"></div>
                <div id="bm14" class="div_boton_menu" title="MI CONFIGURACION." style="background-image: url('images/botones-operacion/btn15.png');"></div>
                <div id="bm15" class="div_boton_menu" title="MI ESTADISTICA (PASTEL)." style="background-image: url('images/botones-operacion/btn16.png');"></div>

                <div id="consola" class="div_boton_menu_format consola" style="float:left;background:#000000;width:170px;margin-right:0px;border-radius:4px 0 0 4px;opacity:1;color:#ECE000;padding:8px;font-weight: bold;"></div>
                <div id="consola2" class="div_boton_menu_format consola" style="float:left;background:#000000;width:240px;border-radius:0 4px 4px 0;opacity:1;color:#ECE000;padding:8px;font-weight:bold;"></div>

                <input id="valor_f_seguimiento" type="hidden" value="0">
                <div id="f_seguimiento"></div>

                <div id="bm16" class="div_boton_menu" style="float: right;margin: 0px;width: 300px;border: 1px solid #9cb8c3;background: #FFF;background-image: url('images/i_lupa24.png');background-repeat: no-repeat;background-position-x:4px;background-position-y:4px;">
                    <input id="busqueda" type="text" class="filtro" placeholder="Escribe algo y presiona enter..." style="background: transparent;padding-left: 32px;height: 100%;color: #4A4A4A;font-size: 1.5rem;border:none;width: 100%;">
                </div>

            </div>

            <!-- FILTROS DE CHARGEBACK -->
            <div style="width: 100%; height: 5px;float: left;"></div>
            <div class="datagrid" style="width: 99%;">
                <table style="background-color: #FFFFFF;">
                    <thead>
                        <tr>
                            <th colspan="7" style="font-size: 12px;">FILTROS CHARGEBACK </th>
                        </tr>
                    </thead>
                    <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 12px">
                        <td style="width:10%;">CICLO:</td>
                        <td style="width:10%;"><select id="ciclo" class="contar"></select></td>
                        <td style="width:10%;">ESTATUS ORIGINAL:</td>
                        <td style="width:10%;"><select id="estatus_original" class="contar"></select></td>
                        <td style="width:10%;">ESTATUS GESTION:</td>
                        <td style="width:10%;"><select id="estatus_gestion" class="contar"></select></td>

                        <td style="text-align: right;"><img style="height: 24px;" src="images/i_telcel.jpg" alt=""></td>
                    </tr>
                </table>
            </div>
            <!-- FILTROS DE CHARGEBACK -->

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
                        <td><label id="etiqueta1">CUENTA:</label></td>
                        <td><input type="text" id="dato_general1" type="button" readonly></td>
                        <td><label id="etiqueta2">NOMBRE:</label></td>
                        <td style="width: 25%;"><input type="text" id="dato_general2" readonly></td>
                        <td><label id="etiqueta3">EXPEDIENTE:</label></td>
                        <td><input type="text" id="dato_general3" readonly></td>
                        <td><label id="etiqueta4">PLAN:</label></td>
                        <td><input type="text" id="dato_general4" readonly></td>
                        <td><label id="etiqueta5">CICLO:</label></td>
                        <td><input type="text" id="dato_general5" readonly></td>
                    </tr>
                    <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 12px">
                        <td><b>CIUDAD:</b></td>
                        <td><input type="text" id="dato_general6" readonly></td>
                        <td><b>COLONIA:</b></td>
                        <td><input type="text" id="dato_general7" readonly></td>
                        <td><b>DIRECCION:</b></td>
                        <td><input type="text" id="dato_general8" readonly></td>
                        <td><b>ESTATUS:</b></td>
                        <td><input type="text" id="dato_general9"readonly type="button" ></td>
                        <td><b>F. REA:</b></td>
                        <td><input type="text" id="dato_general10"readonly type="button" ></td>
                    </tr>
                    <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 12px">
                        <td><b>EQUIPO:</b></td>
                        <td><input type="text" id="dato_general11" readonly></td>
                        <td><b>U. PAGO:</b></td>
                        <td><input type="text" id="dato_general12" readonly></td>
                        <td><b>CONTRATACION:</b></td>
                        <td><input type="text" id="dato_general13" readonly></td>
                        <td><b>PLAZO:</b></td>
                        <td><input type="text" id="dato_general14"readonly value="18 / 3"></td>
                        <td><b>DEVOLUCION:</b></td> <!-- ETIQUETA PENDIENTE -->
                        <td><input type="text" id="dato_general15"readonly  style="color:red;font-weight: bold;"></td>
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
                        <td align="right"><b>VENCIDO: </b></td>
                        <td style="width: 15%;"><input id="dato_general16" style="font-size: 17px;width: 98%;" readonly type="text" ></td>
                        <td align="right"><b>PENA FINEQ: </b></td>
                        <td><input readonly type="text"  id="dato_general17" style="font-size: 17px;width: 98%;"></td>
                        <td align="right"><b>CANCELACION:</b></td>
                        <td><input readonly type="text"  id="dato_general18" style="font-size: 17px;width: 98%;"></td>
                        <td align="right" title="SUMA PAGOS"><b>PAGADO: </b></td>
                        <td><input readonly type="text"  id="dato_general19" style="font-size: 17px;width: 98%;"></td>
                        <td align="right"><b>RESTO: </b></td>
                        <td><input id="dato_general20" type="text" style="font-size: 17px;width: 98%;" readonly></td>
                    </tr>
                    <tr>
                        <td align="right"><b>REGISTRAR: </b></td>
                        <td><input id="numero_nuevo" readonly type="text"></td>
                        <td align="right"><b>CTAS DOBLES: </b></td>
                        <td><input id="dato_general21" readonly type="text"></td>
                        <td align="right"><b>TOTAL $:</b></td>
                        <td><input id="dato_general22" readonly type="text"></td>
                        <td align="left"><b>REFERENCIAS:</b></td>
                        <td colspan="4"><input id="dato_general23" readonly type="text" ></td>
                    </tr>
                </table>
            </div>
            <!-- SALDOS -->

            <!-- GESTION DE LA LLAMADA -->
            <div style="width: 100%; height: 5px;float: left;"></div>
            <div class="datagrid" style="width: 99%;">
                <table style="background-color: #E4EEF3;">
                    <thead>
                        <tr>
                            <th colspan="12" style="font-size: 12px;">GESTIÓN</th>
                        </tr>
                    </thead>
                    <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 9px">
                        <td rowspan="2" width="25%"><textarea rows="2" id="gestion" maxlength="255" value="" class="alfanumerico" style="resize: none;width: 100%;" tabindex="1"></textarea></td>
                        <td align="right"><b>NÚM 1: </b></td>
                        <td><input id="dato_general25" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>
                        <td align="right"><b>NÚM 3: </b></td>
                        <td><input id="dato_general24" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>
                        <td align="right"><b>REF 1: </b></td>
                        <td><input id="dato_general26" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>
                        <td align="right"><b>TEL R1: </b></td>
                        <td><input id="dato_general26" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>
                        <td align="right"><b>ESTATUS CUENTA: </b></td>
                        <td>
                            <select style="width: 100px" id="id_estatus_cuenta" required="required" tabindex="2">
                                <option value="-1">SELECCIONE</option>
                            </select>
                        </td>
                        <td><input id='insert_gestion' type="button" value="GRABAR" tabindex="4"></td>
                    </tr>
                    <tr style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-size: 9px;">
                        <td align="right"><b>NÚM 2: </b></td>
                        <td><input id="dato_general28" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>
                        <td align="right"><b>LADA: </b></td>
                        <td><input id="dato_general27" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>
                        <td align="right"><b>REF 2: </b></td>
                        <td><input id="dato_general29" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>
                        <td align="right"><b>TEL R2: </b></td>
                        <td><input id="dato_general29" class="a_marcar" type="text" style="width: 100px" readonly="readonly"></td>

                        <td align="right"><b>ESTATUS LLAMADA: </b></td>
                        <td>
                            <select style="width: 100px" id="id_estatus_llamada" required="required" tabindex="3">
                                <option value="-1">SELECCIONE</option>
                            </select>
                        </td>
                        <td><input id="btnsiguiente"  type="button" value="SIGUIENTE" tabindex="5"></td>
                    </tr>
                </table>
            </div>
            <!-- GESTION DE LA LLAMADA -->

            <!-- CUADROS DE APPS -->
            <div style="width: 100%; height: 5px;float: left;"></div>
            <div class="datagrid" class="esconder_tool" style="width: 72%;margin-left: .5%;float: left;height:240px;overflow:auto;">

                <!-- GESTIONES -->
                <div id="divapp1" class="esconder_tool" style="height: 238px; overflow: auto;"></div>
                <!-- GESTIONES -->

                <!-- REFERENCIAS BANCARIAS -->
                <div id="divapp2" class="esconder_tool" style="display: none; height: 238px; overflow: auto;background: #E4EEF3;">
                    <table>
                        <thead>
                        <th>
                            REFERENCIAS BANCARIAS 
                        </th>
                        </thead>
                        <tr>
                            <td>
                                <textarea id="input_referencias_bancarias"  rows="3" readonly style="width: 99%; resize:none;font-size: 1.5rem;"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- REFERENCIAS BANCARIAS -->

                <!-- PAGOS DE LA CUENTA -->
                <div id="divapp3" class="esconder_tool" style="display:none;height:238px;overflow: auto;"></div>
                <!-- PAGOS DE LA CUENTA -->

                <!-- CUENTAS RELACIONADAS -->  
                <div id="divapp4" class="esconder_tool" style="display:none;height:238px;overflow: auto;"></div>
                <!-- CUENTAS RELACIONADAS -->  

                <!-- PROMESAS DE PAGO --> 
                <div id="divapp5" class="esconder_tool" style="display:none;height:238px;overflow: auto;">

                </div>
                <!-- PROMESAS DE PAGO -->

                <!-- PROMESAS INCUMPLIDAS -->
                <div id="divapp6" class="esconder_tool" style="display:none;height:238px;overflow:auto;">

                </div>
                <!-- PROMESAS INCUMPLIDAS -->

                <!-- AGENDAR LLAMADA -->
                <div id="divapp7" class="esconder_tool" style="display:none;height:238px;overflow:auto;">
                    <table style="background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th colspan="7" style='font-size: 12px;'>AGENDAR LLAMADA</th>
                            </tr>
                        </thead>
                        <tr>
                            <td style="width: 30%;text-align: right;">FECHA:</td>
                            <td><input id="fecha_agenda" class="datepicker" type="text" readonly></td>
                            <td>HORA:</td>
                            <td>
                                <select id="hora_agenda">
                                    <option value="07">7 AM</option>
                                    <option value="08">8 AM</option>
                                    <option value="09">9 AM</option>
                                    <option value="10">10 AM</option>
                                    <option value="11">11 AM</option>
                                    <option value="12">12 AM</option>
                                    <option value="13">1 PM</option>
                                    <option value="14">2 PM</option>
                                    <option value="15">3 PM</option>
                                    <option value="16">4 PM</option>
                                    <option value="17">5 PM</option>
                                    <option value="18">6 PM</option>
                                    <option value="19">7 PM</option>
                                    <option value="20">8 PM</option>
                                    <option value="21">9 PM</option>
                                </select>
                            </td>
                            <td>MINUTO:</td>
                            <td>
                                <select id="minuto_agenda">
                                    <option value=":00:00">00</option>
                                    <option value=":05:00">05</option>
                                    <option value=":10:00">10</option>
                                    <option value=":15:00">15</option>
                                    <option value=":20:00">20</option>
                                    <option value=":25:00">25</option>
                                    <option value=":30:00">30</option>
                                    <option value=":35:00">35</option>
                                    <option value=":40:00">40</option>
                                    <option value=":45:00">45</option>
                                    <option value=":50:00">50</option>
                                    <option value=":55:00">55</option>
                                </select>
                            </td>
                            <td><input id="insert_agenda" type="button" value="AGENDAR LLAMADA"></td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <b>AGENDAS EQUIPO</b><br>
                                <div id="listado_agendas_pareja" class="datagrid sombra" style="width:97%;height:90px;overflow:auto;"></div>
                            </td>
                        </tr>
                    </table>

                </div>
                <!-- AGENDAR LLAMADA -->

                <!-- CALENDARIO Y NOTAS -->
                <div id="divapp8" class="esconder_tool" style="display:none;height:238px;overflow: auto;">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="7" style='font-size: 12px;'>VER CALENDARIO O GUARDAR NOTA</th>
                            </tr>
                        </thead>
                        <tr>
                            <td style="width: 3%;"><img src="images/calendario16.png"></td>
                            <td style="width: 100px; text-align:center;"><input class="datepicker" type="text" placeholder="CALENDARIO" readonly></td>
                            <td>NOTA:</td>
                            <td style="width:60%;"><input id="nota" style="width:98%;" class="alfanumerico"></textarea></td>
                            <td><input id="insert_nota" type="button" value="GUARDAR NOTA"></td>
                        </tr>
                    </table>
                    <div id="listado_notas" class="datagrid" style="width: 97%;height: 110px;color: #000;margin-top: 10px;overflow: auto;"></div>
                </div>
                <!-- CALENDARIO Y NOTAS -->

                <!-- GESTIONES VISITA -->
                <div id="divapp9" class="esconder_tool" style="display:none;height:238px;overflow: auto;">
                    <div style="padding: 20px 40px;color: #9CB8C3;text-align: center;">
                        <h4>
                            Aquí verás las gestiones domiciliarias de la cuenta.<br>
                            Pronto estará disponible.
                        </h4>
                        <img src="images/e_embarrass-128.png" alt="" style="width: 32px;"><br>
                    </div>
                </div>
                <!-- GESTIONES VISITA -->

                <!-- CONVENIO -->
                <div id="divapp10" class="esconder_tool" style="display:none;height:238px;overflow: auto;">
                    <table  style="background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th colspan="7" style="font-size: 12px;">CONVENIOS DE PAGO</th>
                            </tr>
                        </thead>
                        <tr>
                            <td style="width: 49%;text-align: right;"><img src="images/calendario16.png"></td>
                            <td><input id="fecha_promesa_pago" type="text" class="datepicker" placeholder="FECHA DEL PRIMER PAGO" readonly/></td>
                            <td style="width: 2%;text-align: right;"><img src="images/dinero.png"></td>
                            <td><input id="importe_convenio" type="text" value="0.00" class="flotante" placeholder="IMPORTE DEL PRIMER PAGO" /></td>
                            <td><input id="insert_convenio" type="button" value="GUARDAR"></td>
                        </tr>
                    </table>
                    <div id="listado_convenios" class="datagrid" style="width: 99%;height: 100px;color: #000;margin-top: 10px;overflow: auto;"></div>
                </div>
                <!-- CONVENIO -->

                <!-- CALCULADORA -->
                <!--            <div id="divapp11" class="esconder_tool" style="display:none;height:238px;overflow: auto;">
                                <table style="width:100%;">
                                    <thead>
                                        <tr>
                                            <th colspan="6" style='font-size: 12px;'>CALCULADORA</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                    <tr>
                                        <td>IMPORTE</td><td><input id="importe_calc" type="text" class="numeros"></td>
                                    </tr>
                                    <tr>
                                        <td>/ NUMERO DE PAGOS:</td>
                                        <td>
                                            <select id="num_meses">
                                                <option val="2">2</option>
                                                <option val="3">3</option>
                                                <option val="4">4</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>RESULTADO</td>
                                        <td><input id="resultado_calc" type="text" class="numeros" readonly></td>
                                    </tr>
                                </table>
                            </div>-->
                <!-- CALCULADORA -->

                <!-- MIS PAGOS -->
                <div id="divapp12" class="esconder_tool" style="display:none;height:238px;overflow: auto;">
                    <table style="width:100%;margin: 0px auto;background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th style="font-size: 12px;">PAGOS DE MI EQUIPO DURANTE MI ASIGNACION ACTUAL</th>
                            </tr>
                        </thead>
                        <tr>
                            <td>
                                <div id="pagos_equipo" class="datagrid sombra" style="width: 100%;height: 150px;"></div>    
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- MIS PAGOS -->

                <!-- SPEECHES -->
                <div id="divapp13" class="esconder_tool" style="display:none;height:238px;overflow: auto;">
                    <table style="background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th  style="font-size: 12px;">SPEECHES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td  style="font-size: 1.5rem">
                                    <div id="speech_cuenta" class="datagrid" style="width: 99%;height: 135px;color: #000;margin-top: 10px;overflow: auto;"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- SPEECHES -->

                <!-- CONFIGURACION-->
                <div id="divapp14" class="esconder_tool sombra" style="display:none;height:238px;overflow: auto;">
                    <table style="background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th colspan="3">CAMBIAR ESTRATEGIA</th>
                            </tr>
                        </thead>
                        <tr>
                            <td style="width: 55%;text-align: right;">SELECCIONE ESTRATEGIA NUEVA: </td>
                            <td style="width: 18%;text-align: center;">
                                <select id="id_estrategia" class="alfanumerico"></select>
                            </td>
                            <td><input id="update_estrategia_gestor" type="button" value="CAMBIAR ESTRATEGIA COBRANZA"/></td>
                        </tr>
                        <thead>
                            <tr>
                                <th colspan="5">SOLICITUD DE NUEVO NUMERO DE CONTACTO</th>
                            </tr>
                        </thead>
                        <tr>
                            <td style="text-align: right;">NÚMERO:</td>
                            <td><input id="id_nuevo_numero_contacto" type="text"></td>
                            <td>
                                <input id="insert_nuevo_numero_contacto" type="button" value="REGISTRAR NÚMERO"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- CONFIGURACION-->

                <!-- GENERAR PASTEL -->
                <div id="divapp15" class="esconder_tool" desc="generar_pastel"  style="display:none;height:238px;overflow: auto;">
                    <table style="width:100%;margin: 0px auto;background-color: #E4EEF3;">
                        <thead>
                            <tr>
                                <th style="font-size: 12px;">RESUMEN DE MIS CUENTAS</th>
                            </tr>
                        </thead>
                        <tr>
                            <td>
                                <input id="select_pastel_gestor" style="width: 18%;margin-left: 5px;float: right;margin-right: 5px;" type="button" value="GENERAR">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="mi_pastel" class="datagrid" style="width:99%;height:115px;"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- GENERAR PASTEL -->

                <!-- BUSQUEDA -->
                <div id="divapp16" class="esconder_tool" style="display:none;height:238px;overflow:auto;">
                    <div style="padding: 20px 40px;color: #9CB8C3;text-align: center;">
                        <h4>
                            Ahora escribe algo en la barra de la parte superior derecha y presiona enter para obtener los resultados.<br>
                            Puedes escribir números de teléfono, el nombre del titular o el de alguna referencia...<br>
                            También el número de cuenta.
                        </h4>
                        <img src="images/e_surprise-128.png" alt="" style="width: 32px;"><br>
                    </div>
                </div> 
                <!-- BUSQUEDA -->

                <!-- TERMINAN LOS DIVS-->
            </div>
            <!-- CUADROS DE APPS -->

            <!-- RELOJES -->
            <div id='relojes' class="datagrid" style="width: 26%; margin-right: .5%; float: right;background-color: #E4EEF3;height:238px;">
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
                        <tr><td><b>ESTRATEGIA:</b></td><td><input id="estrategia" type="text" value=" " readonly></td></tr>
                        <tr><td><b>CUENTAS:</b></td><td><input id="cuentas" type="text" value="0" readonly></td></tr>
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
                        select_llamadas_gestor_chbk($('#usuario_sistema', parent.document).val());

                        select_cuenta_siguiente_chbk($('#usuario_sistema', parent.document).val(), 0, 0, 0);

                        select_estatus_puesto_combo($('#usuario_sistema', parent.document).val(), "id_estatus_cuenta");
                        select_estatus_llamada_combo("id_estatus_llamada");

                        fecha_hoy("fecha_agenda");
                        fecha_hoy("fecha_promesa_pago");

                        select_ciclos_chbk_usuario($('#usuario_sistema', parent.document).val(), "ciclo");
                        select_estatus_chbk_usuario($('#usuario_sistema', parent.document).val(), 0, "estatus_original"); // CICLO 0, SÓLO EN FN READY
                        select_estatus_gestion_chbk_usuario($('#usuario_sistema', parent.document).val(), 0, 0, "estatus_gestion"); // ESTATUS ORIGINAL = 0, SÓLO EN FN READY Y TAMBIEN CICLO

                        contar_cuentas_chbk_usuario($('#usuario_sistema', parent.document).val(), 0, 0, 0, "cuentas"); // CICLO 0, SÓLO EN FN READY
                    }
            );
            //==================================================================
            $("#insert_gestion").click(
                    function () {

                        var _texto_consola = $("#consola").text().split(" ");
                        var _numero_marcado = _texto_consola[0];
                        if (es_entero(_numero_marcado)) {
                            if ($("#gestion").val() == "" || $("#id_estatus_cuenta").val() == null) {
                                alert("INGRESE DISPOSICION DE LLAMADA.\n\
                \n\
VERIFICA QUE PUEDAS ELEGIR UN ESTATUS, DE NO SER ASI, SOLICITA A\n\
SISTEMAS INGRESAR TU USUARIO A UN EQUIPO DE LA OPERACION.");
                            } else {

                                $("#insert_gestion").hide();
                                insert_gestion(
                                        $("#dato_general1").val(),
                                        _numero_marcado,
                                        $("#id_estatus_cuenta").val(),
                                        $("#id_estatus_llamada").val(),
                                        //                                    $("#agente").val(),
                                        $('#usuario_sistema', parent.document).val(),
                                        $("#gestion").val(),
                                        $("#reloj_llamada_actual").val(),
                                        $("#retraso_actual").val(),
                                        $("#dato_general3").val(),
                                        false, // PREDICTIVO,
                                        0  // F_PREDICTIVO
                                        );
                            }
                        } else {
                            $("#consola").empty();
                            $("#consola").append("SELECCIONE NUMERO");
                            ;
                        }

                    }
            );
            //==================================================================
            $("#insert_gestion_buzon").click(
                    function () {
                        $("#gestion").val("LLAMADA DE BUZON DE VOZ");

                        insert_gestion(
                                $("#dato_general1").val(),
                                $("#telefono").val(),
                                2, // ESTATUS DE NO CONTACTO, ESTATUS 2
                                19, // ESTATUS DE BUZON DE VOZ, ESTATUS 19
                                $("#agente").val(),
                                $("#gestion").val(),
                                $("#reloj_llamada_actual").val(),
                                $("#retraso_actual").val()
                                );
                    }
            );
            //==================================================================
            $("#btnsiguiente").click(
                    function () {
                        select_cuenta_siguiente_chbk(
                                $('#usuario_sistema', parent.document).val(),
                                $("#ciclo").val(),
                                $("#estatus_original").val(),
                                $("#estatus_gestion").val()
                                );
                    }
            );
            //==================================================================
            var tiempo_llamada_actual = setInterval(function () {
                cronometro_llamada_actual($('#usuario_sistema', parent.document).val());
            }, 1000);
            //================ BOTONES DEL MENU ================================
            //            $("#bm1").click(function () {
            //                select_gestiones_cuenta($("#dato_general1").val(), "divapp1");
            //            }
            //            );
            $("#bm1").dblclick(function () {
                select_gestiones_cuenta_todas($("#dato_general1").val(), "divapp1");
            }
            );
            //==================================================================
            $("#bm2").click(function () {
                select_referencias_bancarias(
                        $("#dato_general1").val(),
                        "input_referencias_bancarias"
                        );
            }
            );
            //==================================================================                    
            $("#bm3").click(function () {
                select_pagos_cuenta_tabla(
                        $("#dato_general1").val(),
                        "divapp3"
                        );
            }
            );
            //==================================================================
            $("#bm4").live("click",
                    function () {
                        if ($("#dato_general1").val() != "") {
                            select_cuentas_relacionadas(
                                    $("#dato_general1").val(),
                                    "divapp4"
                                    );
                        }
                    }
            );
            //==================================================================
            $("#bm5").live("click",
                    function () {
                        listado_por_estatus_gestor(
                                $('#usuario_sistema', parent.document).val(),
                                10,
                                "divapp5"
                                ); // estatus 10: PRs
                    }
            );
            //==================================================================
            $("#bm6").live("click",
                    function () {
                        listado_por_estatus_gestor(
                                $('#usuario_sistema', parent.document).val(),
                                11,
                                "divapp6"
                                ); // estatus 11: PIs
                    }
            );
            //==================================================================
            $("#bm7").live("click",
                    function () {
                        select_agendas_pareja(
                                $('#usuario_sistema', parent.document).val(),
                                "listado_agendas_pareja"
                                );
                    }
            );
            $("#insert_agenda").live("click",
                    function () {
                        insert_agenda(
                                $('#usuario_sistema', parent.document).val(),
                                $("#dato_general1").val(),
                                $("#fecha_agenda").val(),
                                $("#hora_agenda").val() + $("#minuto_agenda").val(),
                                "listado_agendas_pareja"
                                );
                    }
            );

            // INICIA FUNCION PARA VER DETALLES DEL ELEMENTO EN ESPECIFICO
            $("input.datos_cuenta_agenda").live("click",
                    function () {
                        marcar_agenda_vista($(this).closest("tr").attr("id"), $("#cuenta" + $(this).closest("tr").attr("id")).val());
                    }
            );
            //==================================================================
            $("#bm8").click(
                    function () {

                        select_notas_equipo(
                                $('#usuario_sistema', parent.document).val(),
                                "listado_notas"
                                );
                    }
            );

            $("#insert_nota").click(
                    function () {
                        if ($("#nota").val() != "") {
                            insert_nota(
                                    $('#usuario_sistema', parent.document).val(),
                                    $("#nota").val(),
                                    "listado_notas"
                                    );
                        }
                    }
            );

            $(".delete_nota").live("click",
                    function () {

                        var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                        if (confirma) {
                            delete_nota($(this).closest("tr").attr("id"));
                        }

                    }
            );
            //==================================================================
            $("#bm9").click(
                    function () {
                        select_gestiones_cuenta($("#dato_general1").val(), "divapp1");
                    }
            );
            //==================================================================
            $("#bm10").click(
                    function () {
                        select_convenio_gestor_tabla(
                                $('#usuario_sistema', parent.document).val(),
                                "listado_convenios"
                                );
                    }
            );

            $("#insert_convenio").click(
                    function () {
                        if ($("#fecha_promesa_pago").val() == "" || $("#importe_convenio").val() == "") {
                            $("#consola").ampty();
                            $("#consola").append('INGRESE VALORES');
                        } else {
                            insert_convenio(
                                    $("#importe_convenio").val(),
                                    $("#fecha_promesa_pago").val(),
                                    $('#usuario_sistema', parent.document).val(),
                                    $("#dato_general1").val()
                                    );
                        }
                    }
            );

            $(".delete_convenio").live("click",
                    function () {
                        delete_convenio(
                                $(this).closest("tr").attr("id"),
                                $('#usuario_sistema', parent.document).val()
                                );
                    }
            );
            //==================================================================
            $("#bm12").click(
                    function () {
//                        cargar pagos de la asignacion del equipo del gestor...
                    }
            );
            //==================================================================
            $("#boton_mis_pagos").click(
                    function () {
                        cargar_mis_pagos();
                    });
            //==================================================================
            $("#bm13").click(
                    function () {

                        select_speech_cuenta();
                    }
            );
            //==================================================================
            $("#bm14").click(
                    function () {
                        select_estrategia_combo(
                                $('#usuario_sistema', parent.document).val(),
                                "id_estrategia"
                                );
                    }
            );

            $("#update_estrategia_gestor").click(
                    function () {
                        update_estrategia_gestor(
                                $('#usuario_sistema', parent.document).val(),
                                $('#id_estrategia').val()
                                );
                    }
            );
            //==================================================================
            // PASTEL        
            $("#bm15").click(
                    function () {
                        alert("pastel");
                    }
            );
            //==================================================================
            $("#bm16").keyup(function (e) {
                if (e.keyCode == 13) {
                    select_buscar_cuentas_chbk($("#busqueda").val(), "divapp16");
                }
            });
            //==================================================================
            $(".consola").dblclick(
                    function () {
                        $(this).empty();
                    }
            );
            //==================================================================
            $(".div_boton_menu").live("click", function () {
                $(".div_boton_menu").removeClass("div_boton_menu_selected");
                $(this).addClass('div_boton_menu_selected');
                $(".esconder_tool").hide();
                var _x = $(this).attr("id");
                _x = _x.split("bm");
                var _id = _x[1];
                $("#divapp" + _id).show();
            });
            //==================================================================
            $(".cuenta_encontrada").live("click", function () {
                select_datos_cuenta_chbk($(this).closest("tr").attr("id"));
                $(".esconder_tool").hide();
                $("#divapp1").show();
            });
            //==================================================================
            $("#f_seguimiento").click(function () {

                if ($("#dato_general1").val() != "") {

                    if ($("#valor_f_seguimiento").val() == 0) {
                        $("#valor_f_seguimiento").val(1);
                    } else {
                        $("#valor_f_seguimiento").val(0);
                    }

                    update_f_seguimiento_cuenta(
                            $("#dato_general1").val(),
                            $("#valor_f_seguimiento").val()
                            );

                    $(this).empty();
                    $(this).append("<img src='images/i_star" + $("#valor_f_seguimiento").val() + ".png' alt='' title='DARLE SEGUIMIENTO ESPECIAL A ESTA CUENTA' style='margin: 5px 0px 0px 7px; float: right; cursor: pointer;'>");

                }

            });
            //==================================================================
            $("#ciclo").live("change", function () {
                select_estatus_chbk_usuario($('#usuario_sistema', parent.document).val(), $("#ciclo").val(), "estatus_original"); // CICLO 0, SÓLO EN FN READY
                select_estatus_gestion_chbk_usuario($('#usuario_sistema', parent.document).val(), $("#ciclo").val(), $("#estatus_original").val(), "estatus_gestion"); // CICLO 0, SÓLO EN FN READY
            });
            //==================================================================
            $("#estatus_original").live("change", function () {
                select_estatus_gestion_chbk_usuario($('#usuario_sistema', parent.document).val(), $("#ciclo").val(), $("#estatus_original").val(), "estatus_gestion"); // CICLO 0, SÓLO EN FN READY
            });
            //==================================================================
            $(".contar").live("change", function () {
                contar_cuentas_chbk_usuario($('#usuario_sistema', parent.document).val(), $("#ciclo").val(), $("#estatus_original").val(), $("#estatus_gestion").val(), "cuentas"); // CICLO 0, SÓLO EN FN READY
            });
            //==================================================================
            $(".a_marcar").live("click", function () {
                if ($(this).text() == "") {
                    $("#consola").empty();
                    $("#consola").append($(this).val() + " ES EL NUMERO A MARCAR.");
                }
            });
            //==================================================================
            // ARCADE Software®
        </script>
    </body>
</html>