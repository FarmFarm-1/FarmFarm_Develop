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

/* let serial_num = "${sessionScope.serial_num}"; */

function func(product_serial_num, index) {
	event.stopPropagation();

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

	} /* else {
		alert("서포터 회원으로 로그인 하세요.");
	} */
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
<body>
	<!-- <h1>펀딩리스트</h1> -->
	<div id="here2" class="mypage--hQ1">
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
		<p class="item--oAd">관심 있는 소식만 모았어요</p>
		<div class="auto-group-owjb-tC5">
			<div id="funding" class="filter2-GTX" onclick="myCartFundingList()">펀딩</div>
			<div id="auction" class="filter3-8Vj" onclick="myCartAuctionList()">경매</div>
		</div>

		<div class="cart-container">
			<c:forEach items="${myCartFundingList }" var="fList" varStatus="status">
				<div class="auto-group-ceto-zXw">
					<div class="cartlist2-HAu" onclick="location.href='${cpath}/funding/fundingDetail?product_serial_num=${fList.product_serial_num}';">

						<div class="auto-group-zfjd-bBb">
							<img class="auto-group-fj9f-Bb3" src="${fList.funding_thumb_img_url}" />
							<div class="${fList.d_day>=0?'active':'overlay'}">펀딩이 종료되었습니다</div>
							
							<div class="vector-6xu"
								onclick="func('${fList.product_serial_num }', ${status.index })">
								<img id="heart-icon-${status.index}" class="heart-icon filled"
									src="/assets/heart_thub.png" />
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
<script>

//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

</script>
</html>