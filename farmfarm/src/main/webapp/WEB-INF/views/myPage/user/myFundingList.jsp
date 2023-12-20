<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mypage/서포터/펀딩한팜</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet" href="${cpath }/styles/myFundingList.css" />

</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<script type="text/javascript">


/* $(window).ready(showChart()); */
	/* function showMore() {
		$
				.ajax({
					data: 
					url : "/myPageUser/myFundingListShowMore",
					success : function(responseData) {
						document.querySelector('#fundingDetailModal').style.display = 'flex'; //모달을 띄위는 코드
					}
				});
	} */

	/* $(window).ready(function() {
		// 각 프로젝트의 펀딩 달성률에 따라 파이 차트를 그립니다.
		$('.fundingpct-4Y5').each(function() {
			var fundingPct = parseFloat($(this).text().replace('p', '')); // 펀딩 달성률 추출 및 파싱
			draw(fundingPct, $(this), '#a7e0a3', '#F6F6F6', '#d9ead3'); // 변경된 색상 및 배경색상 적용
		});
	});

	function draw(max, element, colorname, bgcolor, redcolor) {
		var i = 1;
		var func1 = setInterval(function() {
			if (i <= max) {
				color1(i, element, colorname);
				i++;
			} else {
				clearInterval(func1);
			}
		}, 10);

		// 배경색 변경
		element.css({
			"background" : bgcolor
		});
	};

	function color1(i, element, colorname) {
		element.css({
			"background" : "conic-gradient(" + colorname + " 0% " + i
					+ "%, #d9ead3 " + i + "% 100%)"
		});
	}; */
</script>

<body>

	<div class="mypage--Se9">
		<%-- <jsp:include page="myFundingListShowMore.jsp" /> --%>
		<!-- 모달 -->
		<!-- 고정 -->
		<p class="item--ydo">펀딩한 프로젝트를 확인해보세요.</p>
		<div class="fundinglistheader-H8h">
			<p class="item--CmT">상품 정보</p>
			<p class="item--ufs">펀딩 참여일</p>
			<p class="item--DwT">펀딩 달성률</p>
			<p class="item--juo">결제 포인트</p>
			<p class="item--E5s">나의 지분</p>
			<p class="item--MAV">진행 상태</p>
		</div>

		<!-- 펀딩 리스트 -->
		<c:forEach items="${myFundingList }" var="fList" varStatus="status">

			<div class="fundinglist1-giZ">
				<img class="tomatoes-55667411280-5Eu"
					src="${fList.funding_thumb_img_url}" />
				<!-- 바꿔야함 db에서 가져오는 사진 -->

				<div class="fundinginfo-B9X">

					<div class="auto-group-anxd-tCM">
						<p class="item--aqs">${fList.product_name}</p>
						<p class="item--UwF">${fList.farm_name}</p>
						<div class="auto-group-huhf-zPo">
							<img class="mdi-location-v2Z" src="./assets/location.png" />
							<p class="item--3cy">${fList.farm_address}</p>
						</div>
					</div>
				</div>

				<p class="fundingdate-9R7">${fList.user_funding_date}</p>
				<%-- <div class="fundingpct-4Y5">${fList.total_sum_pct}%</div> --%>
				<div class="fundingpct-4Y5" id="chart${status.index }"></div>
				<p class="fundingpay-7WM">
					<fmt:formatNumber value="${fList.user_funding_amout}" type="number"
						pattern="#,##0" />
					p
				</p>
				<p class="fundingmypercent-djb">${fList.user_funding_pct}%</p>
				<div class="fundingstate-MQh"
					<c:if test="${fList.product_status eq '펀딩실패'}">
                		style="background-color: #EF6134;" 
            		</c:if>>
					${fList.product_status}</div>
				<%-- <img class="show_more" id="show_more" onclick="location.href='/myPageUser/myFundingListShowMore'"
					src="${cpath }/assets/down_solid.png" /> --%>
				<%-- <form action="/myPageUser/myFundingListShowMore" method="post">
					<input type="hidden" name="product_serial_num"
						value="${fList.product_serial_num }"> <input type="submit"
						id="${fList.product_serial_num }_submit" style="display: none;">
					<label for="${fList.product_serial_num }_submit"><img
						class="show_more" id="show_more"
						src="${cpath }/assets/down_solid.png" /></label>
				</form> --%>
				<form action="/myPageUser/myFundingListShowMore" method="post">
					<input type="hidden" name="product_serial_num"
						value="${fList.product_serial_num}"> <input type="submit"
						id="${fList.product_serial_num }_submit" style="display: none;">

					<!-- fList.product_status가 "경작중"인 경우에만 더 보기 아이콘 표시 -->
					<c:if test="${fList.product_status eq '경작중'}">
						<label for="${fList.product_serial_num }_submit"> <img
							class="show_more" id="show_more"
							src="${cpath }/assets/ic-round-plus.png" />
						</label>
					</c:if>
				</form>

				<script type="text/javascript">

        var seriesData${status.index} = [${fList.total_sum_pct}];
        var options${status.index} = {
                series: seriesData${status.index},
                chart: {
                    height: 150,
                    width: 150,
                    type: 'radialBar',
                },
                plotOptions: {
                    radialBar: {
                        hollow: {
                            size: '50%',
                        },
                        dataLabels: {
                            showOn: "always",
                            name: {
                                show: false,
                                color: "#64A346",
                                fontSize: "13px"
                            },
                            value: {
                                offsetY: 8,
                                color: "#64A346",
                                fontSize: "16px",
                                show: true,
                                fontWeight: "bold",
                                fontFamily: 'Pretendard, Source Sans Pro'
                            }
                        }
                    },
                },
                labels: [],
                fill: {
                    colors: ['#64A346'],
                },
                stroke: {
                    lineCap: "round",
                    width: 2,
                },
            };

        
         /* function showChart (){        
        	 var chart${status.index} = new ApexCharts(document.querySelector("#chart${status.index}"), options${status.index});
         chart${status.index}.render();} */
     	var chart${status.index} = new ApexCharts(document.querySelector("#chart${status.index}"), options${status.index});
        chart${status.index}.render(); 

</script>

			</div>
		</c:forEach>

	</div>


</body>
</html>