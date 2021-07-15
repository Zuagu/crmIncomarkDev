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
        <!--AIzaSyDEeVoWhtj0m-yQaJ2RmpFyaEnUBBvrQNo API WEGO-->
        <!--        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEeVoWhtj0m-yQaJ2RmpFyaEnUBBvrQNo&callback=initMap"></script>-->
        <style>
            #right-panel {
                font-family: 'Roboto','sans-serif';
                line-height: 30px;
                padding-right: 3%;
            }

            #right-panel select, #right-panel input {
                font-size: 11px;
            }

            #right-panel select {
                width: 100%;
            }

            #right-panel i {
                font-size: 12px;
            }
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            #map {
                height: 100%;
                width: 50%;
            }
            #right-panel {
                float: right;
                width: 48%;
                padding-left: 2%;
            }
            #output {
                font-size: 11px;
            }
            #calcular, #insert_envio{
                width: 50%;
                border-radius: 10px;
                height: 40px;
                border: none;
                background: #20c020;
                color: #FFFFFF;
                font-family: verdana;
                min-width: 160px;
            }
        </style>



    </head>
    <div id="right-panel">

        <br>
        <div id="inputs" class="datagrid sombra">
            <table style="width: 100%;">
                <thead>
                    <tr>
                        <th colspan="2" style="text-align: center;">DATOS DEL ENVIO</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 30%;">RECOLECCION:</td>
                        <td><input id="origin" type="text" value="SAN MIGUEL DE ALLENDE" placeholder="Alguna ciudad en San Miguel" style="text-transform: uppercase;"></td>
                    </tr>
                    <tr>
                        <td>DESTINO:</td>
                        <td><input id="destination" type="text" value="SAN MIGUEL DE ALLENDE" placeholder="Alguna ciudad en San Miguel" style="text-transform: uppercase;"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: center;">
                            <input id="calcular" style="font-size: 14px;" type="button" value="CALCULAR ENVIO">
                        </td>
                    </tr>
                    <tr>
                        <td>DISTANCIA:</td>
                        <td><input id="distancia" type="text" value="" placeholder="DISTANCIA DEL RECORRIDO"></td>
                    </tr>
                    <tr>
                        <td>TIEMPO ESTIMADO:</td>
                        <td><input id="tiempo" type="text" value="" placeholder="TIEMPO ESTIMADO"></td>
                    </tr>
                    <tr>
                        <td>PRECIO:</td>
                        <td><input id="precio" type="text" value="" placeholder="PRECIO DEL ENVIO"></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <br>
        <div class="datagrid sombra">
            <table style="width: 100%;">
                <tbody>
                    <tr>
                        <td style="width: 30%;">ORDENANTE:</td>
                        <td><input id="ordenante" type="text" value="" placeholder="NOMBRE DE LA PERSONA QUE LLAMA" style="text-transform: uppercase;"></td>
                    </tr>
                    <tr>
                        <td style="width: 30%;">RECIBE:</td>
                        <td><input id="recibe" type="text" value="" placeholder="NOMBRE DE LA PERSONA QUE RECIBE" style="text-transform: uppercase;"></td>
                    </tr>
                    <tr>
                        <td>FECHA RECOLECCION:</td>
                        <td><input id="fecha_recoleccion" type="text" readonly class="datepicker" value="" style="text-transform: uppercase;"></td>
                    </tr>
                    <tr>
                        <td>HORA RECOLECCION:</td>
                        <td><input id="hora_recoleccion" type="time" value="" style="text-transform: uppercase;"></td>
                    </tr>
                    <tr>
                        <td>HORA ENTREGA</td>
                        <td><input id="hora_entrega" type="color" value="" style="text-transform: uppercase;"></td>
                    </tr>
                    <tr>
                        <td>REFERENCIA:</td>
                        <td>
                            <textarea id="referencia" type="text" value="" placeholder="DETALLES EXTRAS" style="width: 96%;resize: none;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: center;">
                            <input id="insert_envio" style="font-size: 14px;" type="button" value="GENERAR ENVIO">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>


        <div id="output" style="display: none;"></div>
    </div>
    <div id="map"></div>
    <script>
            function initMap() {
                var bounds = new google.maps.LatLngBounds;
                var markersArray = [];

                var origin = $("#origin").val();
                var destination = $("#destination").val();

                var destinationIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=B|FF0000|000000';
                var originIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=A|FFFF00|000000';
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: 55.53, lng: 9.4},
                    zoom: 10
                });
                var geocoder = new google.maps.Geocoder;

                var service = new google.maps.DistanceMatrixService;
                service.getDistanceMatrix({
                    origins: [origin],
                    destinations: [destination],
                    travelMode: 'BICYCLING',
                    unitSystem: google.maps.UnitSystem.METRIC,
                    avoidHighways: false,
                    avoidTolls: false
                }, function (response, status) {
                    if (status !== 'OK') {
                        alert('Error was: ' + status);
                    } else {
                        var originList = response.originAddresses;
                        var destinationList = response.destinationAddresses;
                        var outputDiv = document.getElementById('output');
                        outputDiv.innerHTML = '';
                        deleteMarkers(markersArray);

                        var showGeocodedAddressOnMap = function (asDestination) {
                            var icon = asDestination ? destinationIcon : originIcon;
                            return function (results, status) {
                                if (status === 'OK') {
                                    map.fitBounds(bounds.extend(results[0].geometry.location));
                                    markersArray.push(new google.maps.Marker({
                                        map: map,
                                        position: results[0].geometry.location,
                                        icon: icon
                                    }));
                                } else {
                                    alert('Geocode was not successful due to: ' + status);
                                }
                            };
                        };

                        for (var i = 0; i < originList.length; i++) {
                            var results = response.rows[i].elements;
                            geocoder.geocode({'address': originList[i]},
                                    showGeocodedAddressOnMap(false));
                            for (var j = 0; j < results.length; j++) {
                                geocoder.geocode({'address': destinationList[j]},
                                        showGeocodedAddressOnMap(true));
                                outputDiv.innerHTML += originList[i] + ' to ' + destinationList[j] +
                                        ': ' + results[j].distance.text + ' in ' +
                                        results[j].duration.text + '<br>';
                                $("#distancia").val(results[j].distance.text);
                                $("#tiempo").val(results[j].duration.text);
                                calcular_precio_envio($("#distancia").val(), "precio");
                            }
                        }
                    }
                });
            }

            // ELIMINA LOS MARCADORES CREADOS         
            function deleteMarkers(markersArray) {
                for (var i = 0; i < markersArray.length; i++) {
                    markersArray[i].setMap(null);
                }
                markersArray = [];
            }

            $("#calcular").click(function () {
                document.location.reload();
            });

            $(document).ready(function () {
                if ($("#distancia").val() != "") {
                    calcular_precio_envio($("#distancia").val(), "precio");
                }
            }
            );

            function calcular_precio_envio(_distancia, _id_caja) {
                var params = {
                    accion: "calcular_precio_envio",
                    distancia: _distancia
                };
                $.ajax({
                    type: "POST",
                    url: "/sistema/ManageEnvio",
                    data: params,
                    dataType: "html",
                    success: function (dataRes) {
                        $("#" + _id_caja).val("$" + dataRes);
                    }
                });
            }
            ;
    </script>


    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEeVoWhtj0m-yQaJ2RmpFyaEnUBBvrQNo&callback=initMap">
    </script>

</body>
</html>