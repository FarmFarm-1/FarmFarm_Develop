<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농작물 시세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<script>
	$(function() {
		let selected_kind = "${cropsInfo.crops_kind}";
		
		var data = {
			series : [ {
				name : 'series1',
				data : [ 31, 40, 28, 51, 42, 109, 100 ]
			}, {
				name : 'series2',
				data : [ 11, 32, 45, 32, 34, 52, 41 ]
			} ],
			chart : {
				height : 500,
				type : 'area'
			},
			dataLabels : {
				enabled : false
			},
			stroke : {
				curve : 'smooth'
			},
			xaxis : {
				type : 'date',
				categories : [ "22-05-02",
						"22-05-03", "22-05-04",
						"22-05-05", "22-05-06",
						"22-05-07", "22-05-08" ]
			},
			tooltip : {
				x : {
					format : 'dd/MM/yy'
				},
			},
		};
		var chart = new ApexCharts(document.querySelector("#chart"), data);
		chart.render();
	});
</script>
</head>
<body>
	<div id="chart"></div>
</body>
</html>