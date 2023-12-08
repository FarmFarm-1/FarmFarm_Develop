<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${cpath }/resources/styles/fundingMain.css" />

<!-- <script>
	overlay();

	function overlay() {

		$(".overlay").each(function() {
			let dday = $(this).data('dday');
			console.log(dday);
			if (dday < 0) {
				$(this).addClass("active");
			}
		});
	}
</script> -->


<c:forEach items="${fundingList }" var="fundingItem">

	<div class="funding_item">

		<div class="img_wrap">

			<img class="corn-36630861280-1-daD"
				src="${cpath }/resources/assets/tomatoes-55667411280.png" />
			<div class="${fundingItem.d_day>=0?'active':'overlay'}">펀딩이
				종료되었습니다</div>
		</div>

		<%-- <img class="vector-n7f"
			src="${cpath }/resources/assets/vector-P4R.png" /> --%>
		<div class="bookmark-layer"
			onclick="func('${fundingItem.product_serial_num }')">
			<div class="bookmark-btn">
				<img id="heart-icon"
					class="${fundingItem.is_cart eq '0'?'heart-icon':'heart-icon filled' }"
					src="${fundingItem.is_cart eq '0' ?'/resources/assets/heart_empty.png':'/resources/assets/heart_thub.png' }" />
				<%-- <c:choose>
					<c:when test="${myBookmark == 1}">
						<img id="heart-icon" class="heart-icon filled"
							src="${cpath }/resources/assets/heart_thub.png" />
					</c:when>
					<c:otherwise>
						<img id="heart-icon" class="heart-icon"
							src="${cpath }/resources/assets/heart_empty.png" />
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
					<div class="progress" style="--percent: ${fundingItem.funding_pct}"></div>
				</div>
			</div>
			<div class="auto-group-bgvz-iHs">
				<div class="auto-group-jebp-rQ5">

					<p class="${fundingItem.d_day>=0?'item-64--o4R':'item-64--o4R-1'}">

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

<script>
	let isHeartFilled ;

	function func(product_serial_num) {

		console.log(serial_num);
		console.log(product_serial_num);

		if (serial_num.substring(0, 2) === "us") {
			
			console.log(isHeartFilled);
			isHeartFilled = $("#heart-icon").toggleClass("filled").hasClass("filled");
			console.log(isHeartFilled);
			if (isHeartFilled) {
				addToMyCart(product_serial_num);
				/* $("#heart-icon").attr("src", "${cpath }/resources/assets/heart_thub.png"); */
			} else {
				deleteFromMyCart(product_serial_num);
				/* $("#heart-icon").attr("src", "${cpath }/resources/assets/heart_empty.png"); */
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

<!-- <script>
	overlay();

	function overlay() {
		//console.log($(this));
		$(".funding_item").each(function() {

			
			// 정규표현식을 사용하여 숫자 부분 추출
			var numberPart = parseInt(spanText.match(/\d+/)[0], 10);

			console.log(numberPart);
		
			if (numberPart < 0) {
				$(this).addClass("active");
			}
		});
	}
</script>
  -->



