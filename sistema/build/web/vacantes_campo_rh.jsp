<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Vacantes Campo RH</title>
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
                width: 95rem;
                
            }
            #promesado_diario_org {
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
            #tbody_actual {
                border: 1px solid grey;
            }
            .tb_requerido {
                display: initial;
                width: 660px;
            }
            .tb_actual, .tb_faltante {
                display: initial;
                width: 200px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="row" id="contenido"></div>

        <div class="row">
            <div class="col s12 m12 l12">
                <div class=""><h5>VACANTES DE CAMPO</h5></div>
                <div class="col s12 m12 l12">
                    <div id="test-swipe-0" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 hide_print">
                                <div class="input-field col s12 m3" >
                                    <select id="territorio_visitas" multiple type="text"></select>
                                    <label for="territorio_visitas">Territorio</label>
                                </div>
                                <div class="input-field col s12 m3" >
                                    <select id="etapa_visitas" multiple type="text"></select>
                                    <label for="etapa_visitas">Etapa</label>
                                </div>
                                <input id="tipo" type="hidden" value="vacantes_visitador_rh">
                                <a id="getTableRequerimentosRH" class="waves-effect waves-light btn blue margin_top_btn"><i class="material-icons right">send</i>Consultar</a> 
                                <a onclick="tableToExcel('datos_tabla_promesado_diario_org', 'PROMESADO DIARIO')" class="waves-effect waves-light btn green margin_top_btn"><i class="material-icons right">explicit</i>Exportar</a> 
                                
                            </div>
                            <div id="promesado_diario_org" class="z-depth-2 col s12 m12 l12">
                                <div id="datos_tabla_promesado_diario_org" class="dt">
                                    <div id="cargando_datos" class="progress">
                                        <div class="indeterminate"></div>
                                    </div>
                                    <table id="requerido" class="highlight centered tb_requerido">
                                        <thead>
                                            <tr class="lime lighten-4">
                                                <th>ESTADO</th>
                                                <th>LOCALIDAD</th>
                                                <th>CARTERO</th>
                                                <th>NOTIFICADOR</th>
                                                <th>CERRADOR</th>
                                                <th>TOTAL</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody_requerido">
                                        </tbody>
                                    </table>
                                    
                                    <table class="highlight centered tb_actual">
                                        <thead>
                                            <tr class="green lighten-4">
                                                <!--<th>LOCALIDAD</th>-->
                                                <th>CARTERO</th>
                                                <th>NOTIFICADOR</th>
                                                <th>CERRADOR</th>
                                                <th>TOTAL</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody_actual">
                                        </tbody>
                                    </table>
                                    
                                    <table class="highlight centered tb_faltante">
                                        <thead>
                                            <tr class="red lighten-4">
                                                <!--<th>LOCALIDAD</th>-->
                                                <th>CARTERO</th>
                                                <th>NOTIFICADOR</th>
                                                <th>CERRADOR</th>
                                                <th>TOTAL</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody_faltante">
                                        </tbody>
                                    </table>
                                    
                                </div>
                                
                            </div>
                            <div class="col s12 m4 l4 hide">
                                    <table class="highlight col s12">
                                        <thead>
                                            <tr>
                                                <th>LOCALIDAD</th>
                                                <th>CARTERO</th>
                                                <th>NOTIFICADOR</th>
                                                <th>CERRADOR</th>
                                                <th>TOTAL</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbody_no_pin">
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 

        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
        <script type="text/javascript" src="js/js/vacantes_campo.js"></script>
    </body>
</html>
