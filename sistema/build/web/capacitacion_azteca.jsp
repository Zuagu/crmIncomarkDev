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
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="row" id="contenido"></div>

        <div class="row">
            <div class="col s12 m12 l12">
                <div class="col s12 m12 l12">
                    <ul id="tabs-swipe-demo" class="tabs hide_print">
                        <li class="tab col s1"><a class="active" href="#test-swipe-0" style="color:#db040e">BIENVENIDOS</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-1" style="color:#db040e">CONCEPTOS JURIDICOS</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-2" style="color:#db040e">REDECO</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-3" style="color:#db040e">CRM</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-4" style="color:#db040e">Promesado x Gestor</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-5" style="color:#db040e">Promesado x Gestor</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-6" style="color:#db040e">Promesado x Gestor</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-7" style="color:#db040e">Promesado x Gestor</a></li>
                        <li class="tab col s1"><a class="" href="#test-swipe-8" style="color:#db040e">Promesado x Gestor</a></li>
                    </ul>
                    <div id="test-swipe-0" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 " style="text-align: center;">
                                <h4 style="color:#2196f3">BIENVENIDOS</h4>
                            </div>
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 hide_print" style="text-align: center;">
                                <iframe  width="100%" height="400px" src="https://www.youtube.com/embed/uvQydh-2zzo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div class="col s10 m10 l10">
                                <h6>PREGUNTAS</h6>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-1" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 " style="text-align: center;">
                                <h4 style="color:#2196f3">CONCEPTOS JURIDICOS</h4>
                            </div>
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 hide_print" style="text-align: center;">
                                <iframe width="100%" height="400px" src="https://www.youtube.com/embed/ZeL985CKFHI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div class="col s10 m10 l10">
                                <h6>PREGUNTAS</h6>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-2" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 " style="text-align: center;">
                                <h4 style="color:#2196f3">REDECO</h4>
                            </div>
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 hide_print" style="text-align: center;">
                                <iframe width="100%" height="400px" src="https://www.youtube.com/embed/SyUqbSb8TMs" title="REDECO" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div class="col s10 m10 l10">
                                <h6>PREGUNTAS</h6>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-3" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 hide_print">
                                <h6>CRM</h6>
                                <h1>video de CRM</h1>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-4" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 hide_print">
                                <h6>VIDEOS ENTREVISTAS</h6>
                                <iframe width="560" height="315" src="https://www.youtube.com/embed/UHl033iveVI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-5" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 hide_print">
                                <h6>MERCANCIA</h6>
                                <h1>video de Mercancia </h1>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-6" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 hide_print">
                                <h6>MAZ</h6>
                                <h1>Videos de MAZ </h1>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-7" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 " style="text-align: center;">
                                <h4 style="color:#2196f3">MAZ MICRONEGOCIO</h4>
                            </div>
                            <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 hide_print" style="text-align: center;">
                                <iframe width="100%" height="400px" src="https://www.youtube.com/embed/UHl033iveVI" title="Entrevista Eliseo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <div class="col s10 m10 l10">
                                <h6>PREGUNTAS</h6>
                            </div>
                        </div>
                    </div>
                    <div id="test-swipe-8" class="col s12" style="margin-top:10px;"> 
                        <div class="row">
                            <div class="col s10 hide_print">
                                <h6>MAZ</h6>
                                <h1>Videos de MAZ </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 



        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script type="text/javascript" src="js/js/menu.js"></script>
    </body>
</html>
