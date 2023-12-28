<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script>
var toggleState = {}; //do not delete
</script>	
</head>
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
					src="${fList.funding_thumb_img_url}"
					<c:if test="${fList.product_status eq '펀딩진행중'}">
                		onclick="location.href='/funding/fundingDetail?product_serial_num=${fList.product_serial_num}'"
             		</c:if> 
             		<c:if test="${fList.product_status eq '경매중'}">
                		onclick="location.href='/auction/auctionDetail?product_serial_num=${fList.product_serial_num}'"
             		</c:if>/>

				<div class="fundinginfo-B9X">

					<div class="auto-group-anxd-tCM">
						<p class="item--aqs">${fList.product_name}</p>
						<p class="item--UwF">${fList.farm_name}</p>
						<div class="auto-group-huhf-zPo">
							<img class="mdi-location-v2Z" src="./assets/location.png" />
							<%-- <p class="item--3cy">${fList.farm_address}</p> --%>
							<p class="item--3cy">
								<c:choose>
									<c:when
										test="${not empty fList.farm_address and fList.farm_address.contains('')}">
										<c:set var="words" value="${fList.farm_address.split(' ')}" />
										<c:out value="${words[0]} ${words[1]}" />
									</c:when>
									<c:otherwise>
										<c:out value="${fList.farm_address}" />
									</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
				</div>

				<p class="fundingdate-9R7">${fList.user_funding_date}</p>
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
				<input type="hidden" name="product_serial_num"
					value="${fList.product_serial_num}"> 
				<input type="hidden" name="product_serial_num"
						value="${fList.product_serial_num}"> <input type="submit" onclick="show_more_action('${fList.product_serial_num}')"
						id="${fList.product_serial_num }_submit" style="display: none;">
				<!-- fList.product_status가 "경작중"인 경우에만 더 보기 아이콘 표시 -->
				<c:if test="${fList.product_status eq '경작중'}">
					<label for="${fList.product_serial_num }_submit"> <img
						class="show_more" id="show_more_${fList.product_serial_num }"
						src="${cpath }/assets/ic-round-plus.png" />
					</label>
				</c:if>
				<script>
				//show_more_action
				function show_more_action(product_serial_num) {
					
					let selected_product_serial_num = product_serial_num;
					toggleState[selected_product_serial_num] = !toggleState[selected_product_serial_num];
					if(toggleState[selected_product_serial_num]) {
						$.ajax({
							url : "${cpath}/myPageUser/myFundingListShowMore",
							method : "POST",
							data : {
								"product_serial_num" : selected_product_serial_num
							},
							success : function(res) {
								$("#here_"+product_serial_num).html(res);
								document.getElementById('show_more_' + product_serial_num).setAttribute('src', '${cpath }/assets/tabler_minus.png');
							}
						});
					} else {
				        $("#here_" + product_serial_num).empty();
				        document.getElementById('show_more_' + product_serial_num).setAttribute('src', '${cpath }/assets/ic-round-plus.png');
				    }
					
				}
				
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
				
				var chart${status.index} = new ApexCharts(document.querySelector("#chart${status.index}"), options${status.index});
				chart${status.index}.render(); 
				</script>
			</div>
			<div id="here_${fList.product_serial_num}" class="here_layout"></div>
		</c:forEach>
	</div>
</body>
</html>