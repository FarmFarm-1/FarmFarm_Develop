<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/경매/상세 조회</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C600%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C600%2C700%2C800" />
<link rel="stylesheet" href="/styles/auctionDetail.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/js/auctionDetail.js" type="text/javascript"></script>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<script type="text/javascript">
	$(document).ready(function() {
		let serial_num = "${sessionScope.serial_num}";
		let product_serial_num = "${auctionInfo.product_serial_num}";
		
		$(".bookmark-layer").click(function() {
			if(serial_num.substring(0,2) === "us"){
				let isHeartFilled = $("#heart-icon").toggleClass("filled").hasClass("filled");
                if (isHeartFilled) {
                    addToMyCart();
                    $("#heart-icon").attr("src", "/assets/heart_fill.png");
                } else {
                    deleteFromMyCart();
                    $("#heart-icon").attr("src", "/assets/heart_empty.png");
                }
                
			} else {
				alert("서포터 회원으로 로그인 하세요."); 
			}
		});
		
		
		function reloadMyCart() {
			$.ajax({
	            url: "${cpath}/mypage/reloadCart",
	            type: "post",
	            data : {"product_serial_num" : product_serial_num},
	            success: function(res) {
	            	$("#heart-num").text(res);
	            }
	        });
		}
		
		function addToMyCart() {
			$.ajax({
	            url: "${cpath}/mypage/addcart",
	            type: "post",
	            data: {
	                "product_serial_num" : product_serial_num,
	                "user_serial_num" : serial_num
	            },
	            success: function(res) {
	            	reloadMyCart();
	            }
	        });
		}
		
		function deleteFromMyCart() {
			$.ajax({
	            url: "${cpath}/mypage/deletecart",
	            type: "POST",
	            data: {
	                "product_serial_num" : product_serial_num,
	                "user_serial_num" : serial_num
	            },
	            success: function(res) {
	            	reloadMyCart();
	            }
	        });
		}
		
	    $("#auction-confirm-btn").click(function() {
	    	let input_price = $("#auction-price-input").val();
	    	let user_price = user_price.replace(/,/g, "");
	        $.ajax({
	            url: "/your-endpoint-url", 
	            type: "POST",
	            contentType: "application/json",
	            data: JSON.stringify({
	            	user_price : user_price,
	                product_serial_num: "your-product-serial-num", 
	                user_serial_num: "your-user-serial-num" 
	            }),
	            success: function() {
	                alert("add 성공");
	            }
	        });
	    });
	    $("#auction-price-input").on("input", formattingNum);
	    $("#auction-price-input").on("keyup", pointChk);
	    
	    function formattingNum(e) {
	    	let input = e.target.value; 
	        if(input.length > 0) {
	        	let num = input.replace(/,/g, ""); // 콤마 제거
	        	if (!$.isNumeric(num)) {
	                alert("숫자만 입력해주세요.");
	                $(this).val(input.slice(0, -1)); // 마지막 문자 제거
	            } else {
	                $(this).val(Number(num).toLocaleString("en")); // 천 단위로 콤마 추가
	            }
	        }
	    }
	    function pointChk(e) {
	    	let input = e.target.value;
	    	if(input.length > 0) {
	        	let inputNum = input.replace(/,/g, ""); // 콤마 제거
	        	if ($.isNumeric(inputNum)) {
	                $.ajax({
	                	url: "${cpath}/mypage/pointCheck",
	                	type: "post",
	                	data: {"inputNum" : inputNum},
	                	success: function(res) {
	                		if(res==="disable") {
	                			$(".point-show").css("visibility", "visible");
	                		} else {
	                			$(".point-show").css("visibility", "hidden");
	                		}
	                	}
	                });
	            }
	        }
	    }
	});
