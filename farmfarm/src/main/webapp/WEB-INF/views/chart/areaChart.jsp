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
		let priceList = ${priceList};
		let dateList = ${dateList};
		console.log(dateList);
		
		var data = {
			series : [{
				name : "${crops_kind}", 
				data : priceList
			}],
			title: {
		          text: '농작물 시세',
		          align: 'left'
	        },
	        subtitle: {
	          text: '${crops_kind}',
	          align: 'left'
	        },
			chart : {
				height : 500,
				type : 'area'
			},
			dataLabels : {
				enabled : true
			},
			stroke : {
				curve : 'smooth'
			},
			xaxis: {
				type: 'String',
				categories: dateList,
	        },
			annotations: {
		          yaxis: [{
		            y: 30,
		            borderColor: '#999',
		            label: {
		              show: true,
		              text: '평균 도매가',
		              style: {
		                color: "#fff",
		                background: '#00E396'
	                 }
	            }
          	}]},
			fill: {
		          type: 'gradient',
		          gradient: {
		            shadeIntensity: 1,
		            opacityFrom: 0.7,
		            opacityTo: 0.9,
		            stops: [0, 100]
		          }
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