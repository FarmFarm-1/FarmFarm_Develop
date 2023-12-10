<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농작물 시세</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script>
	window.onload = function() {
		var options = {
			series : [ {
				name : 'series1',
				data : [ 31, 40, 28, 51, 42, 109, 100 ]
			}, {
				name : 'series2',
				data : [ 11, 32, 45, 32, 34, 52, 41 ]
			} ],
			chart : {
				height : 350,
				type : 'area'
			},
			dataLabels : {
				enabled : false
			},
			stroke : {
				curve : 'smooth'
			},
			xaxis : {
				type : 'datetime',
				categories : [ "2018-09-19T00:00:00.000Z",
						"2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z",
						"2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z",
						"2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z" ]
			},
			tooltip : {
				x : {
					format : 'dd/MM/yy HH:mm'
				},
			},
		};

		var chart = new ApexCharts(document.querySelector("#chart"), options);
		chart.render();
	};
</script>
</head>
<body>
	<div id="chart"></div>
</body>
</html>