<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contrato</title>


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
        <!--ARCADE JS-->

        <!--MATERIALIZE-->
        <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.css">
        <link rel="stylesheet" type="text/css" href="css/arcade-nav.css">
        <!--MATERIALIZE-->

        <!--HIGHCHARTS-->
        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/pareto.js"></script>
        <script type="text/javascript" src="highcharts/exporting.js"></script>    
        <!--HIGHCHARTS-->


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="js/arcade-puesto.js"></script>
        <script type="text/javascript" src="js/arcade-vacante.js"></script>
        <script type="text/javascript" src="js/arcade-usuario.js"></script>

        <style>
			.size_button{
                transform: scale(.8, .8);
                width: 150px;
            }
            .size_button2{
                transform: scale(.7, .7);
                width: 80px;
            }
            .size_button3{
                transform: scale(.6, .6);
            }
            .tam{
                transform: scale(.9, .9);
                width: 300px;
            }
            @media print {
                .hide_print {
                    display: none!important;
                }
            }


            /*             label color
                        .input-field label {
                            color: #000;
                        }
                         label focus color
                        .input-field input[type=text]:focus + label {
                            color: #000;
                        }
                         label underline focus color
                        .input-field input[type=text]:focus {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         valid color
                        .input-field input[type=text].valid {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         invalid color
                        .input-field input[type=text].invalid {
                            border-bottom: 1px solid #000;
                            box-shadow: 0 1px 0 0 #000;
                        }
                         icon prefix focus color
                        .input-field .prefix.active {
                            color: #000;
                            }
            */
            td{
                padding: 4px 16px;
            }
            th{
                padding: 4px 16px;
            }
            #eliminar{
                font-size: 1.2rem !important;
                color: #ABABAB !important;
                text-decoration: none !important;
                transition: .8s !important;
            }
            #eliminar:hover{
                font-size: 1.2rem !important;
                color: #FE5D49 !important;
                text-decoration: none !important;
            }
            #regresar{
                font-size: 1.2rem !important;
                color: #ABABAB !important;
                text-decoration: none !important;
                transition: .8s !important;
            }
            #regresar:hover{
                font-size: 1.2rem !important;
                color: #FE5D49 !important;
                text-decoration: none !important;
            }
            .innerb{
                overflow: auto;
                height : 29em;
            }
            .innerc{
                overflow: auto;
                height : 12em;
            }
            .size_button{
                transform: scale(.8, .8);
                width: 150px;
            }
            .size_button3{
                transform: scale(.8, .8);
                margin: 6px !important;
            }
            .size_button2{
                transform: scale(.7, .7);
                width: 80px;
            }
            .tam{
                transform: scale(.9, .9);
                width: 300px;
            }
            .tam2{
                /*                transform: scale(.1, .1);*/
                width: 76%;
            }
            .tam3{
                /*                transform: scale(.1, .1);*/
                width: 50%;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col s10 offset-s1 input-field" style="text-align:justify;">
                <h5 class="center-align">CONTRATO TEMPORAL DE TRABAJO.</h5>
                <p>En la ciudad de Monterrey N.L. a los <b><input id="dato1" readonly style="text-align: center; width:3%;"></b> d??as del mes de <b><input id="dato2" readonly style="text-align: center; width:10%;"></b> del a??o <b><input id="dato3" readonly style="text-align: center; width:6%;"></b>, los que suscribimos por una parte
                    <b>SOLUCIONES INTEGRALES DE CR??DITO Y COBRANZAS SA DE CV,</b>  y con domicilio en <b><input id="dato4" readonly style="text-align: center; width:50%;"></b>
                    de la ciudad de <b><input id="dato5" readonly style="text-align: center; width:15%;"></b> a quien se llamara en este contrato <b>PATR??N</b> y
                    por la otra <b><input id="dato6" readonly style="text-align: center; width:47%;"></b> de <b><input id="dato7" readonly style="text-align: center; width:2%;"></b> a??os de edad, de sexo <b><input id="dato8" readonly style="text-align: center; width:10%;"></b> de estado civil
                    <b><input id="dato9" readonly style="text-align: center; width:15%;"></b> y con domicilio en <b><input id="dato10" readonly style="text-align: center; width:40%;"></b> en la ciudad de <b><input id="dato11" readonly style="text-align: center; width:15%;"></b> a
                    quien se le dominara TRABAJADOR, por nuestros propios derechos hacemos constar que hemos convenido en celebrar un 
                    Contrato de Trabajo al tenor de las siguientes.
                </p>
                <h6 class="center-align"><b>CLAUSULAS</b></h6>
                <p>
                    <b>PRIMERA.-</b> Declara el trabajador que tiene completa capacidad y los conocimientos necesarios para desempe??ar el trabajo
                    de <b><input id="dato12"  style="text-align: center; width:25%;"></b> que desempe??ara en el departamento de <b><input id="dato13" readonly style="text-align: center; width:20%;"></b>, en esa virtud, el patr??n acepta ocuparlo 
                    para el desempe??o de las labores mencionadas y actividades conexas, quedando entendidas las partes que si dentro del
                    t??rmino de treinta d??as el trabajador no muestra la capacidad y aptitudes a que se refiere, el patr??n podr?? prescindir de el sin
                    responsabilidad alguna. El trabajador estar?? obligado a prestar sus servicios en trabajos complementarios que le 
                    encomiende el patr??n cuando no haya la actividad espec??fica acostumbrada.
                </p>

                <p>
                    <b>SEGUNDA.-</b> Ambas partes convienen en que este Contrato tiene su origen en las siguientes causas:  
                </p>
                <p>
                    <b>TERCERA.-</b> El lugar de la prestaci??n de los servicios de <b>???EL TRABAJADOR???</b> ser?? domicilio de <b>???EL PATRON???</b>.
                </p>
                <p>
                    As?? mismo <b>???LAS PARTES???</b> convienen y acepta <b>???EL TRABAJADOR???</b> que cuando por razones administrativas o de 
                    desarrollo de la actividad o prestaci??n de servicios contratados haya necesidad de removerlo, podr?? trasladarse al lugar que
                    <b>???EL PATRON???</b> le asigne.
                </p>
                <p>
                    En este caso el <b>???PATRON???</b>le comunicara con anticipaci??n la remoci??n del lugar de prestaci??n de servicios indic??ndole el  
                    nuevo ingreso.              
                </p>
                <p>
                    Para el caso que en el nuevo lugar de prestaci??n de servicios que le fuera asignado variara el horario de labores, <b>???EL 
                        TRABAJADOR???</b> acepta dicha modalidad.
                </p>
                <p>
                    CUARTA.- La jornada diaria de trabajo ser?? de 8 hrs o 6 hrs seg??n el turno de trabajo repartida en la siguiente forma:   
                </p>
                <p>
                    Turno fijo de tarde lunes a viernes de  <b><input id="dato14" style="text-align: center; width:10%;"></b> a <b><input id="dato15" style="text-align: center; width:10%;"></b>y s??bado <b><input id="dato16" style="text-align: center; width:10%;"></b> a <b><input id="dato17" style="text-align: center; width:10%;"></b>
                </p>
                <p>
                    QUINTA.- El patr??n se obliga a pagar como salario por jornada legal <b><input id="sueldo" class="pulse" style="text-align: center; width:40%;"></b> 
                </p>
                <p>
                    El pago se har?? en efectivo cubriendo en su totalidad el que haya devengado el 15 y 31 de cada mes en <b>EL LUGAR DE
                        TRABAJO </b>  al trabajador, quien deber?? firmar la n??mina o recibo correspondiente. De no hacer reclamaci??n alguna al
                    efectuarse el pago, se entender?? que est?? conforme con la liquidaci??n respectiva.
                </p>
                <p>
                    Queda  estrictamente prohibido al trabajador laborar tiempo extraordinario, a menos que el patr??n lo solicite previamente por
                    escrito o el trabajador reciba orden tambi??n por escrito de su jefe inmediato, Para que el trabajador pueda laborar horas
                    extras requiere autorizaci??n por escrito, la falta de presentaci??n de dicho escrito solo es imputable a <b>???EL TRABAJADOR???.</b>
                </p>
                <P>
                    SEXTA.- <b>???EL TRABAJADOR???</b> tendr?? derecho por cada seis d??as de labores a descansar uno con el pago de salario diario
                    correspondiente. Queda establecido preferentemente como d??a de descanso semanal el d??a domingo de cada semana,
                    pudiendo ser cambiado el mismo.
                </P>
                <p>
                    SEPTIMA.- Cuando el <b>???TRABAJADOR???</b> por razones administrativas tenga que laborar el d??a domingo <b>???EL PATRON???</b> le 
                    pagara, adem??s de su salario ordinario, un 25% (Veinticinco por ciento) como prima dominical sobre el salario ordinario devengado.
                    devengado.
                </p>
                <p>
                    OCTAVA-. Al t??rmino de este contrato, el trabajador tendr?? derecho a recibir el pago proporcional que se??ala la ley Federal  
                    de Trabajo, seg??n el tiempo estipulado en este instrumento sobre: vacaciones, prima vacacional y aguinaldo.
                </p>
                <p>
                    NOVENA-. El trabajador ser?? capacitado o adiestrado en los t??rminos de los planes y programas establecidos o que 
                    establezcan en la empresa. Y para constancia de conformidad los interesados, ante testigo, previa lectura. 
                </p>
                <p>
                    DECIMA-. <b>???EL TRABAJADOR???</b> manifiesta saber y conocer que su trabajo implica acceso, conocimiento y manejo de 
                    informaci??n confidencial, Por lo expuesto el trabajador se obliga expl??citamente por este acto a abstenerse absolutamente 
                    de hacer uso de la informaci??n y con otras finalidades que no sean aquellas propias de su trabajo.
                </p>
                <p>
                    El incumplimiento de esta cl??usula ser?? suficiente para la recisi??n laboral entre las partes, dejando a <b>???EL PATRON???</b> libre de
                    toda carga laboral para con <b>???EL TRABAJADOR???</b>, as?? mismo <b>???EL TRABAJADOR???</b> se compromete a liquidar a <b>???EL
                        PATRON???</b> los da??os y perjuicios que este le ocasione.
                </p>
                <p>
                    Enterados del contenido y  alcance legal del presente Documento quienes en ??l intervienen, ratifican y firman de entera 
                    conformidad de manera personal , libre y espont??nea en su aceptaci??n sin que exista error, dolo, violencia, ni mala fe  en 
                    ninguno de los Contratantes, en compa????a de los testigos que damos fe del mismo, en la Ciudad de Monterrey, Nuevo Le??n 
                    a los <b><input id="dato18" readonly style="text-align: center; width:3%;"></b> d??as del mes de <b><input id="dato19" readonly style="text-align: center; width:8%;"></b> del a??o <b><input id="dato20" readonly style="text-align: center; width:6%;"></b>, quedando un ejemplar del mismo en poder de cada uno de los
                    suscriptores.
            </div>    
            <div class="col s10 offset-s1 input-field">        
                </p>
                <p class="center-align">
                    <br>
                    <br>
                    <br>
                    _________________________________________________________ <br>
                <h6 id="nombreFirma" class="center-align"></h6>
                <input class="hide" id="dato21" readonly style="text-align: center; width:45%;">
                </p>
            </div>
            <div class="col s1">
                <a id="print" class="waves-effect waves-light btn pulse  hide_print" style="border-radius: 14px;margin-top: 14px;margin-left: 33px;;margin-right: 0px; background:#c60516;"><i class="material-icons" style="margin: -10px;">print</i></a>
            </div>
        </div>
		
        <!---------------------------------- modales ------------------------------------------>
        <div id="modal1" class="modal tam">
            <div class="modal-content center-align">
                <h5>Desea Generar las Politicas de Telcel?</h5>
            </div>
            <div class="modal-footer">
                <a id='no_contrato' class="modal-action modal-close waves-effect red btn size_button3">No</a>
                <a id='si_contrato' class="modal-action modal-close waves-effect green btn size_button3">Si</a>
            </div>
            <input class="hide" id="hide_input">
        </div>
        <!---------------------------------- Fin modales ------------------------------------------>

        <script type="text/javascript">
            // ARCADE Software??
            //==================================================================
            $(document).ready(function () {
//               $('.modal').modal();
//                var id = window.location.search.substring(1);
//                select_dato_contrato(id);
//                $("#hide_input").val(id);
//                window.setTimeout(() => {
//                    $("#nombreFirma").text($("#dato21").val());
//                }, 1000);   
            });
            //==================================================================
             $("#print").on("click", function () {
                $('#modal1').modal('open');
                window.focus();
                window.print();

            });
            //==================================================================
            $("#si_contrato").on("click", ()=>{
                var id = $("#hide_input").val();
                var nombre = $("#dato6").val();
                window.open("/sistema/contrato-telcel.jsp?"+ nombre);
            });

            // ARCADE Software??
        </script>
        <!--CORE JAVASCRIPT-->        
    </body>
</html>
