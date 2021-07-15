<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script type="text/javascript" src="js/arcade-sucursal.js"></script>
        <!--ARCADE JS-->
 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
        <style>
            td{
                width: 46px;
                height: 23px;
                font-family: 'Helvetica';
                font-size: 11px;
                border: solid 1px #C9C9C9;
            }
 
            .piso{
                border: 1px solid #FFF;
                width: 40px;
                height: 25px;
                display: inline-block;
                background: #FFF;
                color: #FFF;
                cursor: pointer;
                box-sizing: border-box !important;
                font-size: 10px;
            }
            .piso:hover{
                border: 1px solid #FFF;
                width: 40px;
                height: 25px;
                display: inline-block;
                background: yellow;
                color: #FFF;
                color: #F8CD55 !important;
                cursor: pointer;
                opacity:.6;
                font-size: 10px;
            }
            .pared_derecha{
                border-right: 1px solid #000;
            }
            .pared_izquierda{
                border-left:1px solid #000;
            }
            .pared_abajo{
                border-bottom: 1px solid #000;
            }
            .pared_arriba{
                border-top: 1px solid #000;
 
            }
            .active{
                border-top: 1px solid black;
            }
            .mueble{
                border: 1px solid #424242;
                background: #f57c00;
            }
            .columna{
                border: 1px solid #212121;
                background: #757575;
            }
            .caja{
                border-top: 1px solid black;
                border-bottom: 1px solid black;
                border-left: 1px solid black;
                border-right: 1px solid black;
                background:#a1887f!important;
            }
 
            td.muro{
                border:none;
                background: #CCCCCC !important;
                cursor: not-allowed;
            }
 
            td.estacion{
                background: #FFFFCC;
                cursor:pointer;
                opacity: .6;
            }
            td.estacion:hover{
                background: #F8CD55;
                cursor:pointer;
                opacity: 1;
            }
 
            .add_pared{
                background: #818181 !important ;
            }
 
            .add_pared_seleccionado{
                background: #818181 !important ;
                opacity: 1 !important;
            }
 
        </style>
 
    </head>
    <body style="background-image: url('images/background-cliente.png')">
 
        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
               <div class="page-title">
                    Mapa Sucursal
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
 
        <div class="contenedor-responsive">
            <!--BEGIN CONTENT-->
            <br>
            <div class='datagrid' style="border: none;background: transparent;">
                <select id='id_sucursal'></select>
                <input id='generar_mapa' type="button" value="Ver mapa">
 
                <input id='pared_arriba' class="add_pared" type="button" value="Arriba" style="border-radius: 4px 0px 0px 4px;"><input id='pared_abajo' class="add_pared" type="button" value="Abajo" style="border-radius: 0px;"><input id='pared_izquierda' class="add_pared" type="button" value="Izquierda" style="border-radius: 0px;"><input id='pared_derecha' class="add_pared"  type="button" value="Derecha"  style="border-radius: 0px 4px 4px 0px;">
 
                <input id='mueble' class="add_pared" type="button" value="Mueble" style="border-radius: 4px 0px 0px 4px;"><input id='caja' class="add_pared" type="button" value="Caja" style="border-radius: 0px 0px 0px 0px;"><input id='columna' class="add_pared" type="button" value="Columna" style="border-radius: 0px 4px 4px 0px;">
 
                <input id="clase_accion" type="hidden" value="">
                <input id="mostrar_ocultar" type="button" value="Config" style=" float: right;">
            </div>
            <br>
            <div id="div_mapa" class="datagrid" style="border: none;background: transparent; width: 977px; height: 400px; overflow: auto; float:left; margin-left: 3% "></div>
            <div id=""  class="datagrid" style="border:1px solid black;background:#fafafa ; width: 226px; float:right; height:400px; margin-right: 3% ">
                <div id="imagen_contenedor" style="width: 100%; height: 100px; background-color: #FFF;border:1px solid #000;">
 
                </div>
                <div id="detalles_contenedor" style="width: 100%; height: 100px; background-color: #FFF;border:1px solid #000;">
 
                </div>
                <div id="accesorios_Computadora" style="width: 100%; height: 100px; background-color: #FFF;border:1px solid #000;">
 
                </div>
                <div id="gestor_contenedor" style="width: 100%; height: 100px; background-color: #FFF;border:1px solid #000;">
 
                </div>
            </div>
            <br>
            <br>
            <!--END CONTENT-->
 
            <!--END PAGE WRAPPER-->
        </div>
 
        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_sucursal_combo("id_sucursal", false);
                $(".add_pared").hide();
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
            $("#mostrar_ocultar").click(function () {
                if ($(".add_pared").is(":hidden")) {
                    $(".add_pared").show();
                } else {
                    $(".add_pared").hide();
                };
            });
           //==================================================================
            $("#id_sucursal").change(function () {
                generar_mapa($("#id_sucursal").val(), "div_mapa");
            });
            //==================================================================
            $(".add_pared").click(function () {
                $("#clase_accion").val($(this).attr("id"));
                $(".add_pared").removeClass("add_pared_seleccionado");
                $(this).addClass("add_pared_seleccionado");
            });
            //==================================================================
            $(".piso").live("click", function () {
 
                if ($("#clase_accion").val() == "pared_arriba") {
                    $(this).find("div.child").css("height", "34px");
                }
                if ($(this).hasClass($("#clase_accion").val())) {
                    $(this).removeClass($("#clase_accion").val());
                } else {
                    $(this).addClass($("#clase_accion").val());
                }
 
                update_clases($(this).attr("id"), $(this).attr("class"));
 
            });
            //==================================================================
            $("#generar_mapa").click(function () {
                generar_mapa($("#id_sucursal").val(), "div_mapa");
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
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>