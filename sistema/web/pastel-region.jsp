<%-- 
    Document   : pastel-region
    Created on : 8/01/2018, 02:15:35 PM
    Author     : Luis Cortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/arcade-variable-post.js"></script>

        <%
//            int x = Integer.parseInt(request.getParameter("qa"));
            Double x = 10.50;
            String regiones = "'MONTERREY','PUEBLA', 'CHIHUAHUA'";

        %>
    </head>
    <body>

        <script type="text/javascript" src="highcharts/highcharts.js"></script>
        <script type="text/javascript" src="highcharts/exporting.js"></script>

        <div id="container" style="width: 100%; height: 460px; margin: 0 auto"></div>


        <script type="text/javascript">
            // ARCADE Software®
            //==================================================================
            var colors = Highcharts.getOptions().colors,
                    categories = [<%= regiones%>], // ['MONTERREY','PUEBLA', 'CHIHUAHUA']
                    data = [{
                            y: 28.76,
                            color: colors[0],
                            drilldown: {
                                name: 'Estatus MONTERREY',
                                categories: ['(53) DM1 -> $142,505.00', 'DM2', 'PR'],
                                data: [1.06, 10.50, 17.2],
                                color: colors[0]
                            }
                        }, {
                            y: 42.24,
                            color: colors[1],
                            drilldown: {
                                name: 'Estatus CHIHUAHUA',
                                categories: ['PR', 'PI', 'NEG'],
                                data: [10.33, 18.15, 13.76],
                                color: colors[1]
                            }
                        }, {
                            y: 29.00,
                            color: colors[2],
                            drilldown: {
                                name: 'Estatus PUEBLA',
                                categories: ['NC', 'DM3', 'DM4', 'MB'],
                                data: [9.10, 9.45, 5.23, 5.22],
                                color: colors[2]
                            }
                        }],
                    browserData = [],
                    versionsData = [],
                    i,
                    j,
                    dataLen = data.length,
                    drillDataLen,
                    brightness;


            // Build the data arrays
            for (i = 0; i < dataLen; i += 1) {

                // add browser data
                browserData.push({
                    name: categories[i],
                    y: data[i].y,
                    color: data[i].color
                });

                // add version data
                drillDataLen = data[i].drilldown.data.length;
                for (j = 0; j < drillDataLen; j += 1) {
                    brightness = 0.2 - (j / drillDataLen) / 5;
                    versionsData.push({
                        name: data[i].drilldown.categories[j],
                        y: data[i].drilldown.data[j],
                        color: Highcharts.Color(data[i].color).brighten(brightness).get()
                    });
                }
            }

            // Create the chart
            Highcharts.chart('container', {
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Importe por cobrar, agrupado por estatus y por región'
                },
                subtitle: {
                    text: 'Fuente: <a href="#">base de datos de la empresa</a>'
                },
                yAxis: {
                    title: {
                        text: 'Total percent market share'
                    }
                },
                plotOptions: {
                    pie: {
                        shadow: false,
                        center: ['50%', '50%']
                    }
                },
                tooltip: {
                    valueSuffix: '%'
                },
                series: [{
                        name: 'REGION',
                        data: browserData,
                        size: '60%',
                        dataLabels: {
                            formatter: function () {
                                return this.y > 5 ? this.point.name : null;
                            },
                            color: '#ffffff',
                            distance: -30
                        }
                    }, {
                        name: 'PORCENTAJE ESTATUS',
                        data: versionsData,
                        size: '80%',
                        innerSize: '60%',
                        dataLabels: {
                            formatter: function () {
                                // display only if larger than 1
                                return this.y > 1 ? '<b>' + this.point.name + ':</b> ' + this.y + '%' : null;
                            }
                        }
                    }]
            });
            //==================================================================
        </script>
    </body>
</html>
