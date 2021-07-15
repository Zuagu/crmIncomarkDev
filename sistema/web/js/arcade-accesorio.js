//==============================================================================
function select_accesorio_tabla(_id_caja) {
    $("#" + _id_caja).append("<div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>");
    var params = {
        accion: "select_accesorio_tabla"
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAccesorio",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append(dataRes);
        }
    });
}
;
//==============================================================================
function select_accesorio_combo(_id_caja) {
    var params = {
        accion: "select_accesorio_combo"
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAccesorio",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append('<option value="0">SELECCIONE...</option>');
            $("#" + _id_caja).append(dataRes);
        }
    });
}
;
//==============================================================================
function insert_accesorio(_id_accesorio, _accesorio, _id_caja) {
    var params = {
        accion: "insert_accesorio",
        id_accesorio: _id_accesorio,
        accesorio: _accesorio
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAccesorio",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
            select_accesorio_tabla(_id_caja);
            select_accesorio_combo(_id_caja);
        }
    });
}
;
//==============================================================================
function update_accesorio(_id_accesorio, _accesorio) {
    var params = {
        accion: "update_accesorio",
        id_accesorio: _id_accesorio,
        accesorio: _accesorio
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAccesorio",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
        }
    });
}
;
//==============================================================================
function delete_accesorio(_id_accesorio, _id_caja) {
    var params = {
        accion: "delete_accesorio",
        id_accesorio: _id_accesorio
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAccesorio",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
            select_accesorio_tabla(_id_caja);
            select_accesorio_combo(_id_caja);
        }
    });
}
;