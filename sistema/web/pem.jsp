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
        <script type="text/javascript" src="js/arcade-pem.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <div>

            

            <div id="wrapper">

                <div id="page-wrapper">
                    <!--BEGIN TITLE & BREADCRUMB PAGE-->
                    <div class="page-title-breadcrumb option-demo">
                        <div class="page-header pull-right">
                            <div class="page-title">
                                Cat·logo de PaÌses, Estados y Municipios.
                            </div>
                        </div>
                        <ol class="breadcrumb page-breadcrumb pull-left">
                            <li>Manuales de usuario de este modulo:</li>
                            <li id="pdf_horas-clase-maestro"><img onclick="parent.abrir_manual()" class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>
                            <!-- li><a href="#">Layouts</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li -->
                        </ol>
                        <div class="clearfix">
                        </div>
                    </div>
                    <!--END TITLE & BREADCRUMB PAGE-->

                    <!--BEGIN CONTENT-->

                    <br>
                    <table style="width:94%;margin: 0px auto;">
                        <tr>
                            <td>
                                <!-- PAISES -->
                                <div id='div_insert_pais' class="datagrid">
                                    <table style="background-color:#E8E8E8" >
                                        <thead>
                                            <tr>
                                                <th colspan="2" align="center">PAISES</th>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td style="width: 20% "><input class="alfanumerico"  placeholder="NUEVO PAIS" style="width: 100%;" id="pais"></td>
                                            <td style="width: 10%" ><input  id="insert_pais" type="button" value="A—ADIR"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">TABLA DE PAISES ACTIVOS.<div id="listado_paises" class="datagrid" style="height: 200px;width:98%;overflow:auto;" ></div></td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- PAISES -->
                            </td>
                            <td>
                                <!-- ESTADOS -->
                                <div id='div_insert_estado' class="datagrid">
                                    <table style="background-color:#E8E8E8" >
                                        <thead>
                                            <tr>
                                                <th colspan="3" align='center'>ESTADOS</th>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td style="width: 20%;">
                                                <select style="width: 100%;" id="id_pais">
                                                    <option value="0">SELECCIONE...</option>
                                                </select>
                                            </td>
                                            <td style="width: 20% "><input class="alfanumerico" placeholder="NUEVO ESTADO" style="width: 100%; resize: none ;" id="estado"></td>
                                            <td style="width: 10%" ><input id="insert_estado" type="button" value="A—ADIR"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">TABLA DE ESTADOS ACTIVOS.<div id="listado_estados" class="datagrid" style="height: 200px;width:98%;overflow:auto;" ></div></td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- ESTADOS -->
                            </td>
                            <td>
                                <!-- MUNICIPIOS -->
                                <div id='div_insert_municipio' class="datagrid">
                                    <table style="background-color:#E8E8E8" >
                                        <thead>
                                            <tr>
                                                <th colspan="3" align='center'>MUNICIPIOS</th>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td style="width: 10% "><select  placeholder="NUEVO ESTADO" style="width: 100%; resize: none ;" id="id_estado"></select></td>
                                            <td style="width: 10% "><input class="alfanumerico" placeholder="NUEVO MUNICIPIO" style="width: 100%; resize: none ;" id="municipio"></td>
                                            <td style="width: 15%" ><input id="insert_municipio" type="button" value="A—ADIR"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">TABLA DE MUNICIPIOS ACTIVOS.<div id="listado_municipios" class="datagrid" style="height: 200px;width:98%;overflow:auto;" ></div></td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- MUNICIPIOS -->
                            </td>
                        </tr>
                    </table>

                    <!--END CONTENT-->

                </div>
                <!--END PAGE WRAPPER-->
            </div>
        </div>
        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software∆
            $(document).ready(
                    function () {
                        arcade_select_paises("listado_paises");
                        arcade_select_paises_combo("id_pais");
                    }
            );
            //==================================================================
            $("#id_pais").live("change",
                    function () {
                        arcade_select_estados_pais($("#id_pais").val(), "listado_estados");
                        arcade_select_estados_pais_combo($("#id_pais").val(), "id_estado");
                    }
            );
            //==================================================================
            $("#id_estado").live("change",
                    function () {
                        arcade_select_municipios_estado($("#id_estado").val(), "listado_municipios");
                    }
            );
            //==================================================================
            $("#insert_pais").live("click",
                    function () {
                        cargar_paises_combo(),
                                $("#nombre_pais_insert").empty(),
                                insert_pais();
                    }
            );
            //==================================================================
            $("#insert_estado").live("click",
                    function () {
                        insert_estado(),
                                $("#nombre_estado_insert").empty(),
                                cargar_estados_combo();
                    }
            );
            //==================================================================
            $("#insert_municipio").live("click",
                    function () {
                        insert_municipio(),
                                $("#nombre_municipio_insert").empty(),
                                cargar_municipios_combo();
                    }
            );
            //==================================================================
            $("#delete_estado").live("click",
                    function () {
                        alert($(this).closest("tr").attr("id"));
                    }
            );
            //==================================================================
            $("#delete_pais").live("click",
                    function () {
                        alert($(this).closest("tr").attr("id"));
                    }
            );
            //==================================================================
            function insert_pais() {
                var params = {
                    accion: "insert_pais",
                    pais: $("#nombre_pais_insert").val()
                };

                $.ajax({
                    type: "POST",
                    url: "/sistemaiv/ManagePaises",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        alert(dataRes);
                    }
                });
            }
            //==================================================================
            function insert_estado()
            {
                var params = {
                    accion: "insert_estado",
                    id_pais: $("#id_pais_e").val(),
                    estado: $("#nombre_estado_insert").val()
                };

                $.ajax({
                    type: "POST",
                    url: "/sistemaiv/ManageEstados",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        alert(dataRes);
                    }
                });
            }
            //==================================================================
            function insert_municipio()
            {
                var params = {
                    accion: "insert_municipio",
                    id_estado: $("#id_estado_e").val(),
                    municipio: $("#nombre_municipio_insert").val()
                };

                $.ajax({
                    type: "POST",
                    url: "/sistemaiv/ManageMunicipios",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        alert(dataRes);
                    }
                });
            }
            //==================================================================
            // ARCADE Software∆
        </script>
    </body>
</html>