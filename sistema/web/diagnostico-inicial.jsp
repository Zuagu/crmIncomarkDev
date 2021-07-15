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

    </head>
    <body style="background-image: url('images/background-cliente.png')">
        <div>

            <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div class="page-title-breadcrumb option-demo">
                <div class="page-header pull-right">
                    <div class="page-title">
                        Diagnostico Inicial
                    </div>
                </div>
                <ol class="breadcrumb page-breadcrumb pull-left">
                    <li>Manuales de usuario de este modulo:</li>
                    <li id="pdf_horas-clase-maestro"><img class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>

                </ol>
                <div class="clearfix">
                </div>
            </div>
            <!--END TITLE & BREADCRUMB PAGE-->

            <!--BEGIN CONTENT-->
            <br>
            <div id="formato_diagnostico" class="datagrid hoja sombra">
                <div class="contenido_hoja">

                    <br>
                    <div style="height: 100px;">
                        <div style="float: left; width: 300px;">
                            <img src="images/logo-cliente-z.png" alt="" style="width:300px;">
                        </div>
                        <div style="float: right;width: 60%;text-align: right;">
                            <h3><b>DOCUMENTO DE DIAGNOSTICO INICIAL</b></h3>
                            <table style="border: none;width:90%;float:right;">
                                <tr style="background: transparent;">
                                    <td style="text-align:right;border: none;">FECHA:
                                        <span style="font-weight:bold;">16 DE MAYO DEL 2017</span>
                                    </td>
                                </tr>
                                <tr style="background: transparent;">
                                    <td style="text-align:right;">CONSULTOR:
                                        <span style="font-weight:bold;">TOMAS OROZCO ROSAS</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:right;">FOLIO:
                                        <span style="font-weight:bold;color:red;">4713</span>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>

                    <br>
                    <hr>
                    <div>
                        <table>
                            <thead>
                                <tr>
                                    <th colspan="8">DATOS GENERALES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align:right;">RAZON SOCIAL:</td>
                                    <td colspan="5"><b>LUIS EDUARDO CORTEZ AGUILAR</b></td>
                                    <td style="text-align:right;">GIRO:</td>
                                    <td><span><b>TECNOLOGIAS DE INFORMACION</b></span></td>
                                </tr>
                                <tr>
                                    <td style="text-align:right;">CONTACTO:</td>
                                    <td><span><b>LUIS CORTEZ</b></span></td>
                                    <td style="text-align:right;">PUESTO:</td>
                                    <td><span><b>GERENTE SISTEMAS</b></span></td>
                                    <td style="text-align:right;">TELEFONO:</td>
                                    <td><span><b>8120284636</b></span></td>
                                    <td style="text-align:right;">EMAIL:</td>
                                    <td><span><b>luis@cortezsoftware.com</b></span></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                    <br>
                    <div>
                        <table>
                            <thead>
                                <tr>
                                    <th>
                                        NECESIDAD DESCRITA POR EL CLIENTE
                                        <img src="images/i_duda3.png" style="cursor:pointer;float: right;"
                                             title="Este campo es generado por el cliente desde que solicitó su servicio desde el sitio web.">
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span>Poder tener el control de los envíos de mi empresa</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <div>
                        <table>
                            <thead>
                                <tr>
                                    <th>
                                        OBJETIVO GENERAL DE LA VISITA
                                        <img src="images/i_duda3.png" style="cursor:pointer;float: right;">
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <textarea></textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <br>
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
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>