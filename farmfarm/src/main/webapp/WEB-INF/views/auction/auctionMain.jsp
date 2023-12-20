<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=5" />
<meta name="theme-color" content="#000000" />

<title>mainpage/경매</title>
<link rel="stylesheet" href="${cpath }/styles/fundingMain.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="${cpath}/WEB-INF/views/header.jsp" />
	<div class="mainpage--54h">
		<div class="auto-group-rv6m-jsK">
			<div class="auto-group-v9bk-T2d">
				<p class="item--ZLZ">
					<span class="item--ZLZ-sub-0">농작물 펀딩 플랫폼 </span> <span
						class="item--ZLZ-sub-1">팜팜</span>
				</p>
				<img class="twemoji-ear-of-corn-CXw"
					src="${cpath }/assets/twemoji-ear-of-corn-4KX.png">
				<img class="twemoji-ear-of-corn-Uds"
					src="${cpath }/assets/twemoji-ear-of-corn-SVK.png">
				<div class="rectangle-72-Vmw"></div>
				<p class="item--R9o">농작물의 주인이 되는 가장 쉬운 방법</p>

			</div>

		</div>
		<div class="body">
			<div class="group-156-QXX">
				<div>
					<div class="auto-group-r77t-U1b" onclick="location.href='${cpath}/auction/auctionList';">
						<p class="item--zkd">경매 라인업</p>
						<button class="button_list">
							<img class="mingcute-right-line-6of"
								src="${cpath }/assets/greater_than.png" />
						</button>
					</div>
					<p class="item--s97">팜팜에서 핫한 경매를 만나보세요.</p>
				</div>

				<div class="item--uPK" id="fundingOrder">
					<c:forEach items="${auctionListHot}" var="auctionItem"
						varStatus="status">
						
						<div class="funding_item" onclick="location.href='${cpath}/auction/auctionDetail?product_serial_num=${auctionItem.product_serial_num}';">
							<div class="img_wrap">
								<img class="corn-36630861280-1-daD" src="${auctionItem.auction_thumb_img_url }" />
								<div class="${auctionItem.d_day>=0?'active':'overlay'}">경매가 종료되었습니다</div>
							</div>
							<div class="bookmark-layer"
								onclick="func('${auctionItem.product_serial_num }', ${status.index })">
								<div class="bookmark-btn">
									<c:choose>
										<c:when test="${fn:contains(myBookmarkShowByUser, auctionItem.product_serial_num)}">
											<img id="heart-icon-${status.index}" class="heart-icon filled" src="/assets/heart_thub.png" />
										</c:when>
										<c:otherwise>
											<img id="heart-icon-${status.index}" class="heart-icon" src="${cpath}/assets/heart_white_empty.png" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="group-86-zpV">
								<div class="auto-group-turr-XpR">
									<p class="item--FEd">${auctionItem.product_name}</p>
									<div class="auto-group-fwnd-MHf">
										<div class="auto-group-ufyr-s17">
											<p class="item--Cp5">현 입찰가</p>
										</div>
										<div class="auto-group-do49-DjB">
											<p class="item-10000-aJq"><fmt:formatNumber value="${auctionItem.current_price}" pattern="#,###"/>원</p>
										</div>
									</div>
									<div class="auto-group-jk2v-Anq">
										<div class="auto-group-rqmx-fzV">
											<p class="item--p6h">수확 완료일</p>
										</div>
										<div class="auto-group-sqjq-8Wh">
											<p class="item-2023-6-15-gYD">${auctionItem.harvestEnd}</p>
										</div>
									</div>
									<div class="auto-group-mvny-sMo">
										<div class="auto-group-94eh-nzZ">
											<p class="item--jeu">출하량</p>
										</div>
										<div class="auto-group-h2ld-LPo">
											<p class="item-100-TDX-auction">${auctionItem.harvest_amount}kg</p>
										</div>
									</div>

								</div>
								<div class="auto-group-bgvz-iHs">
									<div class="auto-group-jebp-rQ5">
										<p class="${auctionItem.d_day>=0?'item-64--o4R':'item-64--o4R-1'}">
											<span class="item-64--o4R-sub-0">${auctionItem.participants}명</span>
											<span class="item-64--o4R-sub-1"> 참여</span>
										</p>
									</div>
									<div class="auto-group-kpa5-sM7">
										<p class="item-15--Dfs">
											<c:choose>
												<c:when test="${auctionItem.d_day > 0}">
													<span class="item-15--Dfs-sub-0" id="m">${auctionItem.d_day}일</span>
													<span class="item-15--Dfs-sub-1"> 남음</span>
												</c:when>
												<c:when test="${auctionItem.d_day == 0}">
													<span class="deadline_today">오늘 종료</span>
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
		</div>
	</div>
	<jsp:include page="${cpath}/WEB-INF/views/footer.jsp" />
</body>
<script>
let serial_num = "${sessionScope.serial_num}";

function func(product_serial_num, index) {
	

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