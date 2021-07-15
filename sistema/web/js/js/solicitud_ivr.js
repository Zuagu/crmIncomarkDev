/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function () {
    select_solicitud_ivr();
    select_options_territorios();
    select_etapas_cartera();
};
//var reporte_estiones = [];


$("#getTableivrs").click(function () {
    select_solicitud_ivr();
});

$("#descargar_tabla_ivrs").click(function () {
    idenitificar_ivr_descargados();
});


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function select_options_territorios() {
    let params = {
        action: 'select_options_territorios'
    };
    $.ajax({
        type: "POST",
        url: "ControllerReportesAzteca",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $('#territorio_ivr').empty();
            $('#territorio_ivr').append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {
                $('#territorio_ivr').append(`<option value="${item}">${item}</option>`);
            }
            $('select').formSelect();
        },
        error: function (error) {
            console.log(error);
        }
    });
}


function select_etapas_cartera() {
    let params = {
        action: 'select_clientes_cartera'
    };
    $.ajax({
        type: "POST",
        url: "ControllerReportesAzteca",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log("Response de etapas: ", response);
            $("#etapa_ivr").empty();
            $("#etapa_ivr").append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {

                $("#etapa_ivr").append(`<option value="${item.ETAPA}">${item.ETAPA}</option>`);
            }
            $('select').formSelect();
        },
        error: function (error) {
            console.log(error);
        }
    });
}


function idenitificar_ivr_descargados() {
    
    let params = {
        action: 'idenitificar_ivr_descargados',
        etapa: $("#etapa_ivr").val() || '0',
        territorio: $("#territorio_ivr").val() || '0',
        desde: $("#desde_ivr").val() || '0',
        hasta: $("#hasta_ivr").val() || '0'
    };
    
    $.ajax({
        type: "POST",
        url: "ControllerDataCuentaAzteca",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log("Response de idenitificar_ivr_descargados: ", response);
            select_solicitud_ivr();
        },
        error: function (error) {
            console.log(error);
        }
    });
}



function select_solicitud_ivr() {
    let params = {
        action: 'select_solicitud_ivr',
        etapa: $("#etapa_ivr").val() || '0',
        territorio: $("#territorio_ivr").val() || '0',
        desde: $("#desde_ivr").val() || '0',
        hasta: $("#hasta_ivr").val() || '0'
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerDataCuentaAzteca",
        data: params,
        dataType: "json",
        success: function (response) {
//            console.log(response);
            $("#tbody_solicitud_ivr").empty();
            for (let row of response) {
                $("#tbody_solicitud_ivr").append(`<tr class="${ (row.f_enviado === "1" ? "blue lighten-3" : "" ) }">
                <td>${row.id_iregistro}</td>
                <td>${row.fecha_insert}</td>
                <td>${row.cliente_unico}</td>
                <td>${row.nombre_cuenta}</td>
                <td>${row.num_ivr}</td>
                <td>${row.ETAPA}</td>
                <td>${row.TERRITORIO}</td>
                </tr>`);
            }
            $("#cargando_datos").addClass('hide');
        },
        error: function (error) {
            console.log(error);
        }
    });
}


var tableToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
            base64 = function (s) {
                return window.btoa(unescape(encodeURIComponent(s)))
            },
            format = function (s, c) {
                return s.replace(/{(\w+)}/g, function (m, p) {
                    return c[p];
                })
            }
    return function (table, name) {
        if (!table.nodeType)
            table = document.getElementById(table);
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
    }
})()