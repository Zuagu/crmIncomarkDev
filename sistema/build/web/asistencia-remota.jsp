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
        <script type="text/javascript" src="js/arcade-geolocalizacion.js"></script>
        <!--ARCADE JS-->

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEeVoWhtj0m-yQaJ2RmpFyaEnUBBvrQNo&callback"></script>

    </head>
    <body style="background-image: url('images/background-cliente.png')">
        <div>

            <!--BEGIN TITLE & BREADCRUMB PAGE-->
            <div class="page-title-breadcrumb option-demo">
                <div class="page-header pull-right">
                    <div class="page-title">
                        Asistencia Remota
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

            <!--BEGIN CONTENT-->
            <div id="map" style="text-align: center;margin: 0px auto;width:700px; height: 500px;"></div>
            <!--END CONTENT-->

            <!--END PAGE WRAPPER-->
        </div>

        <!--CORE JAVASCRIPT-->
        <script type="text/javascript">

            var divMapa = document.getElementById('map');
            navigator.geolocation.getCurrentPosition(fn_ok, fn_error);
            // var divMapa = $("#mapa");
            function fn_error() {
                divMapa.innerHTML = 'Hubo un problema solicitando los datos';
            }
            ;
            function fn_ok(respuesta) {
                var lat = respuesta.coords.latitude;
                var lon = respuesta.coords.longitude;
                var gLatLon = new google.maps.LatLng(lat, lon);
                var objConfig = {
                    zoom: 17,
                    center: gLatLon
                };
                var gMapa = new google.maps.Map(divMapa, objConfig);
                var objConfigMarker = {
                    position: gLatLon,
                    map: gMapa,
                    title: "Usted está aquí."
                };
                var gMarker = new google.maps.Marker(objConfigMarker);
                var gCoder = new google.maps.Geocoder();
                var objInformacion = {
                    address: 'Galicia 234, Topo Grande'
                };
                gCoder.geocode(objInformacion, fn_coder);
                function fn_coder(datos) {
                    var coordenadas = datos[0].geometry.location; // objLatLong
                    var config = {
                        map: gMapa,
                        position: coordenadas,
                        title: 'ARCADE Solutions'
                    };
                    var gMarkerDV = new google.maps.Marker(config);
                    var objConfigDR = {
                        map: gMapa
                    };
                    var objConfigDS = {
                        origin: gLatLon, //LatLon - String domicilio
                        destination: objInformacion.address,
                        travelMode: google.maps.TravelMode.BICYCLING
                    };
                    var ds = new google.maps.DirectionsService(); // Obtener coordenadas
                    var dr = new google.maps.DirectionsRenderer(objConfigDR); // Traduce coordenadas a la ruta visible

                    ds.route(objConfigDS, fnRutear);

                    function fnRutear(resultados, status) {
                        // Generar la linea entre A y B
                        if (status == 'OK') {
                            dr.setDirections(resultados);
                        }
                    }

                }
            }
            ;
        </script>
        <!--CORE JAVASCRIPT-->
    </body>
</html>