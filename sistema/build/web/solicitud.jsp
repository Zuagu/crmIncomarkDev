<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="callcenter.model.ModelSolicitud"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Solicitud</title>
        <link rel="shortcut icon" href="image/logoSicsa/icon.png">
        <link rel="stylesheet" type="text/css" href="css/css/icons-material.css">
        <link rel="stylesheet" type="text/css" href="css/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="css/css/solicitud.css">
    </head>
    <%
        String nombre_solicitante = "";
        String email_solicitante = "";
        String telefono_solicitante = "";
        System.out.println(request.getParameter("nombre_solicitante"));
        System.out.println(request.getParameter("email_solicitante"));
        System.out.println(request.getParameter("telefono_solicitante"));

        if (request.getParameter("nombre_solicitante") == null
                || request.getParameter("nombre_solicitante").isEmpty()
                || request.getParameter("email_solicitante") == null
                || request.getParameter("email_solicitante").isEmpty()
                || request.getParameter("telefono_solicitante") == null
                || request.getParameter("telefono_solicitante").isEmpty()) {
            response.sendRedirect("index.jsp");
        } else {
            nombre_solicitante = request.getParameter("nombre_solicitante");
            email_solicitante = request.getParameter("email_solicitante");
            telefono_solicitante = request.getParameter("telefono_solicitante");
            String datos_opciones = ModelSolicitud.select_values_inputselect();
            out.write("<script> var datos_opciones = "+ datos_opciones +";</script>");
        }
    %>
    <body id="body">
        <nav class="color_nav">
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo"><img src="image/incomark.png"  class="img_log"></a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="mobile.html"><i class="material-icons">more_vert</i></a></li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div id="form_1" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 ">
                    <div class="input-field center-align ">
                        <h5><b>Escribe tu nombre completo</b></h5>
                        <input id="nombre_solicitante" type="text" placeholder="" value="<%= nombre_solicitante%>">
                    </div>  
                    <div class="col s10 m10 l10 offset-s1 offset-m1 offset-l1 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso2" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_2" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Puesto Solicitado</b></h5>
                        <select id="puesto_solicitado">
                            <option value="" disabled selected>Elige el puesto solicitado</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso1" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso3" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_3" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>A trabajado en un callcenter? si es que si especifica en que tipo.</b></h5>
                        <select id="tipo_callcenter">
                            <option value="" disabled selected>Seleccione</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso2" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso4" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_4" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Que mora haz manejado?</b></h5>
                        <select id="mora_manejada">
                            <option value="" disabled selected>Selecciona</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso3" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso5" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_5" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Sucursal a la que solicitas.</b></h5>
                        <select id="sucursal">
                            <option value="" disabled selected>Selecciona</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso4" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso6" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_6" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>selecciona el Reclutador que te contacto.</b></h5>
                        <select id="reclutador">
                            <option value="" disabled selected>Selecciona</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso5" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso7" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_7" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Cual es el medio por el cual te enteraste de la vacante?</b></h5>
                        <select id="medio_contacto">
                            <option value="" disabled selected>Selecciona el medio</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso6" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso8" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_8" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Especifica el medio de contactacion</b></h5>
                        <select id="medio_especifico">
                            <option value="" disabled selected>Especifica el medio</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso7" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso9" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_9" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>En seguida iniciaremos con la parte de datos generales</b></h5>

                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso8" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso10" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_10" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu Direccion </b></h5>
                    </div>  
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="calle_solicitante" type="text" placeholder="Ingresa tu calle y No." >
                    </div>  
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="colonia_solicitante" type="text" placeholder="Ingresa tu Colonia" >
                    </div>  
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="ciudad_solicitante" type="text" placeholder="Ingresa tu Ciudad" >
                    </div>  
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="estado_solicitante" type="text" placeholder="Ingresa tu Estado" >
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso9" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso11" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_11" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu numero de telefono de casa</b></h5>
                        <input id="numero_casa" type="text" placeholder="ingresa tu numero de telefono a 10 digitos" >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso10" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso12" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_12" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu numero de celular</b></h5>
                        <input id="numero_celular" type="text" placeholder="ingresa tu numero de celular a 10 digitos" value="<%= telefono_solicitante%>" >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso11" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso13" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_13" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu email</b></h5>
                        <input id="email" type="email" placeholder="ingresa tu email" value="<%= email_solicitante%>" >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso12" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso14" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_14" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu fecha de nacimiento</b></h5>
                        <input id="fecha_nacimiento" type="text"   class="datepicker" placeholder="ingresa tu fecha de nacimiento"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso13" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso15" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_15" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu lugar de nacimiento</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="ciudad_nacimiento" type="text" placeholder="Ingresa ciudad o municipio" >
                    </div>  
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="estado_nacimiento" type="text" placeholder="Ingresa tu Estado" >
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso14" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso16" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_16" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu sexo</b></h5>
                        <select id="sexo_solicitante">
                            <option value="" disabled selected>Selecciona</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso15" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso17" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_17" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu Edad</b></h5>
                        <select id="edad_solicitante">
                            <option value="" disabled selected>Selecciona</option>
                            <option value="15" >15</option>
                            <option value="16" disabled selected>16</option>
                            <option value="17" disabled selected>17</option>
                            <option value="18" disabled selected>18</option>
                            <option value="19" disabled selected>19</option>
                            <option value="20" disabled selected>20</option>
                            <option value="21" disabled selected>21</option>
                            <option value="22" disabled selected>22</option>
                            <option value="23" disabled selected>23</option>
                            <option value="24" disabled selected>24</option>
                            <option value="25" disabled selected>25</option>
                            <option value="26" disabled selected>26</option>
                            <option value="27" disabled selected>27</option>
                            <option value="28" disabled selected>28</option>
                            <option value="29" disabled selected>29</option>
                            <option value="30" disabled selected>30</option>
                            <option value="31" disabled selected>31</option>
                            <option value="32" disabled selected>32</option>
                            <option value="33" disabled selected>33</option>
                            <option value="34" disabled selected>34</option>
                            <option value="35" disabled selected>35</option>
                            <option value="36" disabled selected>36</option>
                            <option value="37" disabled selected>37</option>
                            <option value="38" disabled selected>38</option>
                            <option value="39" disabled selected>39</option>
                            <option value="40" disabled selected>40</option>
                            <option value="41" disabled selected>41</option>
                            <option value="42" disabled selected>42</option>
                            <option value="43" disabled selected>43</option>
                            <option value="44" disabled selected>44</option>
                            <option value="45" disabled selected>45</option>
                            <option value="46" disabled selected>46</option>
                            <option value="47" disabled selected>47</option>
                            <option value="48" disabled selected>48</option>
                            <option value="49" disabled selected>49</option>
                            <option value="50" disabled selected>50</option>
                            <option value="51" disabled selected>51</option>
                            <option value="52" disabled selected>52</option>
                            <option value="53" disabled selected>53</option>
                            <option value="54" disabled selected>54</option>
                            <option value="55" disabled selected>55</option>
                            <option value="56" disabled selected>56</option>
                            <option value="57" disabled selected>57</option>
                            <option value="58" disabled selected>58</option>
                            <option value="59" disabled selected>59</option>
                            <option value="60" disabled selected>60</option>
                            <option value="61" disabled selected>61</option>
                            <option value="62" disabled selected>62</option>
                            <option value="63" disabled selected>63</option>
                            <option value="64" disabled selected>64</option>
                            <option value="65" disabled selected>65</option>
                            <option value="66" disabled selected>66</option>
                            <option value="67" disabled selected>67</option>
                            <option value="68" disabled selected>68</option>
                            <option value="69" disabled selected>69</option>
                            <option value="70" disabled selected>70</option>
                            <option value="71" disabled selected>71</option>
                            <option value="72" disabled selected>72</option>
                            <option value="73" disabled selected>73</option>
                            <option value="74" disabled selected>74</option>
                            <option value="75" disabled selected>75</option>
                        </select>
                    </div>  
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso16" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso18" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_18" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu numero del IMSS, en caso de no tenerlo dejar el campo en blanco</b></h5>
                        <input id="imss" type="text" placeholder="ingresa tu numero del imss"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso17" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso19" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_19" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Selecciona tu clinica</b></h5>
                        <input id="clinica_solicitante" type="text" placeholder="selecciona"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso18" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso20" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_20" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Especifica tu estado civil</b></h5>
                        <select id="estado_civil">
                            <option value="" disabled selected>Especifica el medio</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso19" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso21" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_21" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu RFC, en caso de no tenerlo favor de dejar el espacio en blanco </b></h5>
                        <input id="rfc_solicitante" type="text" placeholder="selecciona"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso20" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso22" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_22" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Cuantas personas dependente de ti economicamente?</b></h5>
                        <input type="number" id="dep_eco" name="quantity" min="1" max="10">
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso21" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso23" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_23" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu numero de infonavit, en caso de no tenerlo dejar el espacio en blanco</b></h5>
                        <input id="infonavit_solicitante" type="text" placeholder="selecciona"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso22" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso24" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_24" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Turno deseado:</b></h5>
                         <select id="turno_solicitante">
                            <option value="0" disabled selected>Selecciona</option>
                            <option value="1" disabled selected>Si</option>
                            <option value="2" disabled selected>No</option>
                        </select>>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso23" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso25" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_25" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Tienes dispocision en cambio de Residencia:</b></h5>
                        <select id="disp_residencia">
                            <option value="0" disabled selected>Selecciona</option>
                            <option value="1" disabled selected>Si</option>
                            <option value="2" disabled selected>No</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso24" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso26" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_26" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Tienes disponibilidad de viajar:</b></h5>
                        <select id="disp_viajar">
                            <option value="0" disabled selected>Selecciona</option>
                            <option value="1" disabled selected>Si</option>
                            <option value="2" disabled selected>No</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso25" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso27" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_27" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Cuentas con automovil propio:</b></h5>
                        <select id="auto_propio">
                            <option value="0" disabled selected>Selecciona</option>
                            <option value="1" disabled selected>Si</option>
                            <option value="2" disabled selected>No</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso26" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso28" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_28" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Cuentas con licencia de manejo:</b></h5>
                        <select id="lic_vigente">
                            <option value="0" disabled selected>Selecciona</option>
                            <option value="1" disabled selected>Si</option>
                            <option value="2" disabled selected>No</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso27" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso29" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>
                <div id="form_29" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Trabajas Actualmente:</b></h5>
                        <select id="trab_actual">
                            <option value="0" disabled selected>Selecciona</option>
                            <option value="1" disabled selected>Si</option>
                            <option value="2" disabled selected>No</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso28" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso30" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_30" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>En caso de trabajar en otro lugar podria indicarnos su horario:</b></h5>
                    </div>   
                    <div class="input-field center-align col s6 m6 l6 ">
                        <input id="hor_otro_trabajo_1" type="text" class="datepicker" placeholder="desde">
                    </div>   
                    <div class="input-field center-align col s6 m6 l6 ">
                        <input id="hor_otro_trabajo_2"  type="text" class="datepicker" placeholder="hasta">
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso29" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso31" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_31" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Estudias Actualmente:</b></h5>
                        <select id="act_estudias">
                            <option value="0" disabled selected>Selecciona</option>
                            <option value="1" disabled selected>Si</option>
                            <option value="2" disabled selected>No</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso30" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso32" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_32" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>En caso de estudiar podria indicarnos su horario:</b></h5>
                    </div>   
                    <div class="input-field center-align  col s6 m6 l6">
                        <input id="hor_escuela_1" type="text" class="datepicker" placeholder="desde">
                    </div>   
                    <div class="input-field center-align col s6 m6 l6">
                        <input id="hor_escuela_2"  type="text" class="datepicker" placeholder="hasta">
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso31" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso33" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_33" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ingresa tu CURP, en caso de no tenerlo dejar el campo en blanco</b></h5>
                        <input id="curp" type="text"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso32" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso34" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_34" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Menciona tus virtudes y cualidades</b></h5>
                        <input id="virtud_cualidad" type="text"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso33" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso35" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_35" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>A continuacion pasaremos a la parte de informacion de estudios Academicos</b></h5>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso34" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso36" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_36" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Cual es tu nivel de estudios:</b></h5>
                        <select id="nivel_estudios">
                            <option value="" disabled selected>Selecciona</option>
                        </select>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso35" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso37" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_37" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Ultima o Actual institucion Academica y grado</b></h5>
                        <input id="nombre_institucion_academica" type="text"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso36" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso38" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_38" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Que porcentaje de ingles manejas?</b></h5>
                        <input id="porcentaje_ingles" type="text"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso37" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso39" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_39" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Menciona el software que utilizas o sabes manejar</b></h5>
                        <input id="software" type="text"  >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso38" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso40" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_40" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>A continuacion emepzaremos con los datos familiares</b></h5>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso39" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso41" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_41" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>ingresar los siguientes datos de tu Padre</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="nombre_padre_solicitante" type="text" placeholder="ingresa nombre completo"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="domicilio_padre" type="text" placeholder="ingresa domicilio" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="edad_padre" type="text" placeholder="Ingresa Edad" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="ocupacion_padre" type="text" placeholder="ingresa Ocupacion" >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso40" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso42" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_42" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>ingresar los siguientes datos de tu Madre</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="nombre_madre_solicitante" type="text" placeholder="ingresa nombre completo"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="domicilio_madre" type="text" placeholder="ingresa domicilio" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="edad_madre" type="text" placeholder="Ingresa Edad" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="ocupacion_madre" type="text" placeholder="ingresa Ocupacion" >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso41" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso43" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_43" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>ingresar los siguientes datos de otro familiar</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="nombre_otro_solicitante" type="text" placeholder="ingresa nombre completo"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="domicilio_otro" type="text" placeholder="ingresa domicilio" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="edad_otro" type="text" placeholder="Ingresa Edad" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="ocupacion_otro" type="text" placeholder="ingresa Ocupacion" >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso42" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso44" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>    
                <div id="form_44" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>ingresar los siguientes datos de otro familiar</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="nombre_otro_solicitante_2" type="text" placeholder="ingresa nombre completo"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="domicilio_otro_2" type="text" placeholder="ingresa domicilio" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="edad_otro_2" type="text" placeholder="Ingresa Edad" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="ocupacion_otro_2" type="text" placeholder="ingresa Ocupacion" >
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso43" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso45" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div> 
                <div id="form_45" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>!!Ya casi terminamos!! ahora empezaremos con la ultima parte Experiencia laboral</b></h5>
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso44" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! En caso de no tener experiencia laboral favor de dar en finalizar !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso46" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div>  
                <div id="form_46" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>ingresar los siguientes datos de tu ultimo trabajo</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="nombre_ultima_empresa" type="text" placeholder="Nombre de la empresa"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="domicilio_ultima_empresa" type="text" placeholder="Domicilio de la empresa"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="giro_ultima_empresa" type="text" placeholder="Cual es el giro de la empresa" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="dep_ultima_empresa" type="text" placeholder="En que Area o departamento se encontraba" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="puesto_ultima_empresa" type="text" placeholder="Que puesto desempeñaba en la empresa">
                    </div>     
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="mora_ultima_empresa" type="text" placeholder="Que mora manejaba">
                    </div>     
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="telefono_ultimo_trabajo" type="text" placeholder="Telefono de contacto de la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="fecha_inicio_ultimo" class="datepicker" type="text" placeholder="Fecha en la que empezo a laborar en la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="fecha_fin_ultimo" class="datepicker" type="text" placeholder="Fecha en la que termino a laborar en la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="sueldo_ultimo" type="text" placeholder="Sueldo mensual percibido">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="comision_ultimo" type="text" placeholder="Comision mensual percibida">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="producto_ultimo" type="text" placeholder="Que producto es el que trabajaba?">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="motivo_ultimo" type="text" placeholder="Cual fue el motivo de su separacion?">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="funciones_ultimo" type="text" placeholder="Cuales eran sus funciones y Actividades?">
                    </div>   
                    <div class="input-field center-align col s12 m12 l12 ">
                        <input id="herramienta_ultimo" type="text" placeholder="Que herramientas y equipo utilizado?">
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso45" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso47" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div> 
                <div id="form_47" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>ingresar los siguientes datos de tu penultimo trabajo</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="nombre_penultima_empresa" type="text" placeholder="Nombre de la empresa"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="domicilio_penultima_empresa" type="text" placeholder="Domicilio de la empresa"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="giro_penultima_empresa" type="text" placeholder="Cual es el giro de la empresa" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="dep_penultima_empresa" type="text" placeholder="En que Area o departamento se encontraba" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="puesto_penultima_empresa" type="text" placeholder="Que puesto desempeñaba en la empresa">
                    </div>     
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="mora_penultima_empresa" type="text" placeholder="Que mora manejaba">
                    </div>     
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="telefono_penultimo_trabajo" type="text" placeholder="Telefono de contacto de la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="fecha_inicio_penultimo" class="datepicker" type="text" placeholder="Fecha en la que empezo a laborar en la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="fecha_fin_penultimo" class="datepicker" type="text" placeholder="Fecha en la que termino a laborar en la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="sueldo_penultimo" type="text" placeholder="Sueldo mensual percibido">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="comision_penultimo" type="text" placeholder="Comision mensual percibida">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="producto_penultimo" type="text" placeholder="Que producto es el que trabajaba?">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="motivo_penultimo" type="text" placeholder="Cual fue el motivo de su separacion?">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="funciones_penultimo" type="text" placeholder="Cuales eran sus funciones y Actividades?">
                    </div>   
                    <div class="input-field center-align col s12 m12 l12">
                        <input id="herramienta_penultimo" type="text" placeholder="Que herramientas y equipo utilizado?">
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso46" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso48" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div> 
                <div id="form_48" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>ingresar los siguientes datos de tu antepenultimo trabajo</b></h5>
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="nombre_antepenultima_empresa" type="text" placeholder="Nombre de la empresa"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="domicilio_antepenultima_empresa" type="text" placeholder="Domicilio de la empresa"  >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="giro_antepenultima_empresa" type="text" placeholder="Cual es el giro de la empresa" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="dep_antepenultima_empresa" type="text" placeholder="En que Area o departamento se encontraba" >
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="puesto_antepenultima_empresa" type="text" placeholder="Que puesto desempeñaba en la empresa">
                    </div>     
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="mora_antepenultima_empresa" type="text" placeholder="Que mora manejaba">
                    </div>     
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="telefono_antepenultimo_trabajo" type="text" placeholder="Telefono de contacto de la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="fecha_inicio_antepenultimo" class="datepicker" type="text" placeholder="Fecha en la que empezo a laborar en la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="fecha_fin_antepenultimo" class="datepicker" type="text" placeholder="Fecha en la que termino a laborar en la empresa">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="sueldo_antepenultimo" type="text" placeholder="Sueldo mensual percibido">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="comision_antepenultimo" type="text" placeholder="Comision mensual percibida">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="producto_antepenultimo" type="text" placeholder="Que producto es el que trabajaba?">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="motivo_antepenultimo" type="text" placeholder="Cual fue el motivo de su separacion?">
                    </div>   
                    <div class="input-field center-align col s12 m6 l6 ">
                        <input id="funciones_antepenultimo" type="text" placeholder="Cuales eran sus funciones y Actividades?">
                    </div>   
                    <div class="input-field center-align col s12 m12 l12 ">
                        <input id="herramienta_antepenultimo" type="text" placeholder="Que herramientas y equipo utilizado?">
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso47" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!! Recuerda llenar los datos correctamente si no tu solicitud quedara invalidada. !!</h6>
                    </div> 
                    <div class="col s1 m1 l1  center-align ">
                        <a id="paso49" class="btn-floating btn-small waves-effect waves-light color_nav cambio"><i class="material-icons">arrow_forward</i></a>
                    </div> 
                </div> 
                <div id="form_49" class="col s10 m10 l10 offset-l1 offset-m1 offset-s1 hide">
                    <div class="input-field center-align ">
                        <h5><b>Haz terminado la solicitud nos comunicaremos contigo despues de la evaluacion</b></h5>
                        <!--<a id="guardar" class=" btn-large waves-effect waves-light color_nav  "><i class="material-icons">send</i>Finalizar</a>-->
                    </div>   
                    <div class="col s1 m1 l1 center-align ">
                        <a id="regreso48" class="btn-floating btn-small waves-effect waves-light color_nav cambio "><i class="material-icons">arrow_back</i></a>
                    </div> 
                    <div class="col s10 m10 l10 center-align ">
                        <h6 class="red-text">!!Suerte esperamos que seas parte de nuestro equipo!!</h6>
                    </div> 
                </div>  
            </div>
        </div>
        <script type="text/javascript" src="js/js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" src="js/js/materialize.min.js"></script>
        <script>
            for (let row of datos_opciones ) {
                $('#' + row.id_selector).append('<option>' + row.value + '</option>');
            }
            $('select').formSelect();
        </script>
        <script type="text/javascript" src="js/js/solicitud.js"></script>
    </body>
</html>