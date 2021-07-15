/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function () {
    select_etapas_cartera();
    select_options_territorios();
};
//var reporte_estiones = [];

$('#obt_avance').click(function () {
    select_reporte_llamadas();
});

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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
            console.log("Response de select_clientes_cartera: ", response);
            $("#etapa").empty();
            $("#etapa").append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {
                $("#etapa").append(`<option value="${item.ETAPA}">${item.ETAPA}</option>`);
//                console.log(item.CLASIFICACION_CTE);
            }
            $('select').formSelect();
        },
        error: function (error) {
            console.log(error);
        }
    });
}

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
            $('#territorio').empty();
            $('#territorio').append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {
                $('#territorio').append(`<option value="${item}">${item}</option>`);
            }
            $('select').formSelect();
        },
        error: function (error) {
            console.log(error);
        }
    });
}


function select_reporte_llamadas() {
    let params = {
        action: 'select_reporte_llamadas',
        territorio: JSON.stringify($("#territorio").val()).replace(/"/gm, "'").replace(/\\|\[|]/gm, ""),
        etapa: JSON.stringify($("#etapa").val()).replace(/"/gm, "'").replace(/\\|\[|]/gm, ""),
        desde: $("#desde").val(),
        hasta: $("#hasta").val()
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerReportesAzteca",
        data: params,
        dataType: "json",
        success: function (response) {
//            console.log(response);
            $('#tbody_resporte_gestiones').empty();
            for (let item of response) {
                $('#tbody_resporte_gestiones').append(`<tr>
                <td>${item.gestor}</td>
                <td>${item.PP}</td>
                <td>${item.CT}</td>
                <td>${item.CLL}</td>
                <td>${item.SG}</td>
                <td>${item.PI}</td>
                <td>${item.PT}</td>
                <td>${item.NO}</td>
                <td>${item.FI}</td>
                <td>${item.PC}</td>
                <td>${item.PA}</td>
                <td>${item.RE}</td>
                <td>${item.ND}</td>
                <td>${item.NP}</td>
                <td>${item.BZ}</td>
                <td>${item.NE}</td>
                <td>${item.CN}</td>
                <td>${item.NL}</td>
                <td>${item.NC}</td>
                <td>${item.SD}</td>
                <td>${item.SG}</td>
                <td class="center">${item.suma}</td>
                <td class="center">${item.cuentas}</td>
                <td class="center">${item.contacto} %</td>
                <td class="${ (parseFloat(item.promesado) > (8000 * parseFloat(item.dias)) ? 'green accent-2' : (parseFloat(item.promesado) > (5000 * parseFloat(item.dias)) && parseFloat(item.promesado) < (8000 * parseFloat(item.dias)) ? 'yellow lighten-4' : 'red accent-1')) }" >$${item.promesado}</td>
                <td class="hide">${item.promesado}</td>
                <td class="center">${item.pagado}</td>
                </tr>`);
            }
            sortTable(25, 'int');
            sortTable(25, 'int');
        },
        error: function (error) {
            console.log(error);
        }
    });
}

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function sortTable(n, type) {
    let table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById("avance_gestores");
//                                    console.log(table);
    switching = true;
    //Set the sorting direction to ascending:
    dir = "asc";
    /*Make a loop that will continue until no switching has been done:*/
    while (switching) {
        //start by saying: no switching is done:
        switching = false;
        rows = table.rows;
        /*Loop through all table rows (except the first, which contains table headers):*/
        for (i = 1; i < (rows.length - 1); i++) {
            //start by saying there should be no switching:
            shouldSwitch = false;
            /*Get the two elements you want to compare, one from current row and one from the next:*/
            x = rows[i].getElementsByTagName("td")[n];
            y = rows[i + 1].getElementsByTagName("td")[n];
            /*check if the two rows should switch place, based on the direction, asc or desc:*/
            if (dir === "asc") {
                if ((type === "str" && x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) || (type === "int" && parseFloat(x.innerHTML) > parseFloat(y.innerHTML))) {
                    //if so, mark as a switch and break the loop:
                    shouldSwitch = true;
                    break;
                }
            } else if (dir === "desc") {
                if ((type === "str" && x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) || (type === "int" && parseFloat(x.innerHTML) < parseFloat(y.innerHTML))) {
                    //if so, mark as a switch and break the loop:
                    shouldSwitch = true;
                    break;
                }
            }
        }
        if (shouldSwitch) {
            /*If a switch has been marked, make the switch and mark that a switch has been done:*/
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            //Each time a switch is done, increase this count by 1:
            switchcount++;
        } else {
            /*If no switching has been done AND the direction is "asc", set the direction to "desc" and run the while loop again.*/
            if (switchcount === 0 && dir === "asc") {
                dir = "desc";
                switching = true;
            }
        }
    }
}


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

