<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C600%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C600%2C700%2C800" />
<style type="text/css">
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'LINESeedKR-Bd';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2')
		format('woff2');
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

.areaChartModal {
	zoom: 0.8;
	z-index: 3;
	position: fixed;
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
	position: fixed;
	top: 50%;
	width: 1300px;
	height: 800px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateY(-50%);
}

.close {
	cursor: pointer;
	font-family: Pretendard, 'Source Sans Pro';
	position: relative;
	top: 0.5%;
    right: -49%;
	z-index: 1;
	width: 2rem;
	height: 2rem;
}
#chart{
	min-height: 715px;
    position: relative;
    top: 3rem;
}
</style>
<script>
	document.addEventListener('keydown', onEnter);
	document.addEventListener('click', function(event) {
		if (event.target.matches('.close')) {
			hideModal();
		}
	});
	
	function onEnter() {
		var keyCode = window.event.keyCode;
		if (keyCode == 13
				&& window.getComputedStyle(document.querySelector('.areaChartModal')).display != 'none') {
			// 모달이 떠있다면, 먼저 모달을 닫고 함수를 종료
			document.querySelector('.areaChartModal').style.display = 'none';
			event.preventDefault(); // 이벤트 전파 방지
			return;
		}
	}
	function hideModal() {
		document.querySelector('.areaChartModal').style.display = 'none';
		//location.reload(true); => 경매시 체크해봐야함.
	}
	
	function showModalChart() {
		document.querySelector('.areaChartModal').style.display = 'flex';
	}

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
						fontSize: '35px',  // 폰트 크기
						fontWeight: 'bold',  // 폰트 굵기
						opacity: 1,  // 투명도
		    	    }
	        },
	        subtitle: {
		          text: '${crops_kind}',
		          align: 'left',
		          margin: 50,
		          style: {
						colors: ['#828282'],  // 텍스트 색상
						fontSize: '25px',  // 폰트 크기
						fontWeight: 'normal',  // 폰트 굵기
						opacity: 1,  // 투명도
		    	    }
	        },
			chart : {
				height : 700,
				type : 'area',
				fontFamily: 'Pretendard, Source Sans Pro',
				
			},
			dataLabels : {
				enabled : true,
				style: {
					colors: ['#828282'],  // 텍스트 색상
					fontSize: '15px',  // 폰트 크기
					fontWeight: 'normal',  // 폰트 굵기
					opacity: 1,  // 투명도
	    	    }
			},
			
			
			stroke : {
				curve : 'smooth',
				colors: ['#696969'],
				width: 2
				
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
		          colors: ['#D3D3D3'],
		          gradient: {
		            shadeIntensity: 1,
		            opacityFrom: 0.7,
		            opacityTo: 0.9,
		            stops: [0, 100]
		          }
		    },
		    legend : {
				fontFamily : 'Pretendard, Source Sans Pro', // 원하는 글꼴 지정
				color : 'lightgray'
			}
		};
		
		var chart = new ApexCharts(document.querySelector("#chart"), options);
		chart.render();
		 
	});
</script>
</head>
<body>
	<div class="areaChartModal" id="basicModal">

		<div class="modal_body">
			<img class="close" src="${cpath}/assets/Xbtn.png"
				onclick="hideModal()" />
			<div id="chart"></div>
		</div>
	</div>
</body>
</html>