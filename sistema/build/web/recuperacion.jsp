<%-- 
    Document   : recuperacion-asignaciones
    Created on : 22/09/2017, 12:10:04 PM
    Author     : Luis Cortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    </head>
    <body style="background-image: url('images/background-cliente.png')">
        <script src="highcharts/highcharts.js"></script>
        <script src="highcharts/modules/data.js"></script>
        <script src="highcharts/drilldown.js"></script>

        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


        <script type="text/javascript">
            //==================================================================
            $(document).ready(function () {
                Highcharts.chart('container', {
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Recuperacion de asignaciones activas. TELCEL'
                    },
                    subtitle: {
                        text: 'Click en las columnas para mas detalle. Fuente: Base de datos</a>.'
                    },
                    xAxis: {
                        type: 'category'
                    },
                    yAxis: {
                        title: {
                            text: 'Recuperacion'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            borderWidth: 0,
                            dataLabels: {
                                enabled: true,
                                format: '$' + '{point.y:.2f}'
                            }
                        }
                    },

                    tooltip: {
                        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
                    },

                    series: [{
                            name: 'Brands',
                            colorByPoint: true,
                            data: [{
                                    name: '1717E_M',
                                    y: 1527992.82,
                                    drilldown: 'Microsoft Internet Explorer'
                                }, {
                                    name: '1817E_M',
                                    y: 473274.12,
                                    drilldown: 'Chrome'
                                }, {
                                    name: '1917E_M',
                                    y: 1891666.08,
                                    drilldown: 'Firefox'
                                }, {
                                    name: '2017E_M',
                                    y: 4.77,
                                    drilldown: 'Safari'
                                }, {
                                    name: '2117E_M',
                                    y: 0.91,
                                    drilldown: 'Opera'
                                }]
                        }],
                    drilldown: {
                        series: [{
                                name: 'Microsoft Internet Explorer',
                                id: 'Microsoft Internet Explorer',
                                data: [
                                    [
                                        'v11.0',
                                        24.13
                                    ],
                                    [
                                        'v8.0',
                                        17.2
                                    ],
                                    [
                                        'v9.0',
                                        8.11
                                    ],
                                    [
                                        'v10.0',
                                        5.33
                                    ],
                                    [
                                        'v6.0',
                                        1.06
                                    ],
                                    [
                                        'v7.0',
                                        0.5
                                    ]
                                ]
                            }, {
                                name: 'Chrome',
                                id: 'Chrome',
                                data: [
                                    [
                                        'v40.0',
                                        5
                                    ],
                                    [
                                        'v41.0',
                                        4.32
                                    ],
                                    [
                                        'v42.0',
                                        3.68
                                    ],
                                    [
                                        'v39.0',
                                        2.96
                                    ],
                                    [
                                        'v36.0',
                                        2.53
                                    ],
                                    [
                                        'v43.0',
                                        1.45
                                    ],
                                    [
                                        'v31.0',
                                        1.24
                                    ],
                                    [
                                        'v35.0',
                                        0.85
                                    ],
                                    [
                                        'v38.0',
                                        0.6
                                    ],
                                    [
                                        'v32.0',
                                        0.55
                                    ],
                                    [
                                        'v37.0',
                                        0.38
                                    ],
                                    [
                                        'v33.0',
                                        0.19
                                    ],
                                    [
                                        'v34.0',
                                        0.14
                                    ],
                                    [
                                        'v30.0',
                                        0.14
                                    ]
                                ]
                            }, {
                                name: 'Firefox',
                                id: 'Firefox',
                                data: [
                                    [
                                        'v35',
                                        2.76
                                    ],
                                    [
                                        'v36',
                                        2.32
                                    ],
                                    [
                                        'v37',
                                        2.31
                                    ],
                                    [
                                        'v34',
                                        1.27
                                    ],
                                    [
                                        'v38',
                                        1.02
                                    ],
                                    [
                                        'v31',
                                        0.33
                                    ],
                                    [
                                        'v33',
                                        0.22
                                    ],
                                    [
                                        'v32',
                                        0.15
                                    ]
                                ]
                            }, {
                                name: 'Safari',
                                id: 'Safari',
                                data: [
                                    [
                                        'v8.0',
                                        2.56
                                    ],
                                    [
                                        'v7.1',
                                        0.77
                                    ],
                                    [
                                        'v5.1',
                                        0.42
                                    ],
                                    [
                                        'v5.0',
                                        0.3
                                    ],
                                    [
                                        'v6.1',
                                        0.29
                                    ],
                                    [
                                        'v7.0',
                                        0.26
                                    ],
                                    [
                                        'v6.2',
                                        0.17
                                    ]
                                ]
                            }, {
                                name: 'Opera',
                                id: 'Opera',
                                data: [
                                    [
                                        'v12.x',
                                        0.34
                                    ],
                                    [
                                        'v28',
                                        0.24
                                    ],
                                    [
                                        'v27',
                                        0.17
                                    ],
                                    [
                                        'v29',
                                        0.16
                                    ]
                                ]
                            }]
                    }
                });
            }
            );
            //==================================================================
        </script>
    </body>
</html>
