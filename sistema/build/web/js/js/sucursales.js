/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = function () {
    select_sucursales();
    select_departamentos();
    select_areas();
    select_puestos();
};
//var reporte_estiones = [];

// sucursal}
$("#tbody_sucursales").on('click', '.elimimar_sucursal', function () {
    let id_sucursal = $(this).attr("id");

    deleted_sucursales(id_sucursal);
});

$("#agregar_nueva_sucursal").click(function () {
    let nombre_sucursal = $("#nombre_sucursal").val();
    agregar_sucursal(nombre_sucursal);
});

// Departamentos

$("#tbody_departamentos").on('click', '.elimimar_departamento', function () {
    let id_departamento = $(this).attr("id");
    delete_departamento(id_departamento);
});

$("#agregar_nuevo_departamento").click(function () {
    let nombre_departamento = $("#nombre_departamento").val();
    agregar_departamento(nombre_departamento);
});

// Areas

$("#tbody_areas").on('click', '.elimimar_area', function () {
    let id_area = $(this).attr("id");
    delete_area(id_area);
});

$("#agregar_nueva_area").click(function () {
    let nombre_area = $("#nombre_area").val();
    agregar_area(nombre_area);
});


// Puestos
$("#agregar_nuevo_puesto").click(function () {
    let nombre_puesto = $("#nombre_puesto").val();
    agregar_puesto(nombre_puesto);
});


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



function select_sucursales() {
    let params = {
        action: 'select_sucursales'
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $('#tbody_sucursales').empty();
            for (let item of response) {
                $('#tbody_sucursales').append(`<tr class="center"><td>${item.id_sucursal}</td><td>${item.sucursal}</td><td><i id="${item.id_sucursal}" class="material-icons cursor_pointer elimimar_sucursal">delete</i></td></tr>`);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function deleted_sucursales(_id_sucursal) {
    let params = {
        action: 'deleted_sucursales',
        id_sucursal: _id_sucursal
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            alert(response.message);
            select_sucursales();
        },
        error: function (error) {
            $('#error').empty();
            $('#error').append(error.responseText);
            console.log(error);
        }
    });
}


function agregar_sucursal(_nombre_sucursal) {
    let params = {
        action: 'agregar_sucursal',
        nombre_sucursal: _nombre_sucursal
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            alert(response.message);
            $("#nombre_sucursal").val("");
            select_sucursales();
        },
        error: function (error) {
            $('#error').empty();
            $('#error').append(error.responseText);
            console.log(error);
        }
    });
}


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function select_departamentos() {
    let params = {
        action: 'select_departamentos'
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log('select_departamentos', response);
            $('#tbody_departamentos').empty();
            for (let item of response) {
                $('#tbody_departamentos').append(`<tr class="center"><td>${item.id_departamento}</td><td>${item.departamento}</td><td><i id="${item.id_departamento}" class="material-icons cursor_pointer elimimar_departamento">delete</i></td></tr>`);
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}


function delete_departamento(_id_departamento) {
    let params = {
        action: 'delete_departamento',
        id_departamento: _id_departamento
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            alert(response.message);
            select_departamentos();
        },
        error: function (error) {
            $('#error').empty();
            $('#error').append(error.responseText);
            console.log(error);
        }
    });
}


function agregar_departamento(_nombre_departamento) {
    let params = {
        action: 'agregar_departamento',
        nombre_departamento: _nombre_departamento
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            alert(response.message);
            $("#nombre_departamento").val("");
            select_departamentos();
        },
        error: function (error) {
            $('#error').empty();
            $('#error').append(error.responseText);
            console.log(error);
        }
    });
}



// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function select_areas() {
    let params = {
        action: 'select_areas'
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log('select_areas', response);
            $('#tbody_areas').empty();
            for (let item of response) {
                $('#tbody_areas').append(`<tr class="center"><td>${item.id_area}</td><td>${item.area}</td><td><i id="${item.id_area}" class="material-icons cursor_pointer elimimar_area">delete</i></td></tr>`);
            }
        },
        error: function (error) {
            console.log(error);
            $('#error').empty();
            $('#error').append(error.responseText);
        }
    });
}

function delete_area(_id_area) {
    let params = {
        action: 'delete_area',
        id_area: _id_area
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            alert(response.message);
            select_areas();
        },
        error: function (error) {
            $('#error').empty();
            $('#error').append(error.responseText);
            console.log(error);
        }
    });
}

function agregar_area(_nombre_area) {
    let params = {
        action: 'agregar_area',
        nombre_area: _nombre_area
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            alert(response.message);
            $("#nombre_area").val("");
            select_areas();
        },
        error: function (error) {
            $('#error').empty();
            $('#error').append(error.responseText);
            console.log(error);
        }
    });
}

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function select_puestos() {
    let params = {
        action: 'select_puestos'
    };
    console.log(params);
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log('tbody_puesto', response);
            $('#tbody_puesto').empty();
            for (let item of response) {
                $('#tbody_puesto').append(`<tr class="center"><td>${item.id_puesto}</td><td>${item.puesto}</td></tr>`);
            }
        },
        error: function (error) {
            console.log(error);
            $('#error').empty();
            $('#error').append(error.responseText);
        }
    });
}
function agregar_puesto(_nombre_puesto) {
    let params = {
        action: 'agregar_puesto',
        nombre_puesto: _nombre_puesto
    };
    $.ajax({
        type: "POST",
        url: "ControllerSucursales",
        data: params,
        dataType: "json",
        success: function (response) {
            console.log(response);
            alert(response.message);
            $("#nombre_puesto").val("");
            select_puestos();
        },
        error: function (error) {
            $('#error').empty();
            $('#error').append(error.responseText);
            console.log(error);
        }
    });
}


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

