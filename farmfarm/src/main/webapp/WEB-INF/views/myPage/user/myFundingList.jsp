<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
	/* function showMore() {
		$.ajax({
			url : "/myPageUser/myFundingListShowMore",
			success : function(responseData) {
				$("#showHere").html(responseData);
			}
		});
	} */
</script>

<body>

	<div class="mypage--Se9">
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
		<c:forEach items="${myFundingList }" var="fList">
			<div class="fundinglist1-giZ">
				<img class="tomatoes-55667411280-5Eu"
					src="${cpath }/assets/tomatoes.png" /> <!-- 바꿔야함 db에서 가져오는 사진 -->

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
				<div class="fundingpct-4Y5">${fList.total_funding_pct}%</div>
				<p class="fundingpay-7WM">${fList.user_funding_amout}p</p>
				<p class="fundingmypercent-djb">${fList.user_funding_pct}%</p>
				<div class="fundingstate-MQh">${fList.product_status}</div>
				<img class="show_more" id="show_more" onclick="location.href='/myPageUser/myFundingListShowMore'"
					src="${cpath }/assets/down_solid.png" />


			</div>
			
			<!-- <div id="showHere"></div> -->

		</c:forEach>

	</div>

</body>
</html>