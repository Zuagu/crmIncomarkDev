<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="image/12.png" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Usuarios</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/usuarios.css">
    </head>

    <body>
        <nav class="grey darken-4">
            <div class="nav-wrapper icon_nav">
                <a href="#!" id="menu"  class="brand-logo left"><i class="material-icons icon_nav icon_menu">menu</i></a>
                <input id="filtro" class="search center-align grey darken-2" type="text" placeholder="Buscar">
                <ul class="icon_nav right">
                    <a href="mobile.html"><i class="material-icons icon_nav">more_vert</i></a>
                </ul>
            </div>
        </nav>
        <!--div lista de usuarios-->
        <div class="row">
            <div class="col s12 m10 offset-m1">
                <div id="table_user" class="col s12 m12 table_user z-depth-2 inner white">

                </div>
            </div>
        </div>

        <!-- Modal datos del usuario -->
        <div id="modal1" class="modal inner">
            <div class="modal-content">
                <div class="row">
                    <div class="col s12 fondo">
                        <div class="col s12 white-text right-align options">
                            <i class="material-icons modal-close eliminar">delete</i>
                            <i class="material-icons edit">create</i>
                            <i class="material-icons save hide">save</i>
                            <i class="material-icons modal-close">close</i>
                        </div>
                        <div class="col s12 m9 offset-m3">
                            <ul id="tabs-swipe-demo" class="tabs">
                                <li class="tab col s2"><a class="active" href="#test-swipe-1">Datos</a></li>
                                <li class="tab col s2"><a href="#test-swipe-2">Archivo</a></li>
                                <li class="tab col s3"><a href="#test-swipe-3">Contrato</a></li>
                                <li class="tab col s3"><a href="#test-swipe-4">Estadisticas</a></li>
                                <li class="tab col s2"><a href="#test-swipe-5">Entradas</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col s12 m3 box_image">
                        <div class="col s6 offset-s3 m11 offset-m1 cont_img hoverable">
                            <img class="image_perfil" src="image/users/1.jpg" alt="" width="85%">
                        </div>
                        <div class="col s12 options2">
                            <div class="col s2">
                                <i class="modal-close material-icons eliminar">delete</i>
                            </div>
                            <div class="col s2 offset-s8">
                                <i class="material-icons waves-effect edit">create</i>
                                <i class="material-icons waves-effect save hide">save</i>
                            </div>
                        </div>
                        <h4 class="center col s12 m11 offset-m1"><b id="id_user"></b></h4>
                        <h6 class="center col s12 m11 offset-m1"><b id="puesto"></b></h6>
                    </div>
                    <div class="col s12 m9 data_user">

                        <div id="test-swipe-1" class="col s12 div_tabs">
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">account_box</i>
                                <input id="name" type="text" class="validate" readonly placeholder="">
                                <label for="name">Nombre</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="alias" type="text" class="validate" readonly placeholder="">
                                <label for="alias">Alias</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">email</i>
                                <input id="correo" type="text" class="validate" readonly placeholder="">
                                <label for="correo">Correo</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">person_pin</i>
                                <input id="jefe" type="text" class="autocomplete" readonly placeholder="">
                                <label for="jefe">Jefe Inmediato</label>
                            </div>
                            <div class="input-field col s6 m6">
                                <i class="material-icons prefix">assignment_ind</i>
                                <select id="sexo"></select>
                                <label>Sexo</label>
                            </div>
                            <div class="input-field col s6 m6">
                                <i class="material-icons prefix">date_range</i>
                                <input id="f_nacimiento" type="text" class="datepicker" readonly placeholder="">
                                <label for="f_nacimiento">Fecha Nacimiento</label>
                            </div>
                            <div class="input-field col s6 m6">
                                <i class="material-icons prefix">portrait</i>
                                <select id="empleado"></select>
                                <label>Tipo Empleado</label>
                            </div>
                            <div class="input-field col s6 m6">
                                <i class="material-icons prefix">update</i>
                                <input id="ingreso" type="text" class="datepicker" readonly placeholder="">
                                <label for="ingreso">Ingreso</label>
                            </div>
                            <div class="input-field col s6 m6">
                                <i class="material-icons prefix">call</i>
                                <input id="telefono" type="text" class="validate" readonly placeholder="">
                                <label for="telefono">Telefono</label>
                            </div>

                            <div class="input-field col s6 m6">
                                <i class="material-icons prefix">phone_iphone</i>
                                <input id="celular" type="text" class="validate" readonly placeholder="">
                                <label for="celular">Celular</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">location_city</i>
                                <select id="sucursal"></select>
                                <label>Sucursal</label>
                            </div>

                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">alarm</i>
                                <input id="horario" type="text" class="validate" readonly placeholder="">
                                <label for="horario">Horario</label>
                            </div>

                        </div>
                        <div id="test-swipe-2" class="col s12 div_tabs">
                            <div class="col s12 m4">
                                <p>
                                    <label>
                                        <input id="f_naci" type="checkbox" />
                                        <span>Acta de Nacimiento</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input id="ife" type="checkbox" />
                                        <span>IFE</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input id="nss" type="checkbox" />
                                        <span>Numero del Seguro Social</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input id="fotos" type="checkbox" />
                                        <span>Fotos</span>
                                    </label>
                                </p>
                            </div>
                            <div class="col s12 m4">
                                <p>
                                    <label>
                                        <input id="curp" type="checkbox" />
                                        <span>CURP</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input id="com_est" type="checkbox" />
                                        <span>Comprobante de Estudios</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input id="com_dom" type="checkbox" />
                                        <span>Comprobante de Domicilio</span>
                                    </label>
                                </p>
                            </div>
                            <div class="col s12 m4">
                                <p>
                                    <label>
                                        <input id="carta" type="checkbox" />
                                        <span>Carta de Referencia</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input id="no_infv" type="checkbox" />
                                        <span>No Infonavit</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input id="rfc" type="checkbox" />
                                        <span>RFC</span>
                                    </label>
                                </p>
                            </div>
                        </div>
                        <div id="test-swipe-3" class="col s12 div_tabs">
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <a href="#" onclick="alert_format(users[index_pos].contrato, $(this).text(), 'contrato')">
                                        <img src="image/users/CONTRATO.png" alt="" width="100%">
                                        Contrato
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <a href="#" onclick="alert_format(users[index_pos].memorandum, $(this).text(), 'memorandum')">
                                        <img src="image/users/MEMORANDUM.png" alt="" width="100%">
                                        Memorandum
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <a href="#" onclick="alert_format(users[index_pos].reglamento, $(this).text(), 'reglamento')">
                                        <img src="image/users/REGLAMENTO.png" alt="" width="100%">
                                        Reglamento
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <input type="hidden" class="data_format" value="suspencion">
                                    <a href="#" onclick="alert_format(users[index_pos].suspencion, $(this).text(), 'suspencion')">
                                        <img src="image/users/SUSPENCION.png" alt="" width="100%">
                                        Suspencion
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <a href="#" onclick="alert_format(users[index_pos].acta_administrativa, $(this).text(), 'acta_administrativa')">
                                        <img src="image/users/ACTA_ADMINISTRATIVA.png" alt="" width="100%">
                                        Acta Administrativa
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <a href="#" onclick="alert_format(users[index_pos].ausencia_laboral, $(this).text(), 'ausencia_laboral')">
                                        <img src="image/users/AUSENCIA_LABORAL.png" alt="" width="100%">
                                        Ausencia Laboral
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <a href="#" onclick="alert_format(users[index_pos].carta_recomendacion, $(this).text(), 'carta_recomendacion')">
                                        <img src="image/users/CARTA_RECOMENDACION.png" alt="" width="100%">
                                        Carta de Recomendacion
                                    </a>
                                </div>
                            </div>
                            <div class="col s6 m3 cont_doc">
                                <div class="col s10 offset-s1 center-align hoverable waves-effect card-panel format">
                                    <a href="#" onclick="alert_format(users[index_pos].constancia_laboral, $(this).text(), 'constancia_laboral')">
                                        <img src="image/users/CONSTANCIA_LABORAL.png" alt="" width="100%">
                                        Constancia Laboral
                                    </a>
                                </div>
                            </div>

                        </div>
                        <div id="test-swipe-4" class="col s12 div_tabs">
                            <div class="col s6 m3 cont_doc">

                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <!-- boton flotante izq-->
            <div class="fixed-action-btn left_btn">
                <a class="btn-floating btn-large prev">
                    <i class="large material-icons">chevron_left</i>
                </a>
            </div>
            <!-- boton flotante dere-->
            <div class="fixed-action-btn">
                <a class="btn-floating btn-large nex">
                    <i class="large material-icons">chevron_right</i>
                </a>
            </div>
        </div>
        <!-- modal alert lista de contratos -->
        <div id="modal_alert" class="modal modal-alert">
            <div class="modal-content center-align">
                <h5><b class="title"></b></h5>
                <br>
                <h6 class="sms_alert"></h6>
                <br><br>
                <div class="btn_alert">
                    <a href="#" class="waves-effect btn red left">Calcelar</a>
                    <a id="update_user" href="#" class="waves-effect btn blue right">Aceptar</a>
                </div>
                <br><br>
            </div>
        </div>
        <!-- modal alert contrato nuevo-->
        <div id="modal_formato" class="modal modal-alert">
            <div class="modal-content center-align">
                <h5><b id="nom_format"></b></h5>
                <div id="data_format" class="collection">

                </div>
                <b>Quiere generar un nuevo formato?</b>
                <br><br>
                <div class="btn_alert">
                    <a href="#" class="waves-effect btn modal-close red left">Calcelar</a>
                    <a href="#" id="insert_format" class="waves-effect btn blue right" >Generar</a>
                </div>
                <br><br>
            </div>
        </div>
        <!-- modal vista de horario del usuario -->
        <div id="modal_schedules" class="modal modal_schedules1">
            <div class="modal-content center-align">
                <div class="row">
                    <a class="waves-effect waves-teal modal-close z-depth-1 hoverable right btn_circle_close"><i class="material-icons black-text">close</i></a>
                    <h6 class="center-align"><b>USUARIO: </b><b id="h_name_user"></b></h6>

                    <div class="input-field col s12 m4 offset-m4 left-align">
                        <i class="material-icons prefix">alarm</i>
                        <select id="select_schedules">
                            <option>Selecciona un Horario</option>
                        </select>
                        <label>Horarios</label>
                    </div>
                    <div class="col s12 m10 offset-m1 table_horario z-depth-2 white">
                        <table>
                            <thead>
                                <tr>
                                    <th>Dia</th>
                                    <th>Entrada</th>
                                    <th>Salida</th>
                                    <th>Total</th>
                                    <th>Nombre</th>
                                </tr>
                            </thead>
                            <tbody id="body_table_horario">

                            </tbody>
                        </table>
                    </div>
                    <div class="col s10 offset-s1 box_btn">
                        <a id="create_schedules" class="waves-effect waves-teal blue left btn-small">Hoario Especial</a>
                        <a id="update_horario" class="waves-effect waves-teal green right btn-small">Actualizar</a>
                    </div>

                </div>
            </div>
        </div> 
        <!-- modal para ingresar un horario personalizado -->
        <div id="modal_create_schedules" class="modal modal_schedules1">
            <div class="modal-content center-align">
                <div class="row">
                    <a class="waves-effect waves-teal modal-close z-depth-1 hoverable right btn_circle_close"><i class="material-icons black-text">close</i></a>
                    <h5 class="center-align"><b>Horario especial</b></h5>

                    <div class="col s12 m8 offset-m2 data_hours">
                        <div class="input-field col s12 m8 offset-m2 left-align">
                            <i class="material-icons prefix">today</i>
                            <select id="select_day">
                                <option value="8">Lunes a Sabado</option>
                                <option value="2">Lunes</option>
                                <option value="3">Martes</option>
                                <option value="4">Miercoles</option>
                                <option value="5">Jueves</option>
                                <option value="6">Viernes</option>
                                <option value="7">Sabado</option>
                                <option value="1">Domingo</option>
                            </select>
                            <label>Dia</label>
                        </div>
                        <div class="input-field col s6 m5 offset-m1">
                            <input id="especial_entrada" type="text" class="timepicker">
                            <label for="especial_entrada">Entrada</label>
                        </div>
                        <div class="input-field col s6 m5">
                            <input id="especial_salida" type="text" class="timepicker">
                            <label for="especial_salida">Salida</label>
                        </div>

                        <p></p>
                    </div>
                    <div class="col s10 offset-s1 right-align box_btn">
                        <a id="insert_horario_especial" class="waves-effect waves-teal green btn-small">Actualizar</a>
                    </div>

                </div>
            </div>
        </div> 

        <div id="modal_puestos" class="modal">
            <div class="modal-content center-align">
                <div class="row">
                    <a class="waves-effect waves-teal modal-close z-depth-1 hoverable right btn_circle_close"><i class="material-icons black-text">close</i></a>
                    <h5 class="center-align"><b>Cabiar Puesto</b></h5>

                    <div class="col s12 m10 offset-m1 caja_puesto inner">
                        <ul class="collapsible left-align">
                            
                        </ul>
                    </div>
                    <div class="col s10 offset-s1 right-align box_btn">
                        <!--<a class="waves-effect modal-close waves-teal red btn-small">Cerrar</a>-->
                        <!--<a id="" class="waves-effect waves-teal green btn-small">Asignar</a>-->
                    </div>

                </div>
            </div>
        </div> 
        
        <div id="modal_user_puestos" class="modal">
            <div class="modal-content center-align">
                
                <div class="row">
                    <a id="btn_close_vacantes" class="waves-effect waves-teal z-depth-1 hoverable right"><i class="material-icons black-text">close</i></a>
                    <h5 class="center-align"><b id="name_puesto"></b></h5>
                    <input id="id_puesto_modal_puestos" type="hidden" class="validate">
                    <div class="col s12 m10 offset-m1 z-depth-1 white box_vacantes inner">
                        <table class="">
                            <thead>
                                <tr>
                                    <th>Vacante</th>
                                    <th>Nombre</th>
                                    <th>Fecha Creacion</th>
                                    <th>Fecha Asignacion</th>
                                </tr>
                            </thead>
                            <tbody id="list_vacantes">
                                
                            </tbody>
                        </table>
                        
                    </div>
                    <div class="col s10 offset-s1 right-align box_btn">
                        
                        <a id="btn_delete_vacante" class="waves-effect waves-teal red disabled btn-small">Eliminar</a>
                        <a id="btn_nueva_vacante" class="waves-effect waves-teal blue btn-small">Nuevo</a>
                        <a id="update_puesto" class="waves-effect waves-teal green disabled btn-small">Asignar</a>
                    </div>

                </div>
            </div>
        </div>
        
        <div id="modal_nueva_vacante" class="modal">
            <div class="modal-content center-align">
                <div class="row">
                    <h5 class="center-align"><b>Nueva Vacante</b></h5>
                    <div class="col s12 m10 offset-m1 white">
                        <h6 class="left-align">Nombre de la Vacante:</h6>
                        <input id="name_vacante" type="text" class="validate">
                    </div>
                    <div class="col s10 offset-s1 right-align box_btn">
                        <a class="waves-effect modal-close waves-teal red btn-small">Cancelar</a>
                        <a id="btn_insert_vacante" class="waves-effect waves-teal blue btn-small">Crear</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="modal_delete_vacante" class="modal">
            <div class="modal-content center-align">
                <div class="row">
                    <div class="col s10 offset-s1 box_delete_vacante">
                        <h4 class="col s12">Confirma la Eliminacion de la Vacante</h4>
                        <a class="waves-effect modal-close waves-teal left blue btn-small">Cancelar</a>
                        <a id="btn_confirm_delete_vacante" class="waves-effect right waves-teal red btn-small">Eliminar</a>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="js/js/jquery-2.2.4.min.js"></script>
        <script src="js/js/materialize.min.js"></script>
        <script src="js/js/users.js"></script>
    </body>

</html>