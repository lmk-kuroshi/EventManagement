<%-- 
    Document   : chart
    Created on : Nov 5, 2021, 7:07:23 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="curve_chart" style="width: 900px; height: 500px" ></div>
        <script type="text/javascript" src="js/Linechart.js"></script>
        <!--        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Days', 'Sales', 'Expenses'],
                    ['1/11', 1000, 400],
                    ['8/11', 1170, 460],
                    ['2006', 660, 1120],
                    ['2007', 1030, 540]
                ]);

                var options = {
                    title: 'Followed Event',
                    curveType: 'function',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

                chart.draw(data, options);
            }
        </script>
    </body>
</html>
