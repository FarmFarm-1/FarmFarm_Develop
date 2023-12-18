<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<link rel="stylesheet" href="${cpath }/styles/mainpage.css" />


<script>
	$(function(){
		
		
				
		/* 농산물 시세 api 데이터 차트 */

		var options = {
			series : [				
					 {
						name : '${cropsKindList[0]}',
						data : [ ${cropsKindPriceList[0]} ]
					},
					{
						name : '${cropsKindList[1]}',
						data : [ ${cropsKindPriceList[1]} ]
					},
					{
						name : '${cropsKindList[2]}',
						data : [ ${cropsKindPriceList[2]} ]
					}, 
					{
						name : '${cropsKindList[3]}',
						data : [ ${cropsKindPriceList[3]} ]
					},
					{
						name : '${cropsKindList[4]}',
						data : [${cropsKindPriceList[4]} ]
					},
					{
						name : '${cropsKindList[5]}',
						data : [ ${cropsKindPriceList[5]} ]
					}, ],
			chart : {
				height : 300,
				width : 550,
				type : 'area'
			},
			dataLabels : {
				enabled : false
			},
			stroke : {
				width : 1,
				curve : 'smooth'
			},
			xaxis : {
				type : 'category',
				categories : [${cropQuoteDate}],
				labels : {
					style : {
						fontFamily : 'Pretendard, Source Sans Pro',
						color : 'lightgray'
					}

				}
			},
			
			title : {
				text : '농산물 현재 시세(원)',
				align : 'left',
				style : {
					fontFamily : 'Pretendard, Source Sans Pro',
					fontSize : '18px',
					fontWeight : 'bold',
					color : '#686868'
				}
			},
			fill : {
				type : 'gradient',
				gradient : {
					shadeIntensity : 1,
					inverseColors : false,
					opacityFrom : 0.5,
					opacityTo : 0,
					stops : [ 0, 90, 100 ]
				},
			},
			legend : {
				fontFamily : 'Pretendard, Source Sans Pro', // 원하는 글꼴 지정
				color : 'lightgray'
			}
		/* colors: ['#ffffff', '#000000'], */
		};

		var chart = new ApexCharts(document.querySelector("#apiChart"), options);
		chart.render();
		
	});
	
</script>
</head>
<body>
	<div id="chart"></div>
	
</body>
</html>