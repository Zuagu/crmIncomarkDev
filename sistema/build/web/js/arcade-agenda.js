//==============================================================================
function select_agenda_tabla(_fecha, _id_caja) {
    $("#" + _id_caja).append("<div style='text-align:center;'><br><img src='images/cargando-fb.gif'><br></div>");
    var params = {
        accion: "select_agenda_tabla",
        fecha: _fecha
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAgenda",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            $("#" + _id_caja).empty();
            $("#" + _id_caja).append(dataRes);
 
            var _cant = 0;
            var _cant2 = 0;
 
            $('#tabla_agendas tbody tr.pasada').each(function () {
                _cant = _cant + 1;
            });
            $('#tabla_agendas tbody tr').each(function () {
                _cant2 = _cant2 + 1;
            });
 
            $("#pasadas").val(_cant);
            $("#total_agendas").val(_cant2);
        }
    });
}
;
//==============================================================================
function select_agenda_combo(_id_caja) {
    var params = {
        accion: "select_agenda_combo"
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAgenda",
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
function insert_agenda(_id_agenda, _agenda, _id_caja) {
    var params = {
        accion: "insert_agenda",
        id_agenda: _id_agenda,
        agenda: _agenda
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAgenda",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
            select_agenda_tabla(_id_caja);
            select_agenda_combo(_id_caja);
        }
    });
}
;
//==============================================================================
function update_agenda(_id_agenda, _agenda) {
    var params = {
        accion: "update_agenda",
        id_agenda: _id_agenda,
        agenda: _agenda
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAgenda",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
        }
    });
}
;
//==============================================================================
function delete_agenda(_id_agenda, _id_caja) {
    var params = {
        accion: "delete_agenda",
        id_agenda: _id_agenda
    };
    $.ajax({
        type: "POST",
        url: "/sistema/ManageAgenda",
        data: params,
        dataType: "html",
        success: function (dataRes) {
            alert(dataRes);
            select_agenda_tabla(_id_caja);
            select_agenda_combo(_id_caja);
        }
    });
}
;