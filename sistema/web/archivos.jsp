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
        <!--MATERIALIZE-->

        <!-- HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script> 
        <script type="text/javascript" src="highcharts/exporting.js"></script>
        <!-- HIGHCHARTS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-archivos.js"></script>

        <style type="text/css">
            .sombra {
                padding: 10px 20px;
                background-color: rgba(148, 252, 238 , 0.5);
                border: 1px solid  #94fcee;
                border-radius: 10px;
            }
        </style>

    </head>
    <body>
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="container-fluid">
            <div class="row">
                <nav id="ayuda_nav" class="grey lighten-4" >
                    <div class="nav-wrapper">
                        <a class="ayuda_name" class="brand-logo ">Archivos</a>
                        <ul class="right hide-on-med-and-down"  style="margin-right:2%;">
                            <li id="pdf_horas-clase-maestro"><a href="#"><i id="nav_i" class="material-icons help">picture_as_pdf</i></a></li>
                            <li id="roboto">Manuales de usuario de este modulo</li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="row">
                <div class="col s3 center-align" style="margin-left:3%">
                    <div class="row">
                        <div class="col s12 ">
                            <div class="card">
                                <div class="card-image" style="color: white; background-color: #c70314;"> 
                                    <h5 style="">SUBIR ARCHIVO</h5>
                                </div>
                                <div class="card-content">
                                    <form action="subir-archivos.jsp" enctype="multipart/form-data" method="post" style="margin: 0px auto;width: 100%;text-align: center;">
                                        <input id="archivo" type="file" class="" name="file" style=""/>
                                        <br>
                                        <br>
                                        <a class="waves-effect waves-light btn blue" id="enviar"><input id="enviar_archivo" type="submit" value="CARGAR ARCHIVO" /></a>
                                        <br>
                                        <label id="fichero" class="hide" for="archivo" ><center>SUBIR</center></label>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col s12 ">
                            <div class="card">
                                <div class="card-image" style="color: white; background-color: #c70314;"> 
                                    <h5 style="">BUSCAR</h5>
                                </div>
                                <div class="card-content">
                                   <input id="filtro" class="filtro  center-align" type="text"style="" placeholder="Filtro">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--                    <form action="subir-archivos.jsp" enctype="multipart/form-data" method="post" style="margin: 0px auto;width: 100%;text-align: center;">
                                            <input id="archivo" type="file" class="sombra" name="file" style="margin: 10px auto;background: #d7d7d7;border: solid 1px #DADADA;padding: 50px 20px;"/><br/>
                                            <a id="enviar"><input id="enviar_archivo" class="sombra" type="submit" value="CARGAR ARCHIVO" style="width: 50%;"/></a>
                                            <label id="fichero" class="hide" for="archivo" ><center>SUBIR</center></label>
                                        </form>-->
                </div>

                <div class="col s8">
                    <div id="tabla_archivos" class="col s11 offset-s1" style=" max-height:450px !important;overflow:auto; margin-top:1px;font-size:15px;">

                    </div>
                </div>
            </div>
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                //select_xxyyzz_tabla("listado_xxyyzz");
                $('select').material_select();
                select_archivo_filtro($("#filtro").val(),$('#usuario_sistema', parent.document).val(), "tabla_archivos");
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 15, // Creates a dropdown of 15 years to control year,
                    today: 'Today',
                    clear: 'Clear',
                    close: 'Ok',
                    closeOnSelect: false // Close upon selecting a date,
                });
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
            document.getElementById('archivo').onchange = function () {
                console.log(this.value);
                document.getElementById('fichero').innerHTML = document.getElementById('archivo').files[0].name;
            };
            //==================================================================
            $("#enviar").click(function () {
                //alert($("#fichero").text());
                insert_cargar_archivo($("#fichero").text(),$('#usuario_sistema', parent.document).val(), "tabla_archivos");
               
            });
            //==================================================================
            $("#filtro").on("keyup",
                    function () {
                        select_archivo_filtro($("#filtro").val(),$('#usuario_sistema', parent.document).val(), "tabla_archivos");
                    }
            );
    
    
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>
