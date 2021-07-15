<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Reporte tickets de Pago</title>
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/style_gestor.css">
        <style>
            .encabezados_csv span {
                background-color: rgba(0, 0, 0, 0.13);
                margin: 0.5rem;
                width: 200px;
                display: none;
                text-align: center;
                padding: 4px;
                border-radius: 3px;
            }
            .dt {
                overflow: auto;
                height: 70vh;
            }
            .div_resumen {
                overflow: auto;
                height: 50vh;
            }
            .div_resumen table {
                margin-top: 0.7rem;
            }
            td, th {
                padding: 5px 5px !important;

            }
            td {
                font-size: 13px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="row">
            <div class="col s12">
                <div class="col s12">
                    <div class=""><h5>Reporte tickets de Pago</h5></div>
                    <div class="input-field col s12 m2 l2" >
                        <select id="territorio_pagos" multiple type="text"></select>
                        <label for="territorio_pagos">Territorio</label>
                    </div>
                    <div class="input-field col s12 m3 l3" >
                        <select id="etapa_pagos" multiple type="text"></select>
                        <label for="etapa_pagos">Etapa</label>
                    </div>
                    <div class="input-field col s12 m2 l2" >
                        <input id="desde" type="text" class="datepicker" placeholder="DESDE">
                        <label for="desde">DESDE</label>
                    </div>
                    <div class="input-field col s12 m2 l2" >
                        <input id="hasta" type="text" class="datepicker" placeholder="HASTA">
                        <label for="hasta">HASTA</label>
                    </div>

                    <div class="input-field col s12 m3 l3" >
                        <a id="getTicketsPagos" class="waves-effect waves-light btn blue margin_top_btn"><i class="material-icons right">send</i>Consultar</a> 
                        <a onclick="tableToExcel('tabla_tickets_pagos', 'PROMESADO DIARIO')" class="waves-effect waves-light btn green margin_top_btn"><i class="material-icons">explicit</i></a> 
                    </div>

                </div>
                <div id="div_tickets_pagos" class="col s12 m12 l12">
                    <div id="tabla_tickets_pagos" class="z-depth-2 dt">
                        <div id="cargando_datos" class="progress">
                            <div class="indeterminate"></div>
                        </div>

                        <table class="highlight col s12 m12 l12 center">
                            <thead>
                                <tr class="blue darken-4 white-text">
                                    <th>CLIENTE_UNICO</th>
                                    <th>ID_TICKET</th>
                                    <th>MONTO_TICKET</th>
                                    <th>GESTOR</th>
                                    <th>TIPO_PAGO</th>
                                    <th>FECHA_TICKET</th>
                                    <th>ETAPA</th>
                                    <th>TERRITORIO</th>
                                    <th>GERENTE</th>
                                </tr>
                            </thead>
                            <tbody id="tbody_tickets">
                            </tbody>
                            <tfoot>
                                <tr class="blue darken-4 white-text">
                                    <th>SUMA</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th id="suma_cuentas">0</th>
                                    <th id="suma_monto">0.00</th>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                </div>
            </div>
        </div>




        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <script type="text/javascript" src="js/js/repoprtes_pagos_azteca.js"></script>
    </body>
</html>
