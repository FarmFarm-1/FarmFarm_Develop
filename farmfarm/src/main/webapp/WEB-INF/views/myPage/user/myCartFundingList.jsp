<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myCartList</title>
</head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath }/styles/myCartList.css" />

<body>
	<h1>펀딩리스트</h1>
	<%-- <div class="mypage--hQ1">
		<!-- <p class="item--oAd">관심 있는 소식만 모았어요</p>
		<div class="auto-group-owjb-tC5">
			<div class="filter1-CTf">전체</div>
			<div class="filter2-GTX" onclick="myCartFundingList()">펀딩</div>
			<div class="filter3-8Vj" onclick="myCartAuctionList()">경매</div>
		</div> -->
		
		
		<c:forEach items="${myCartAllList }" var="caList">
			<div id="here" class="auto-group-ceto-zXw">
				<div class="cartlist2-HAu">
				
					<div class="auto-group-zfjd-bBb">
						<div class="auto-group-fj9f-Bb3">
							<img class="vector-6xu" src="./assets/vector-1id.png" /> <!--db에서 가져오는 사진으로 바꾸기-->
							<div class="auto-group-fj9f-Bb3-bg"></div>
						</div>
						<p class="item--ixM">${caList.product_name}</p>
						<div class="minamount-7xZ">
							<p class="item--rfF">최소금액</p>
							<p class="item-13000-BxR">${caList.min_amount}원</p>
						</div>
						<div class="expectedharvest-XUZ">
							<p class="item--rWq">재배 예정일</p>
							<p class="item-2023-9-11-n9b">${caList.expected_planting_date}</p>
						</div>
						<div class="harvestfootage-Y6q">
							<p class="item--Fmw">평수</p>
							<p class="item-50-Bfb">${caList.farm_square_footage}평</p>
						</div>
					</div>

					<div class="cartlistfoot-xER">
						<div class="fundingpct-7ND">
							<div class="rectangle-81-3Wm"></div>
						</div>
						<div class="auto-group-lfhx-zB7">
							<p class="item-44--yoj">
								<span class="item-44--yoj-sub-0">${caList.total_pct}</span> <span
									class="item-44--yoj-sub-1"> 달성</span>
							</p>
							<p class="item-9--wty">
								<span class="item-9--wty-sub-0">${caList.d_day}일</span> <span
									class="item-9--wty-sub-1"> 남음</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div> --%>
</body>
</html>