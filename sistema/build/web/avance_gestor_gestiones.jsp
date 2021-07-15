<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Avance Gestor</title>
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
            .margin_top_btn {
                margin-top: 20px;
                margin-right: 10px;
            }
            .color_VIGENTE {
                background-color: #ffff8d;
            }
            .color_INCUMPLIDO {
                background-color: #ff9e80;
            }
            .color_CUMPLIDO {
                background-color: #69f0ae;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="row" id="contenido"></div>

        <div class="row">
            <div class="col s12 m12 l12">
                <div class=""><h5>Avance Gestor</h5></div>
                <div class="col s12 m12 l12">
                    <div id="test-swipe-0" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 hide_print">
                                <div class="input-field col s2">
                                    <select id="territorio" multiple  type="text"></select>
                                    <label for="territorio">Territorio</label>
                                </div>
                                <div class="input-field col s2">
                                    <select id="etapa" multiple type="text"></select>
                                    <label for="etapa">Etapa</label>
                                </div>
                                <div class="input-field col s2">
                                    <input id="desde" type="text" class="datepicker">
                                    <label for="desde">Desde</label>
                                </div>
                                <div class="input-field col s2">
                                    <input id="hasta" type="text" class="datepicker">
                                    <label for="hasta">Hasta</label>
                                </div>
                                <a id="obt_avance" class="waves-effect waves-light btn blue margin_top_btn"><i class="material-icons right">send</i>Consultar</a> 
                                <a onclick="tableToExcel('datos_tabla_promesado_diario_org', 'PROMESADO DIARIO')" class="waves-effect waves-light btn green margin_top_btn"><i class="material-icons right">explicit</i>Exportar</a> 
                            </div>
                            <div id="promesado_diario_org" class="col s12 m12 l12">
                                <div id="datos_tabla_promesado_diario_org" class="col s12 z-depth-2 dt">
                                    <table id="avance_gestores" class="highlight">
                                        <thead class="blue">
                                            <tr class="text-white">
                                                <th>GESTOR</th>
                                                <th>PP</th>
                                                <th>CT</th>
                                                <th>CLL</th>
                                                <th>SG</th>
                                                <th>PI</th>
                                                <th>PT</th>
                                                <th>NO</th>
                                                <th>FI</th>
                                                <th>PC</th>
                                                <th>PA</th>
                                                <th>RE</th>
                                                <th>ND</th>
                                                <th>NP</th>
                                                <th>BZ</th>
                                                <th>NE</th>
                                                <th>CN</th>
                                                <th>NL</th>
                                                <th>NC</th>
                                                <th>SD</th>
                                                <th>SG</th>
                                                <th>LLAMADAS</th>
                                                <th>CUENTAS</th>
                                                <th>CONTACTACION</th>
                                                <th>PROMESADO</th>
                                                <th>PAGADO</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody_resporte_gestiones">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <script type="text/javascript" src="js/js/avance_gestor.js"></script>
    </body>
</html>
