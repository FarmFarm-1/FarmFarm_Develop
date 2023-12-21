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
<link rel="stylesheet" href="${cpath }/styles/fundingMain.css" />
<body>
	<div class="mypage--hQ1">
		<p class="item--oAd">관심 있는 소식만 모았어요</p>
		<div class="auto-group-owjb-tC5">
			<div class="filter1-CTf">전체</div>
			<div class="filter2-GTX">펀딩</div>
			<div class="filter3-8Vj">경매</div>
		</div>
		<!-- 
		<div class="auto-group-ceto-zXw">
			<div class="cartlist2-HAu">
				<div class="auto-group-zfjd-bBb">
					<div class="harvestfootage-Y6q">
						<p class="item--Fmw">평수</p>
						<p class="item-50-Bfb">50평</p>
					</div>
					<div class="expectedharvest-XUZ">
						<p class="item--rWq">재배 예정일</p>
						<p class="item-2023-9-11-n9b">2023/09/11</p>
					</div>
					<div class="minamount-7xZ">
						<p class="item--rfF">최소금액</p>
						<p class="item-13000-BxR">13,000원</p>
					</div>
					<p class="item--ixM">행복농장 달달 스테비아 토망고</p>
					<div class="auto-group-fj9f-Bb3">
						<img class="vector-6xu" src="./assets/vector-1id.png" />
						<div class="auto-group-fj9f-Bb3-bg"></div>
					</div>
				</div>
				<div class="cartlistfoot-xER">
					<div class="fundingpct-7ND">
						<div class="rectangle-81-3Wm"></div>
					</div>
					<div class="auto-group-lfhx-zB7">
						<p class="item-44--yoj">
							<span class="item-44--yoj-sub-0">44%</span> <span
								class="item-44--yoj-sub-1"> 달성</span>
						</p>
						<p class="item-9--wty">
							<span class="item-9--wty-sub-0">9일</span> <span
								class="item-9--wty-sub-1"> 남음</span>
						</p>
					</div>
				</div>
			</div>
		</div> -->

		<c:forEach items="${myCartFundingList }" var="fundingItem"
			varStatus="status">

			<div class="funding_item"
				onclick="location.href='${cpath}/funding/fundingDetail?product_serial_num=${fundingItem.product_serial_num}';">

				<div class="img_wrap">

					<img class="corn-36630861280-1-daD"
						src="${cpath }/assets/tomatoes-55667411280.png" />
					<div class="${fundingItem.d_day>=0?'active':'overlay'}">펀딩이
						종료되었습니다</div>
				</div>

				<%-- <img class="vector-n7f"
			src="${cpath }/assets/vector-P4R.png" /> --%>
				<div class="bookmark-layer"
					onclick="func(event,'${fundingItem.product_serial_num }', ${status.index })">
					<div class="bookmark-btn">
						<img id="heart-icon-${status.index}"
							class="${fundingItem.is_cart eq '0'?'heart-icon':'heart-icon filled' }"
							src="${fundingItem.is_cart eq '0' ?'/assets/heart_white_empty.png':'/assets/heart_thub.png' }" />
						<%-- <c:choose>
					<c:when test="${myBookmark == 1}">
						<img id="heart-icon" class="heart-icon filled"
							src="${cpath }/assets/heart_thub.png" />
					</c:when>
					<c:otherwise>
						<img id="heart-icon" class="heart-icon"
							src="${cpath }/assets/heart_empty.png" />
					</c:otherwise>
				</c:choose> --%>
					</div>
				</div>

				<div class="group-86-zpV">
					<div class="auto-group-turr-XpR">
						<p class="item--FEd">${fundingItem.product_name}</p>
						<div class="auto-group-fwnd-MHf">
							<div class="auto-group-ufyr-s17">
								<p class="item--Cp5">최소금액</p>
							</div>
							<div class="auto-group-do49-DjB">
								<p class="item-10000-aJq">${fundingItem.min_amount}원</p>
							</div>
						</div>
						<div class="auto-group-jk2v-Anq">
							<div class="auto-group-rqmx-fzV">
								<p class="item--p6h">재배 예정일</p>
							</div>
							<div class="auto-group-sqjq-8Wh">
								<p class="item-2023-6-15-gYD">${fundingItem.expected_planting_date}</p>
							</div>
						</div>
						<div class="auto-group-mvny-sMo">
							<div class="auto-group-94eh-nzZ">
								<p class="item--jeu">평수</p>
							</div>
							<div class="auto-group-h2ld-LPo">
								<p class="item-100-TDX">${fundingItem.farm_square_footage}평</p>
							</div>
						</div>

						<div
							class="${fundingItem.d_day>=0?'progress-bar':'progress-bar-none'}">
							<div class="progress"
								style="--percent: ${fundingItem.funding_pct}"></div>
						</div>
					</div>
					<div class="auto-group-bgvz-iHs">
						<div class="auto-group-jebp-rQ5">

							<p
								class="${fundingItem.d_day>=0?'item-64--o4R':'item-64--o4R-1'}">

								<span class="item-64--o4R-sub-0">${fundingItem.funding_pct}%</span>
								<span class="item-64--o4R-sub-1"> 달성</span>
							</p>
						</div>
						<div class="auto-group-kpa5-sM7">
							<p class="item-15--Dfs">
								<c:choose>
									<c:when test="${fundingItem.d_day > 0}">

										<span class="item-15--Dfs-sub-0" id="m">${fundingItem.d_day}일</span>
										<span class="item-15--Dfs-sub-1"> 남음</span>

									</c:when>
									<c:when test="${fundingItem.d_day == 0}">
										<span class="deadline_today">마감 임박</span>
									</c:when>
									<%-- <c:otherwise>
							   <div class="b">
								<span class="item-15--Dfs-sub-0" id="mySpan">
								${fundingItem.d_day}일						
								
								</span>
								<span class="item-15--Dfs-sub-1"> 남음</span>
								</div>
								<!-- 나를 감싸고 있는 funding-item div에서 overlay div 가 none처리 된걸 flex만 바꾸면됨 -->
							
							
							</c:otherwise> --%>
								</c:choose>
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</body>

