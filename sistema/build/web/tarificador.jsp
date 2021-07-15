<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERP</title>

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
                $(".datepicker").datepicker({changeMonth: true, changeYear: true, numberOfMonths: 1});
            });
        </script>
        <!-- TERMINA CALENDARIO -->

        <!--ARCADE JS-->
        <script type="text/javascript" src="js/arcade-fecha.js"></script>
        <script type="text/javascript" src="js/arcade-alfanumerico.js"></script>
        <script type="text/javascript" src="js/arcade-curp.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            h3{
                color: #FFFFFF;
                background: #001840;
                padding: 15px;
                margin-top: 0px;
                font-size: 3rem;
            }
            h4{
                color: #FFFFFF;
                font-size: 1.7rem;
                padding: 10px;

            }
            span{
                color: #666666;
                font-size: 1.7rem;
            }
            img{
                width: 100%;
            }
            #datos_cliente{
                width: 94%;
                margin: 0px auto;
            }
            #datos_cliente tbody tr td input{
                width: 100%;
                border-radius: 5px;
                border: solid 1px #d5cccc;
                padding: 6px;
                color: #484848;
            }
            #datos_cliente tbody tr td{
                text-align: right;
                color: #5A5A5A;
            }

            @media print {
                html, body{
                    font-size:10px;
                    -webkit-print-color-adjust: exact;
                }
                div.datagrid_tarificador{
                    width: 100%;
                    margin: 0px auto;
                    border:none;
                }
                .datagrid_tarificador table { border-collapse: collapse; text-align: left; width: 100%; }
                .datagrid_tarificador {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden;
                                       border: none; }
                .datagrid_tarificador table td, .datagrid_tarificador table th { padding: 3px 10px; }
                .datagrid_tarificador table thead th {
                    text-align: center;
                    height: 40px;
                    background-color:#001840 !important;
                    color: #FFFFFF !important;
                    font-size: 10px;
                    font-weight: bold;
                    border-left: 1px solid #B8B8B8; }
                .datagrid_tarificador table thead th:first-child { border: none; }
                .datagrid_tarificador table tbody td { color: #5A5A5A; border-left: 1px solid #F0F0F0;font-size: 10px;font-weight: normal;height: 40px; }
                .datagrid_tarificador table tbody .alt td { background: #E8E8E8; color: #303030; }
                .datagrid_tarificador table tbody td:first-child { border-left: none; }
                .datagrid_tarificador table tbody tr:last-child td { border-bottom: none; }
                .datagrid_tarificador table input {
                    width: 96%;
                }.datagrid_tarificador table input .datepicker {
                    width: 96%;
                }.datagrid_tarificador table input .alfanumerico {
                    width: 96%;
                }
                .datagrid_tarificador table tbody td:first-child { border-left: none; }
                .datagrid_tarificador table tbody tr:last-child td { border-bottom: none; }
                .datagrid_tarificador tr:hover td{ 
                    background: #fff8cf;
                    color: #000000; 
                    height: 40px;
                }
                .datagrid_tarificador tr:hover td{ 
                    background: #fff8cf;
                    color: #000000; 
                }
                .datagrid_tarificador tr:nth-child(even) {
                    background: #F9F4F4;
                }

                h3{
                    background-color: #001840 !important;
                    -webkit-print-color-adjust: exact; 
                    color: #FFFFFF !important;
                    background: #001840 !important;
                    background-color: #001840 !important;
                    padding: 15px;
                    margin-top: 0px;
                    font-size: 3rem;
                }
                h4{
                    color: #FFFFFF;
                    font-size: 1.7rem;
                    padding: 10px;

                }
                span{
                    color: #666666;
                    font-size: 1.7rem;
                }
                img{
                    width: 100%;
                }
                #datos_cliente{
                    width: 94%;
                    margin: 0px auto;
                }
                #datos_cliente tbody tr td input{
                    width: 100%;
                    border-radius: 5px;
                    border: solid 1px #d5cccc;
                    padding: 6px;
                    color: #484848;
                }
                #datos_cliente tbody tr td{
                    text-align: right;
                    color: #5A5A5A;
                }
                .print_special {
                    border: none !important;
                } 
            }

        </style>

    </head>
    <body style="background-image: url('images/background-cliente.png')">
        <div>

            <!--BEGIN CONTENT-->
            <br>
            <div class="print_special hoja sombra" style="border: solid 1px #DADADA; width: 100%;max-width: 920px;margin: 0px auto;background: #F9F4F4;text-align: center;">

                <div style="background: #001840;">
                    <div style="margin: 0px auto;max-width: 920px;">
                        <img id="imprimir" src="images/logo_arcade2018-b-p.png" style="width: 180px;float: right;margin-top: 6px;">
                        <h3 id="titulo-ayuda" style="text-align: left;">Tarificador de llamadas </h3>
                    </div>
                </div>

                <div>
                    <table id="datos_cliente" style="border: none;">
                        <thead>
                            <tr>
                                <th colspan="6" style="text-align: left;color: #5A5A5A;">OTORGADO A:</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Razón Social:</td>
                                <td colspan="5"><input type="text" value="SOLUCIONES INTEGRALES DE CREDITO Y COBRANZAS, S. A. DE C. V."></td>
                            </tr>
                            <tr>
                                <td>Dirección:</td>
                                <td colspan="5"><input type="text" value="AV. ALFONSO REYES #2305 NTE, ESQ. CON CALLE EUCALIPTO COL DEL PRADO MTY, N.L. CP 64410"></td>
                            </tr>
                            <tr>
                                <td>Número de cliente:</td>
                                <td><input type="text" value="3"></td>
                                <td>RFC:</td>
                                <td><input type="text" value="SIC060316184"></td>
                                <td>Forma de pago:</td>
                                <td><input type="text" value="UNA SOLA EXHIBICION"></td>
                            </tr>
                            <tr>
                                <td>Periodo:</td>
                                <td><input type="text" class="datepicker"></td>
                                <td>A:</td>
                                <td><input type="text" class="datepicker"></td>
                                <td>Fecha limite de pago:</td>
                                <td><input type="text" value="03 DE AGOSTO DEL 2017"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br>
                <div class="datagrid_tarificador">
                    <table style="border: none;">
                        <thead>
                            <tr>
                                <th>CANTIDAD</th>
                                <th>UNIDAD DE MEDIDA</th>
                                <th>CONCEPTO</th>
                                <th>PRECIO UNITARIO</th>
                                <th style="width: 16%;">IMPORTE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="text-align: center;">1</td>
                                <td style="text-align: center;">SERVICIO</td>
                                <td>POLIZA DE SOPORTE ELASTIX</td>
                                <td style="text-align: right;">2,000.00</td>
                                <td style="text-align: right;">2,000.00</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">1</td>
                                <td style="text-align: center;">SERVICIO</td>
                                <td>POLIZA DE SOPORTE SISTEMA</td>
                                <td style="text-align: right;">2,000.00</td>
                                <td style="text-align: right;">2,000.00</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">1</td>
                                <td style="text-align: center;">SERVICIO</td>
                                <td>RENTA 750 CANALES MARCACIÓN</td>
                                <td style="text-align: right;">0.00</td>
                                <td style="text-align: right;">0.00</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">1</td>
                                <td style="text-align: center;">MINUTO</td>
                                <td>MINUTO DE TELEFONÍA A NÚMERO FIJOS</td>
                                <td style="text-align: right;">0.17</td>
                                <td style="text-align: right;">0.17</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">1</td>
                                <td style="text-align: center;">MINUTO</td>
                                <td>MINUTO DE TELEFONÍA A NÚMERO MÓVIL</td>
                                <td style="text-align: right;">0.25</td>
                                <td style="text-align: right;">0.25</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br>
                <div class="datagrid_tarificador">
                    <table style="border: none;float: right;">
                        <tbody>
                            <tr>
                                <td style="text-align: right;">SUBTOTAL</td>
                                <td style="text-align: right;width: 16%;">2,000.00</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">DOS MIL PESOS 00/100</td>
                                <td style="text-align: right;width: 16%;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left;padding: 15px;">
                                    <img style="width: 200px;" src="images/banorte.gif"></td>
                                <td style="text-align: right;width: 16%;"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div style="background: #001840;">
                    <div style="margin: 0px auto;max-width: 920px;">
                        <h4 style="text-align: center;font-size: 12px;"> www.leimihost.com   |   ARCADE Software </h4>
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
            }
            );
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
            $("#imprimir").on("click", function () {
                window.print();
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>