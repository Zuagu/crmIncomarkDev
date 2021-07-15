
window.onload = function () {
    select_options_territorios();
    select_etapas_cartera();
    reporte_tickets_pagos();
};


$("#getTicketsPagos").click( function () {
    reporte_tickets_pagos();
});


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
//            console.log(response);
            $('#territorio_pagos').empty();
            $('#territorio_pagos').append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {
                $('#territorio_pagos').append(`<option value="${item}">${item}</option>`);
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
//            console.log("Response de etapas: ", response);
            $("#etapa_pagos").empty();
            $("#etapa_pagos").append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {

                $("#etapa_pagos").append(`<option value="${item.ETAPA}">${item.ETAPA}</option>`);
            }
            $('select').formSelect();
        },
        error: function (error) {
            console.log(error);
        }
    });
}


function reporte_tickets_pagos() {
    let params = {
        action: 'reporte_tickets_pagos',
        desde: $("#desde").val() || '0',
        hasta: $("#hasta").val() || '0',
        territorio: JSON.stringify($("#territorio_pagos").val() || '0').replace(/"/gm, "'").replace(/\\|\[|]/gm, ""),
        etapa: JSON.stringify($("#etapa_pagos").val() || '0').replace(/"/gm, "'").replace(/\\|\[|]/gm, "")
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerReportesAzteca",
        data: params,
        dataType: "json",
        success: function (response) {
//            console.log("Respons tikes pago: ", response);
            $("#tbody_tickets").empty();
            let suma = 0, monto = 0.00;
            for (let item of response) {
                suma += 1;
                monto += parseFloat(item.MONTO_TICKET);
                $("#tbody_tickets").append(`<tr>
                <td>${item.CLIENTE_UNICO}</td>
                <td>${item.ID_TICKET}</td>
                <td>${item.MONTO_TICKET}</td>
                <td>${item.GESTOR}</td>
                <td>${item.TIPO_PAGO}</td>
                <td>${item.FECHA_TICKET}</td>
                <td>${item.ETAPA}</td>
                <td>${item.TERRITORIO}</td>
                <td>${item.GERENTE}</td>
                </tr>`);
            }
            
            $("#suma_cuentas, #suma_monto").empty();
            $("#suma_cuentas").append(suma);
            $("#suma_monto").append(monto);
            
            $("#cargando_datos").addClass("hide");
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