<script>
	 

	function func(event,product_serial_num, index) {
		event.stopPropagation();
		console.log(index);
		console.log(serial_num);
		console.log(product_serial_num);

		if (serial_num.substring(0, 2) === "us") {
			let heartIcon = $("#heart-icon-" + index);
			let isHeartFilledBeforeToggle = heartIcon.hasClass("filled");
			heartIcon.toggleClass("filled");
			let isHeartFilledAfterToggle = heartIcon.hasClass("filled");
			if (isHeartFilledBeforeToggle) {
				heartIcon.attr("src", "${cpath }/assets/heart_white_empty.png");
				deleteFromMyCart(product_serial_num);
			} else {
				heartIcon.attr("src", "${cpath }/assets/heart_thub.png");
				addToMyCart(product_serial_num);
			}

		} else {
			alert("서포터 회원으로 로그인 하세요.");
		}
	}

	function reloadMyCart(product_serial_num) {
		$.ajax({
			url : "${cpath}/mypage/reloadCart",
			type : "post",
			data : {
				"product_serial_num" : product_serial_num
			},
			success : function(res) {
				$("#heart-num").text(res);
			}
		});
	}

	function addToMyCart(product_serial_num) {
		$.ajax({
			url : "${cpath}/mypage/addcart",
			type : "post",
			data : {
				"product_serial_num" : product_serial_num,
				"user_serial_num" : serial_num
			},
			success : function(res) {
				reloadMyCart(product_serial_num);
			}
		});
	}

	function deleteFromMyCart(product_serial_num) {
		$.ajax({
			url : "${cpath}/mypage/deletecart",
			type : "POST",
			data : {
				"product_serial_num" : product_serial_num,
				"user_serial_num" : serial_num
			},
			success : function(res) {
				reloadMyCart(product_serial_num);
			}
		});
	}
</script>
</html>