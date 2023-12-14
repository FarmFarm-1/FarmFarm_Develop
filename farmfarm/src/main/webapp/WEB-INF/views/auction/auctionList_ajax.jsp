<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath}/styles/fundingMain.css" />
<c:forEach items="${auctionList}" var="auctionItem" varStatus="status">
<div class="funding_item" onclick="location.href='${cpath}/auction/auctionDetail?product_serial_num=${auctionItem.product_serial_num}';">
	<div class="img_wrap">
		<img class="corn-36630861280-1-daD"
			src="${cpath}/assets/tomatoes-55667411280.png" />
		<div class="${auctionItem.d_day>=0?'active':'overlay'}">경매가 종료되었습니다</div>
	</div>
	<div class="bookmark-layer"
		onclick="func('${auctionItem.product_serial_num }', ${status.index })">
		<div class="bookmark-btn">
			<img id="heart-icon-${status.index}"
				class="${auctionItem.is_cart eq '0'?'heart-icon':'heart-icon filled' }"
				src="${auctionItem.is_cart eq '0' ?'/assets/heart_white_empty.png':'/assets/heart_thub.png' }" />
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
					<p class="item-10000-aJq">${auctionItem.current_price}원</p>
				</div>
			</div>
			<div class="auto-group-jk2v-Anq">
				<div class="auto-group-rqmx-fzV">
					<p class="item--p6h">수확 완료일</p>
				</div>
				<div class="auto-group-sqjq-8Wh">
					<p class="item-2023-6-15-gYD">${auctionItem.expected_harvest_date}</p>
				</div>
			</div>
			<div class="auto-group-mvny-sMo">
				<div class="auto-group-94eh-nzZ">
					<p class="item--jeu">출하량</p>
				</div>
				<div class="auto-group-h2ld-LPo">
					<p class="item-100-TDX">${auctionItem.harvest_amount}kg</p>
				</div>
			</div>
		</div>
		<div class="auto-group-bgvz-iHs">
			<div class="auto-group-jebp-rQ5">

				<p
					class="${auctionItem.d_day>=0?'item-64--o4R':'item-64--o4R-1'}">

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

<script>
	 

	function func(product_serial_num, index) {
		console.log(index);
		console.log(serial_num);
		console.log(product_serial_num);

		if (serial_num.substring(0, 2) === "us") {
			let heartIcon = $("#heart-icon-" + index);
			let isHeartFilledBeforeToggle = heartIcon.hasClass("filled");
			heartIcon.toggleClass("filled");
			let isHeartFilledAfterToggle = heartIcon.hasClass("filled");
			if (isHeartFilledBeforeToggle) {
				heartIcon.attr("src", "${cpath}/assets/heart_white_empty.png");
				deleteFromMyCart(product_serial_num);
			} else {
				heartIcon.attr("src", "${cpath}/assets/heart_thub.png");
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