</script>
</head>
<body>
	<div class="main-div">
		<div class="productDetail-div">
			<div class="left-div">
				<img class="product-detail-img" src="/assets/productdetailimg2.png">
				<div class="showmore-btn">
					<p class="item--Mv5">스토리 더보기</p>
					<img class="arrow-see-more"
						src="/assets/arrow_see_more.png" />
				</div>
			</div>
			<div class="right-div">
				<div class="productinfo-div">
					<div class="farmerinfoline1">
						<p class="product_name">${auctionInfo.product_name}</p>
						<img class="shareicon-class" src="/assets/shareicon.png" />
					</div>
					<p class="farm-introduction-class">${auctionInfo.farm_introduction}</p>
				</div>
				<div class="funding-participant-info">
					<div class="funding-paticipant">
						<p class="participant-cnt"><fmt:formatNumber value="${maxAndCntInfo.participant_cnt}"  pattern="#,###.#"/></p>
						<p class="small-unit">명 참여</p>
						<div class="due-day">D - ${auctionInfo.dueDay}</div>
					</div>
					<div class="funding-paticipate-info">
						<p class="small-unit">최고 입찰가</p><p class="funding-max-price"><fmt:formatNumber value="${maxAndCntInfo.max_auction_price}"  pattern="#,###.#"/> 원</p>
					</div>
				</div>
				<div class="farmerinfo-div">
					<div class="farmerinfo-frame1">
						<div class="farmerinfo-line1-div">
							<img class="farmer-image" src="/assets/farmerimage.png" />
							<div class="farmer-name-div">${auctionInfo.farmer_name}</div>
						</div>
						<img class="chaticon-img" src="/assets/chaticon.png" />
					</div>
					<div class="farmerinfo-frame2">
						<div class="frame2-line1">
							<p class="farm-name">농장명</p>
							<p class="farm-name-val">${auctionInfo.farm_name}</p>
						</div>
						<div class="frame2-line2">
							<p class="farm-address">농장 주소</p>
							<p class="farm-address-val">${auctionInfo.farm_address}</p>
						</div>
						<div class="frame2-line3">
							<p class="farm-footage">농장 면적</p>
							<p class="farm-footage-val"><fmt:formatNumber value="${auctionInfo.farm_square_footage}"  pattern="#,###.#"/> 평</p>
						</div>
						<div class="frame2-line4">
							<p class="farm-kind">농작물 이름</p>
							<p class="farm-kind-val">${auctionInfo.product_kind}</p>
						</div>
						<div class="frame2-line5">
							<p class="crops-finish">수확 완료일</p>
							<p class="crops-finish-val"><fmt:formatDate value="${auctionInfo.update_date}" type="date" pattern="yyyy-MM-dd" /></p>
						</div>
						
						<div class="frame2-line6">
							<p class="farmer-phone">파머 연락처</p>
							<p class="farmer-phone-val">${auctionInfo.farmer_phone}</p>
						</div>
					</div>
				</div>
				<div class="crops-info-div">
					<div class="crops-inner-div">
						<div class="crops-line1">
							<p class="crops-amount">출하량</p>
							<p class="crops-amount-val"><fmt:formatNumber value="${auctionInfo.harvest_amount}"  pattern="#,###.#"/> kg</p>
						</div>
						<div class="crops-line2">
							<p class="kg-per-price">단위당 단가</p>
							<p class="kg-per-price-val"><fmt:formatNumber value="${auctionInfo.starting_price}"  pattern="#,###.#"/> 원</p>
						</div>
						<div class="crops-line3">
							<p class="starting-price">경매 시작가</p>
							<p class="starting-price-val"><fmt:formatNumber value="${auctionInfo.starting_price * auctionInfo.harvest_amount}"  pattern="#,###.#"/> 원</p>
						</div>
					</div>
				</div>
				<div class="crops-api-info">시세(api) 활용해서 값의 차이 제공</div>
				<p class="auctionhisotry-tag">입찰현황</p>
				<div class="auctionhistory-div">
					<div class="auctionhisotry-inner-layout">
						<c:forEach items="${auctionHistoryInfo}" var="list">
							<div class="auction-participant-info">
								<p class="auction-participant-name">${list.user_name}</p>
								<p class="auction-participant-val"><fmt:formatNumber value="${list.user_price}"  pattern="#,###.#"/></p>
								<p class="auction-participate-date"><fmt:formatDate value="${list.bid_date}" type="date" pattern="yyyy-MM-dd hh:mm:ss" /></p>
							</div>
						</c:forEach>
					</div>
				</div>
				<p class="auction-input-tag">경매할 포인트 입력</p>
				<form action="${cpath}/mypage/" method="post" class="auction-price-form" >
					<input id="auction-price-input" class="auction-price-input" type="text" value="0">
					<label class="won-unit" for="auction-price-input">원</label>
				</form>
				<div class="point-show">
					<p>포인트 부족</p>
				</div>
							
				<div class="last-layer">
					<div class="bookmark-layer">
						<div class="bookmark-btn">
							<c:set value="${myBookmarkShow}" var="myBookmark"/>
							<c:choose>
								<c:when test="${myBookmark == 1}" >
								 	<img id="heart-icon" class="heart-icon filled" src="/assets/heart_fill.png" />
								</c:when>
								<c:otherwise>
									<img id="heart-icon" class="heart-icon" src="/assets/heart_empty.png" />
								</c:otherwise>
							</c:choose>						
							<p id="heart-num" class="heart-num">${bookmarkCnt}</p>
						</div>
					</div>
					<button class="auction-confirm-btn">입찰하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>