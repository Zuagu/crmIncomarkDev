/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function () {
    select_options_territorios();
    select_etapas_cartera();
    let tipo_jsp = $("#tipo").val();
    if (tipo_jsp === "vacantes_visitador_rh") {
        azteca_select_requerimetos_campo_RH();
//        $("#cargando_datos").addClass("hide");
    } else {
        azteca_select_requerimetos_campo();
    }
};

$("#getTableRequerimentos").click(function () {
    azteca_select_requerimetos_campo();
});
$("#getTableRequerimentosRH").click(function () {
    azteca_select_requerimetos_campo_RH();
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
            $('#territorio_visitas').empty();
            $('#territorio_visitas').append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {
                $('#territorio_visitas').append(`<option value="${item}">${item}</option>`);
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
            $("#etapa_visitas").empty();
            $("#etapa_visitas").append(`<option value="0" selected>TODOS</option>`);
            for (let item of response) {

                $("#etapa_visitas").append(`<option value="${item.ETAPA}">${item.ETAPA}</option>`);
            }
            $('select').formSelect();
        },
        error: function (error) {
            console.log(error);
        }
    });
}


function azteca_select_requerimetos_campo() {
    $("#tbody_tabla_promesado_diario_org").empty();
    $("#cargando_datos").removeClass('hide');
    let params = {
        action: 'azteca_select_requerimetos_campo',
        territorio: JSON.stringify($("#territorio_visitas").val() || '0').replace(/"/gm, "'").replace(/\\|\[|]/gm, ""),
        etapa: JSON.stringify($("#etapa_visitas").val() || '0').replace(/"/gm, "'").replace(/\\|\[|]/gm, "")
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerVacantes",
        data: params,
        dataType: "json",
        success: function (response) {
            $("#tbody_tabla_promesado_diario_org").empty();
            let tit_sum_zona = {};
            let orden = [];
            for (let row of response) {

                if (orden.includes(row.TERRITORIO)) {
                } else {
                    orden.push(row.TERRITORIO);
                }

                if (tit_sum_zona[row.TERRITORIO]) {
//                    console.log('si esta');
                    tit_sum_zona[row.TERRITORIO].valor += parseFloat(row.SALDO_TOTAL.replace(',', ''));
                    tit_sum_zona[row.TERRITORIO].cuentas += parseInt(row.CANTIDAD);
                } else {
//                    console.log('no esta');
                    tit_sum_zona[row.TERRITORIO] = {
                        valor: parseFloat(row.SALDO_TOTAL.replace(',', '')),
                        cuentas: parseInt(row.CANTIDAD)
                    };
                }
            }
//            console.log('jsoninf', tit_sum_zona);
//            console.log('orden', orden);
            let col1 = '0';

            for (let item of orden) {
//                console.log(item);
                $("#tbody_tabla_promesado_diario_org").append(`<tr class='grey'><th>${item}</th><th></th><th></th><th>${tit_sum_zona[item].cuentas} Cuentas</th><th></th><th>$ ${tit_sum_zona[item].valor.toFixed(2)} MNX</th><th></th> <tr>`);
                for (let row of response) {
                    if (row.TERRITORIO === item) {

                        $("#tbody_tabla_promesado_diario_org").append(`<tr class='blue'>
                                <th>${row.LOCALIDAD_V}</th><th></th><th></th><th>${row.CANTIDAD} Cuentas</th><th></th><th>$ ${ parseFloat(row.SALDO_TOTAL).toFixed(2)} MNX</th><th></th> </tr>
                                <tr> <td>Cartero: </td><td>0/${row.CARTEROS}</td><td>0%</td><td>${row.RESULTADO_NA} NA</td><td>${((parseFloat(row.RESULTADO_NA) / parseFloat(row.CANTIDAD)) * 100).toFixed(2)}%</td><td>$ ${parseFloat(row.val_RESULTADO_NA).toFixed(2)}</td><td>${ ((parseFloat(row.val_RESULTADO_NA) / parseFloat(row.SALDO_TOTAL) * 100)).toFixed(2) }%</td> </tr>
                                <tr> <td>Notificador: </td><td>0/${row.NOTIFICADOR}</td><td>0%</td><td>${row.RESULTADO_AP} AP</td><td>${((parseFloat(row.RESULTADO_AP) / parseFloat(row.CANTIDAD)) * 100).toFixed(2)}%</td><td>$ ${parseFloat(row.val_RESULTADO_AP).toFixed(2)}</td><td>${ ((parseFloat(row.val_RESULTADO_AP) / parseFloat(row.SALDO_TOTAL) * 100)).toFixed(2) }%</td> </tr>
                                <tr> <td>Cerrador: </td><td>0/${row.CERRADOR}</td><td>0%</td><td>${row.RESULTADO_CCERRADOR} Contacto</td><td>${((parseFloat(row.RESULTADO_CCERRADOR) / parseFloat(row.CANTIDAD)) * 100).toFixed(2)}%</td><td>$ ${parseFloat(row.val_RESULTADO_CCERRADOR).toFixed(2)}</td><td>${ ((parseFloat(row.val_RESULTADO_CCERRADOR) / parseFloat(row.SALDO_TOTAL) * 100)).toFixed(2) }%</td> </tr>
                            `);
                    }

                }
            }
//            console.log(response);
            $("#cargando_datos").addClass('hide');

        },
        error: function (error) {
            console.log(error);
            $("#cargando_datos").addClass('hide');
        }
    });
}


function azteca_select_requerimetos_campo_RH() {
    $("#tbody_tabla_promesado_diario_org").empty();
    $("#cargando_datos").removeClass('hide');
    let params = {
        action: 'azteca_select_requerimetos_campo_rh',
        territorio: JSON.stringify($("#territorio_visitas").val() || '0').replace(/"/gm, "'").replace(/\\|\[|]/gm, ""),
        etapa: JSON.stringify($("#etapa_visitas").val() || '0').replace(/"/gm, "'").replace(/\\|\[|]/gm, "")
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerVacantes",
        data: params,
        dataType: "json",
        success: function (response) {
//            console.log(response);
            let vacantes_requeridos = response[0];
            let vacantes_actuales = response[1];
            
            let suma_final = {
                CARTEROS_REC: 0,
                NOTIFICADOR_REC: 0,
                CERRADOR_REC: 0,
                SUMA_REC: 0,
                CARTEROS_OCU: 0,
                NOTIFICADOR_OCU: 0,
                CERRADOR_OCU: 0,
                SUMA_OCU: 0,
                CARTEROS_DIF: 0,
                NOTIFICADOR_DIF: 0,
                CERRADOR_DIF: 0,
                SUMA_DIF: 0
            };

            $("#tbody_requerido").empty();
            $("#tbody_actual").empty();
            $("#tbody_faltante").empty();
            $("#tbody_faltante").empty();
            let estados = {};
            let identificador = '0';
            for (let row of vacantes_requeridos) {
                
                suma_final.CARTEROS_REC += parseInt(row.CARTEROS);
                suma_final.NOTIFICADOR_REC += parseInt(row.NOTIFICADOR);
                suma_final.CERRADOR_REC += parseInt(row.CERRADOR);
                suma_final.SUMA_REC += parseInt(row.SUMA);
                
                if (estados[row.ESTADO_V]) {
                    estados[row.ESTADO_V] += 1;
                } else {
                    estados[row.ESTADO_V] = 1;
                }
            }
//            console.log(suma_final);

//            console.log('ESTADOS: ', estados);
            for (let row of vacantes_requeridos) {

                if (identificador === '0' || row.ESTADO_V != identificador) {
                    identificador = row.ESTADO_V;
//                    console.log(estados[row.ESTADO_V], identificador);
                    $("#tbody_requerido").append(`<tr><td rowspan="${estados[row.ESTADO_V]}">${row.ESTADO_V}</td><td>${row.LOCALIDAD_V}</td><td class="${(row.CARTEROS != '0' ? 'lime lighten-5':'' )}">${row.CARTEROS}</td><td class="${(row.NOTIFICADOR != '0' ? 'lime lighten-5':'' )}">${row.NOTIFICADOR}</td><td class="${(row.CERRADOR != '0' ? 'lime lighten-5':'' )}">${row.CERRADOR}</td><td class="${(row.SUMA != '0' ? 'lime lighten-5':'' )}">${row.SUMA}</td></tr>`);
//                    $("#tbody_actual").append(`<tr><td>${row.LOCALIDAD_V}</td><td id="cart_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="not_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="cerr_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="total_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td></tr>`);
                    $("#tbody_actual").append(`<tr><td id="cart_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="not_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="cerr_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="total_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td></tr>`);
                } else {
                    $("#tbody_requerido").append(`<tr><td>${row.LOCALIDAD_V}</td><td class="${(row.CARTEROS != '0' ? 'lime lighten-5':'' )}">${row.CARTEROS}</td><td class="${(row.NOTIFICADOR != '0' ? 'lime lighten-5':'' )}">${row.NOTIFICADOR}</td><td class="${(row.CERRADOR != '0' ? 'lime lighten-5':'' )}">${row.CERRADOR}</td><td class="${(row.SUMA != '0' ? 'lime lighten-5':'' )}">${row.SUMA}</td></tr>`);
//                    $("#tbody_actual").append(`<tr><td>${row.LOCALIDAD_V}</td><td id="cart_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="not_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="cerr_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="total_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td></tr>`);
                    $("#tbody_actual").append(`<tr><td id="cart_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="not_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="cerr_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td><td id="total_${row.LOCALIDAD_V.replace(/ /gm, "_")}">0</td></tr>`);
                }
            }
            // imprimimos sumatorias
            $("#tbody_requerido").append(`<tr><td></td><td><b>SUMA</b></td><td><b>${suma_final.CARTEROS_REC}</b></td><td><b>${suma_final.NOTIFICADOR_REC}</b></td><td><b>${suma_final.CERRADOR_REC}</b></td><td><b>${suma_final.SUMA_REC}</b></td></tr>`);

            for (let row of vacantes_actuales) {
//                console.log(row);
                $("#cart_" + row.localidad.replace(/ /gm, "_")).empty();
                $("#cart_" + row.localidad.replace(/ /gm, "_")).append(row.Cartero);
                (row.Cartero != '0' ? $("#cart_" + row.localidad.replace(/ /gm, "_")).addClass('green lighten-5') : $("#cart_" + row.localidad.replace(/ /gm, "_")).addClass('') );
                $("#not_" + row.localidad.replace(/ /gm, "_")).empty();
                $("#not_" + row.localidad.replace(/ /gm, "_")).append(row.Notificador);
                (row.Notificador != '0' ? $("#not_" + row.localidad.replace(/ /gm, "_")).addClass('green lighten-5') : $("#not_" + row.localidad.replace(/ /gm, "_")).addClass('') );
                $("#cerr_" + row.localidad.replace(/ /gm, "_")).empty();
                $("#cerr_" + row.localidad.replace(/ /gm, "_")).append(row.Cerrador);
                (row.Cerrador != '0' ? $("#cerr_" + row.localidad.replace(/ /gm, "_")).addClass('green lighten-5') : $("#cerr_" + row.localidad.replace(/ /gm, "_")).addClass('') );
                $("#total_" + row.localidad.replace(/ /gm, "_")).empty();
                $("#total_" + row.localidad.replace(/ /gm, "_")).append(row.suma);
                (row.suma != '0' ? $("#total_" + row.localidad.replace(/ /gm, "_")).addClass('green lighten-5') : $("#total_" + row.localidad.replace(/ /gm, "_")).addClass('') );
                
                
                suma_final.CARTEROS_OCU += parseInt(row.Cartero);
                suma_final.NOTIFICADOR_OCU += parseInt(row.Notificador);
                suma_final.CERRADOR_OCU += parseInt(row.Cerrador);
                suma_final.SUMA_OCU += parseInt(row.suma);

            }
            // imprimimos sumatorias
            $("#tbody_actual").append(`<tr><td><b>${suma_final.CARTEROS_OCU}</b></td><td><b>${suma_final.NOTIFICADOR_OCU}</b></td><td><b>${suma_final.CERRADOR_OCU}</b></td><td><b>${suma_final.SUMA_OCU}</b></td></tr>`);

            // idenitificar cuales no se pintaron
            $("#tbody_no_pin").empty();
            for (let row_req of vacantes_requeridos) {
                for (let row_act of vacantes_actuales) {
                    if (row_act.localidad == row_req.LOCALIDAD_V) {
                        row_act["pintado"] = "si";
                    }
                }
//                row.LOCALIDAD_V
            }
            for (let row_act of vacantes_actuales) {
                if (row_act.pintado) {
                } else {
                    $("#tbody_no_pin").append(`<tr>
                            <td>${row_act.localidad}</td>
                            <td>${row_act.Cartero}</td>
                            <td>${row_act.Notificador}</td>
                            <td>${row_act.Cerrador}</td>
                            <td>${row_act.suma}</td>
                        </tr>`);
                }
            }

//            console.log(vacantes_actuales);
            identificador = '0';
            for (let row of vacantes_requeridos) {
                let val_act_cart = parseInt( $("#cart_" + row.LOCALIDAD_V.replace(/ |\?/gm, "_") ).text() || '0' );
                let val_act_not = parseInt( $("#not_" + row.LOCALIDAD_V.replace(/ |\?/gm, "_") ).text() || '0' );
                let val_act_cerr = parseInt( $("#cerr_" + row.LOCALIDAD_V.replace(/ |\?/gm, "_") ).text() || '0' );
                let val_act_total = parseInt( $("#total_" + row.LOCALIDAD_V.replace(/ |\?/gm, "_") ).text() || '0' );
//                console.log(val_act_not);
                if (identificador === '0' || row.ESTADO_V != identificador) {
                    identificador = row.ESTADO_V;
//                    console.log(estados[row.ESTADO_V], identificador);
//                    $("#tbody_faltante").append(`<tr><td>${row.LOCALIDAD_V}</td><td>${parseInt(row.CARTEROS) - val_act_cart}</td><td>${parseInt(row.NOTIFICADOR) - val_act_not}</td><td>${parseInt(row.CERRADOR) - val_act_cerr}</td><td>${parseInt(row.SUMA) - val_act_total}</td></tr>`);
                    $("#tbody_faltante").append(`<tr>
                            <td class="${( parseInt(row.CARTEROS) - val_act_cart != 0 ? 'red lighten-5':'')}" >${parseInt(row.CARTEROS) - val_act_cart}</td>
                            <td class="${( parseInt(row.NOTIFICADOR) - val_act_not != 0 ? 'red lighten-5':'')}" >${parseInt(row.NOTIFICADOR) - val_act_not}</td>
                            <td class="${( parseInt(row.CERRADOR) - val_act_cerr != 0 ? 'red lighten-5':'')}" >${parseInt(row.CERRADOR) - val_act_cerr}</td>
                            <td class="${( parseInt(row.SUMA) - val_act_total != 0 ? 'red lighten-5':'')}" >${parseInt(row.SUMA) - val_act_total}</td></tr>`
                            );
                } else {
//                    $("#tbody_faltante").append(`<tr><td>${row.LOCALIDAD_V}</td><td>${parseInt(row.CARTEROS) - val_act_cart}</td><td>${parseInt(row.NOTIFICADOR) - val_act_not}</td><td>${parseInt(row.CERRADOR) - val_act_cerr}</td><td>${parseInt(row.SUMA) - val_act_total}</td></tr>`);
                    $("#tbody_faltante").append(`<tr>
                            <td class="${( parseInt(row.CARTEROS) - val_act_cart != 0 ? 'red lighten-5':'')}">${parseInt(row.CARTEROS) - val_act_cart}</td>
                            <td class="${( parseInt(row.NOTIFICADOR) - val_act_not != 0 ? 'red lighten-5':'')}">${parseInt(row.NOTIFICADOR) - val_act_not}</td>
                            <td class="${( parseInt(row.CERRADOR) - val_act_cerr != 0 ? 'red lighten-5':'')}">${parseInt(row.CERRADOR) - val_act_cerr}</td>
                            <td class="${( parseInt(row.SUMA) - val_act_total != 0 ? 'red lighten-5':'')}">${parseInt(row.SUMA) - val_act_total}</td></tr>`
                            );
                }
            }
            // imprimimos sumatorias
            $("#tbody_faltante").append(`<tr><td><b>${ suma_final.CARTEROS_REC - suma_final.CARTEROS_OCU}</b></td><td><b>${suma_final.NOTIFICADOR_REC - suma_final.NOTIFICADOR_OCU}</b></td><td><b>${suma_final.CERRADOR_REC - suma_final.CERRADOR_OCU}</b></td><td><b>${suma_final.SUMA_REC - suma_final.SUMA_OCU}</b></td></tr>`);

            
            $("#cargando_datos").addClass('hide');

        },
        error: function (error) {
            console.log(error);
            $("#cargando_datos").addClass('hide');
        }
    });
}

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

