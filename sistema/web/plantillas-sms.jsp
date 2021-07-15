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
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script type="text/javascript" src="js/arcade-categoriasms.js"></script>
        <script type="text/javascript" src="js/arcade-sms.js"></script>


    </head>
    <body style="background-image: url('images/background-cliente.png')">

        <!--BEGIN TITLE & BREADCRUMB PAGE-->
        <div class="page-title-breadcrumb option-demo">
            <div class="page-header pull-right">
                <div class="page-title">
                    Plantillas SMS
                </div>
            </div>
            <ol class="breadcrumb page-breadcrumb pull-left">
                <li>Manuales de usuario de este modulo:</li>
                <li id="pdf_horas-clase-maestro"><img class="help" src="images/help_pdf.png" style="cursor: pointer;"></li>
            </ol>
            <div class="clearfix"></div>
        </div>
        <!--END TITLE & BREADCRUMB PAGE-->

        <div class="contenedor-responsive">
            <!--BEGIN CONTENT-->
            <br>

            <div class="datagrid" style="border: none;background: transparent;">

                <div id="div_categorias_sms" style="width: 29%;float: left;" class="datagrid sombra"></div>

                <div style="width: 70%;max-width: 564px;float: left;background-image: url('images/iphone.png');height: 268px;background-repeat: no-repeat;background-color: transparent;border: none;margin-left: 4%;" class="datagrid">

                    <div style="height: 222px;width: 398px;border: none;position: relative;left: 85px;top: 22px;resize: none;padding: 10px;background-color: #E7E7E7;">
                        <h5><b>De +528119323800:</b> <i style="float: right;">Vista previa y pruebas</i><b style="float: right;">SMS</b>
                            <br>Mensaje:<input id="send_num" style="float: right;border: 1px solid green;width: 90px;padding: 1px 3px;" value="" ><span style="float: right;">Para: </span>
                        </h5>
                        <input id="id_mensaje_edit" value="0" type="hidden">
                        <textarea id="mensaje" class="sms" style="resize: none;width: 100%;height: 110px;" maxlength="160"></textarea>
                        <div style="text-align: right;">
                            <span id="contador" style="font-weight: bold;">0/160</span>
                        </div>
                        <div>
                            <input id="delete_sms" type="button" value="ELIMINAR" style="background: #FF3333;width: 22%;display: none;">
                            <input id="update_sms" type="button" value="GUARDAR CAMBIOS" style="float: right;background: #0c7b00;width: 39%;display: none;">
                        </div>
                    </div>

                    <input id="enviar" type="button" style="width: 50px;
                           float: right;
                           position: relative;
                           right: 16px;
                           top: -114px;
                           height: 50px;
                           background: transparent;
                           cursor: pointer;" value="O">
                </div>

                <iframe name="frame_sms" src="http://en.wikipedia.org/" style="width: 45%;margin: 1% 4%;height: 180px;border: none;display: none;"></iframe>

            </div>

            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            $(document).ready(function () {
                select_categoria_sms_tabla("div_categorias_sms");
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
            $("#enviar").click(function () {
                frames['frame_sms'].location.href = 'http://192.168.0.8/goip/en/dosend.php?USERNAME=root&PASSWORD=sicsa&smsprovider=1&smsnum=' + $("#send_num").val() + '&method=2&Memo=' + $("#mensaje").val();
            });
            //==================================================================
            $("#mensaje").keyup(function () {
                var _largo = $("#mensaje").val().length;
                $("#contador").html(_largo + "/160");
                $("#update_sms").show();
            });
            //==================================================================
            $("#delete_sms").click(function () {

                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    delete_sms($('#usuario_sistema', parent.document).val(), $("#id_mensaje_edit").val(), "div_categorias_sms");
                }

            });
            //==================================================================
            $("#update_sms").click(function () {

                if ($("#id_mensaje_edit").val() > 0) {
                    update_sms($('#usuario_sistema', parent.document).val(), $("#id_mensaje_edit").val(), $("#mensaje").val());
                }

            });
            //==================================================================
            $(".select_sms_categoria_sms").live("click", function () {

                $("#update_sms").hide();
                $("#delete_sms").show();

                $("#id_mensaje_edit").val($(this).closest("tr").attr("id"));

                select_sms(
                        $(this).closest("tr").attr("id"),
                        "mensaje",
                        "div_categorias_sms"
                        );

            });
            //==================================================================
            $(".autorizar_sms").live("click", function () {

                var confirma = confirm("PRESIONE ENTER PARA CONTINUAR...");
                if (confirma) {
                    autorizar_sms(
                            $('#usuario_sistema', parent.document).val(),
                            $(this).closest("tr").attr("id"),
                            "div_categorias_sms"
                            );
                }
            });
            //==================================================================
            $("#insert_categoria_sms").live("click", function () {
                insert_categoria_sms(
                        $('#usuario_sistema', parent.document).val(),
                        $("#categoria_sms_insert").val(),
                        "div_categorias_sms"
                        );
            });
            //==================================================================
            // ARCADE Software®
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>