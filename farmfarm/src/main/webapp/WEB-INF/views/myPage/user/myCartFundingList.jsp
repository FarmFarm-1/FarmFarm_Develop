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
<link rel="stylesheet" href="${cpath }/styles/myCartFundingList.css" />
<script type="text/javascript">
	function myCartFundingList() {
		$.ajax({
			url : "/myPageUser/myCartFundingList",
			success : function(responseData) {
				$("#here2").html(responseData);

				// 펀딩 버튼의 스타일 변경
				$("#funding").addClass("selected-button");
				$("#auction").removeClass("selected-button");
			}
		});
	}

	function myCartAuctionList() {
		$.ajax({
			url : "/myPageUser/myCartAuctionList",
			success : function(responseData) {
				$("#here2").html(responseData);

				// 경매 버튼의 스타일 변경
				$("#auction").addClass("selected-button");
				$("#funding").removeClass("selected-button");
			}
		});
	}
</script>
<script>
	
</script>
<body>
	<!-- <h1>펀딩리스트</h1> -->
	<div id="here2" class="mypage--hQ1">
		<p class="item--oAd">관심 있는 소식만 모았어요</p>
		<div class="auto-group-owjb-tC5">
			<!-- <div class="filter1-CTf">전체</div> -->
			<div id="funding" class="filter2-GTX" onclick="myCartFundingList()">펀딩</div>
			<div id="auction" class="filter3-8Vj" onclick="myCartAuctionList()">경매</div>
		</div>

		<div class="cart-container">
			<c:forEach items="${myCartFundingList }" var="fList">
				<div class="auto-group-ceto-zXw">
					<div class="cartlist2-HAu">

						<div class="auto-group-zfjd-bBb">
							<div class="auto-group-fj9f-Bb3">
								<img class="vector-6xu" src="./assets/vector-1id.png" />
								<!--db에서 가져오는 사진으로 바꾸기-->
								<!-- ${fList.funding_thumb_img_url} -->
								<div class="auto-group-fj9f-Bb3-bg"></div>
							</div>
							<p class="item--ixM">${fList.product_name}</p>
							<div class="minamount-7xZ">
								<p class="item--rfF">최소금액</p>
								<p class="item-13000-BxR">${fList.min_amount}원</p>
							</div>
							<div class="expectedharvest-XUZ">
								<p class="item--rWq">재배 예정일</p>
								<p class="item-2023-9-11-n9b">${fList.expected_planting_date}</p>
							</div>
							<div class="harvestfootage-Y6q">
								<p class="item--Fmw">평수</p>
								<p class="item-50-Bfb">${fList.farm_square_footage}평</p>
							</div>
						</div>

						<div class="cartlistfoot-xER">
							<div class="fundingpct-7ND">
								<div class="rectangle-81-3Wm"
									style="--percent: ${fList.total_pct}"></div>
							</div>
							<div class="auto-group-lfhx-zB7">
								<p class="item-44--yoj">
									<span class="item-44--yoj-sub-0">${fList.total_pct}</span> <span
										class="item-44--yoj-sub-1"> % 달성</span>
								</p>
								<p class="item-9--wty">
									<c:choose>
										<c:when test="${fList.d_day > 0}">
											<span class="item-9--wty-sub-0">${fList.d_day}</span>
											<span class="item-9--wty-sub-1">일 남음</span>
										</c:when>
										<c:when test="${fList.d_day == 0}">
											<span class="deadline_today">마감 임박</span>
										</c:when>
									</c:choose>

								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>