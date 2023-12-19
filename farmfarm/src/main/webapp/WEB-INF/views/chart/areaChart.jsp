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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C600%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C600%2C700%2C800" />
<style type="text/css">
@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
@font-face {
    font-family: 'LINESeedKR-Bd';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
	font-family: 'LINESeedKR-Bd-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/LINESeedKR-Bd-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}
</style>	
<script>
	$(function() {
		let priceList = ${priceList};
		let dateList = ${dateList};
		<%--let avgPrice = ${cropspriceAvg};--%>
		
		var options = {
			series : [{
				name : "${crops_kind}", 
				data : priceList
			}],
			title: {
		          text: '농작물 시세',
		          align: 'left',
		          style: {
						colors: ['#828282'],  // 텍스트 색상
						fontSize: '25px',  // 폰트 크기
						fontWeight: 'bold',  // 폰트 굵기
						opacity: 1,  // 투명도
		    	    }
	        },
	        subtitle: {
		          text: '${crops_kind}',
		          align: 'left',
		          style: {
						colors: ['#828282'],  // 텍스트 색상
						fontSize: '15px',  // 폰트 크기
						fontWeight: 'normal',  // 폰트 굵기
						opacity: 1,  // 투명도
		    	    }
	        },
			chart : {
				height : 500,
				type : 'area',
				fontFamily: 'LINESeedKR-Bd, Source Sans Pro'
			},
			dataLabels : {
				enabled : true,
				style: {
					colors: ['#828282'],  // 텍스트 색상
					fontSize: '10px',  // 폰트 크기
					fontWeight: 'normal',  // 폰트 굵기
					opacity: 1,  // 투명도
	    	    }
			},
			
			
			stroke : {
				curve : 'smooth'
			},
			xaxis: {
				type: 'String',
				categories: dateList,
	        },
	        <%--
			annotations: {
		          yaxis: [{
		            y: avgPrice,
		            borderColor: '#999',
		            label: {
		              show: true,
		              text: '평균가',
		              style: {
		                color: "#fff",
		                background: '#64A346'
	                 }
	            }
          	}]},--%>
			fill: {
		          type: 'gradient',
		          gradient: {
		            shadeIntensity: 1,
		            opacityFrom: 0.7,
		            opacityTo: 0.9,
		            stops: [0, 100]
		          }
		    }
		};
		
		var chart = new ApexCharts(document.querySelector("#chart"), options);
		chart.render();
		 
	});
</script>
</head>
<body>
	<div id="chart"></div>
</body>
</html>