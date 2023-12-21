<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/경매/상세 조회</title>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C600%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C600%2C700%2C800" />
<link rel="stylesheet" href="${cpath}/styles/auctionDetail.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${cpath}/js/auctionDetail.js" type="text/javascript"></script>
<script type="text/javascript">
	let serial_num = "${sessionScope.serial_num}";
	let product_serial_num = "${auctionInfo.product_serial_num}";
	let user_real_input_price = 0;
	$(document).ready(function() {	
		$("#auction-price-input").on("input", pointChk);
		$("#auction-price-input").on("input", formattingNum);
		$(".bookmark-layer").click(function() {
			if(serial_num.substring(0,2) === "us"){
				let isHeartFilled = $("#heart-icon").toggleClass("filled").hasClass("filled");
                if (isHeartFilled) {
                    addToMyCart();
                    $("#heart-icon").attr("src", "${cpath}/assets/heart_fill.png");
                } else {
                    deleteFromMyCart();
                    $("#heart-icon").attr("src", "${cpath}/assets/heart_empty.png");
                }
			} else {
				showModal("로그인이 필요한 기능입니다.","서포터 회원으로 로그인 하세요.");
			}
		});
		
		$("#auction-confirm-btn").click(function() {
			if(serial_num.substring(0,2) === "us"){
				if(user_real_input_price - ${auctionInfo.starting_price * auctionInfo.harvest_amount} >= 0) {
					let max_auction_price = "${maxAndCntInfo.max_auction_price}";
					if(max_auction_price.length==0) {
						max_auction_price = Number(0);
					} else {
						max_auction_price = Number(${maxAndCntInfo.max_auction_price});
					}
					
					if (user_real_input_price - max_auction_price > 0) {
						$.ajax({
							url: "${cpath}/auction/auctionConfirm",
							type: "POST",
							data: {
									"user_serial_num" : serial_num,
									"user_price" : user_real_input_price,
									"product_serial_num" : product_serial_num
									},
							success: function(res) {
								if(res == 1) {
									showModal_success("입찰결과","낙찰시 시세보다 저렴한 가격으로 구매하실 수 있습니다!");
								} else {
									showModal("입찰 결과","입찰에 실패하였습니다. 다시 시도해 주세요");
								}
							},
							error: function(xhr, status, error) {
								if(xhr.responseText == "notEnoughPoint") {
									showModal("입찰 결과","포인트가 부족합니다");
								} else if (xhr.responseText == "notMaxAuctionraiser") {
									showModal("입찰 결과","최고 입찰 금액이 아닙니다");
								} else {
									showModal("입찰 결과","입찰에 실패하였습니다. 다시 시도해 주세요");
								}
							}
						});
					} else {
						showModal("입력 오류","최고 금액 이상으로 입찰하세요");
					}	
				}else {
					showModal("입력 오류","경매 시작 금액 이상으로 입찰하세요.");
				}	
			} else {
				showModal("로그인이 필요한 기능입니다.","서포터 회원으로 로그인 하세요.");
			}
		});
		
		function pointChk(e) {
	    	if(serial_num.substring(0,2) === "us"){
	    		let input = e.target.value;
		    	if(input.length > 0) {
		        	let inputNum = input.replace(/,/g, ""); // 콤마 제거
		        	user_real_input_price = Number(inputNum);
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
	    	} else {
	    		showModal("로그인이 필요한 기능입니다.","서포터 회원으로 로그인 하세요.");
	    		e.target.value = "0";
	    	}
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
	
	function formattingNum(e) {
    	let input = e.target.value; 
        if(input.length > 0) {
        	let num = input.replace(/,/g, ""); // 콤마 제거
        	if (!$.isNumeric(num)) {
        		showModal("입력 오류","숫자만 입력하세요.");
                $(this).val(input.slice(0, -1)); // 마지막 문자 제거
            } else {
                $(this).val(Number(num).toLocaleString("en")); // 천 단위로 콤마 추가
            }
        }
    }
	
	function showChart() {
    	location.href="${cpath}/chart/area/${auctionInfo.product_kind}";
    }
	
	function showMore() {
		$(".product-detail-img:not(:first)").toggle();
	}	
	
	/*더보기 이벤트 리스너*/
	document
			.addEventListener(
					'DOMContentLoaded',
					function() { //DOM 생성 후 이벤트 리스너 등록
						//더보기 버튼 이벤트 리스너
						document.querySelector('.btn_open').addEventListener('click',
								function(e) {

									let classList = document
											.querySelector('.detailinfo').classList; // 더보기 프레임의 클래스 정보 얻기
									let contentHeight = document
											.querySelector('.detailinfo > .fd_prostorypic').offsetHeight; //컨텐츠 높이 얻기

									// 더보기
									classList.remove('showstep1');
									classList.add('showstep2');

									document
											.querySelector('.btn_open').classList
											.add('hide');
									document
											.querySelector('.btn_close').classList
											.remove('hide');
									document
									.querySelector('.gradient').classList
									.add('hide');

								});
						document.querySelector('.btn_close').addEventListener('click',
										function(e) {

											let classList = document
													.querySelector('.detailinfo').classList; // 더보기 프레임의 클래스 정보 얻기
											let contentHeight = document
													.querySelector('.detailinfo > .fd_prostorypic').offsetHeight; //컨텐츠 높이 얻기

											//접기
											classList.remove('showstep2');
											classList.add('showstep1');
											document
													.querySelector('.btn_close').classList
													.add('hide');
											document
													.querySelector('.btn_open').classList
													.remove('hide');
											document
											.querySelector('.gradient').classList
											.remove('hide');

										});

					});
</script>
</head>
<body>
	<jsp:include page="${cpath}/WEB-INF/views/header.jsp" />
	<div class="container">
		<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
		<div class="left-div">
			<img class="product-thum-img"
				src="${auctionInfo.auction_thumb_img_url }">
			<div class="funding_info_left_bottom">
				<div class="detailinfo showstep1">
					<p class="project_story">프로젝트 스토리</p>
					<div class="gradient"></div>
					<img class="fd_prostorypic"
						src="${auctionInfo.auction_product_img_url }"></img>
				</div>

				<div class="btn_open">

					<div class="stroymoregroup">

						<div class="grouptext">
							<p class="text">스토리 더보기</p>
							<img class="fd_greencheck"
								src="${cpath}/assets/fd_greencheck.png" />
						</div>
					</div>
				</div> <div class="btn_close hide">
					<div class="stroymoregroup">
						<div class="grouptext">
							<p class="text">스토리 접기</p>
							<img class="fd_greencheck"
								src="${cpath}/assets/fd_greencheck_toggle.png" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="right-div">
			<div class="productinfo-div">
				<div class="farmerinfoline1">
					<p class="product_name">${auctionInfo.product_name}</p>
					<img class="shareicon-class" src="${cpath}/assets/shareicon.png" />
				</div>
				<p class="farm-introduction-class">${auctionInfo.farm_introduction}</p>
			</div>
			<div class="funding-participant-info">
				<div class="funding-paticipant">
					<div class="paticipant-tag">
						<p class="participant-cnt">
							<fmt:formatNumber value="${maxAndCntInfo.participant_cnt}"
								pattern="#,###.#" />
						</p>
						<p class="small-unit">명 참여</p>
					</div>
					<div class="due-day">
						<p class="dday-tag">D - ${auctionInfo.dueDay}</p>
					</div>
				</div>
				<div class="funding-paticipate-info">
					<p class="small-unit">최고 입찰가</p>
					<p class="funding-max-price">
						<fmt:formatNumber value="${maxAndCntInfo.max_auction_price}"
							pattern="#,###.#" />
						원
					</p>
				</div>
			</div>
			<div class="frame-layout">
				<div class="farmerinfo-frame1">
					<div class="farmerinfo-line1-div">
						<img class="farmer-image" src="${cpath}/assets/farmerimage.png" />
						<div class="farmer-name-div">${auctionInfo.farmer_name}</div>
					</div>
					<img class="chaticon-img" src="${cpath}/assets/chaticon.png" />
				</div>
				<div class="frame-layer">
					<div class="frame-line">
						<p class="frame-tit">농장명</p>
						<p class="frame-val">${auctionInfo.farm_name}</p>
					</div>
					<div class="frame-line">
						<p class="frame-tit">농장 주소</p>
						<p class="frame-val">${auctionInfo.farm_address}</p>
					</div>
					<div class="frame-line">
						<p class="frame-tit">농장 면적</p>
						<p class="frame-val">
							<fmt:formatNumber value="${auctionInfo.farm_square_footage}"
								pattern="#,###.#" />
							평
						</p>
					</div>
					<div class="frame-line">
						<p class="frame-tit">농작물 종류</p>
						<p class="frame-val">${auctionInfo.product_kind}</p>
					</div>
					<div class="frame-line">
						<p class="frame-tit">수확 완료일</p>
						<p class="frame-val">
							<fmt:formatDate value="${auctionInfo.update_date}" type="date"
								pattern="yyyy-MM-dd" />
						</p>
					</div>

					<div class="frame-line">
						<p class="frame-tit">파머 연락처</p>
						<p class="frame-val">${auctionInfo.farmer_phone}</p>
					</div>
				</div>
			</div>
			<div class="frame-layout">
				<div class="frame-line">
					<p class="frame-tit">출하량</p>
					<p class="frame-val">
						<fmt:formatNumber value="${auctionInfo.harvest_amount}"
							pattern="#,###.#" />
						kg
					</p>
				</div>
				<div class="frame-line">
					<p class="frame-tit">단위당 단가</p>
					<p class="frame-val">
						<fmt:formatNumber value="${auctionInfo.starting_price}"
							pattern="#,###.#" />
						원
					</p>
				</div>
				<div class="frame-line">
					<p class="frame-tit">경매 시작가</p>
					<p class="frame-val">
						<fmt:formatNumber
							value="${auctionInfo.starting_price * auctionInfo.harvest_amount}"
							pattern="#,###.#" />
						원
					</p>
				</div>

			</div>
			<div class="frame-tag">
				<p>시세대비 손익</p>
				<img class="reading-glasses-icon" src="${cpath}/assets/search.png"
					onclick="showChart()">
			</div>
			<div class="frame-layout">
				<div class="frame-line">
					<div class="frame-tit">현재 시세(1kg)</div>
					<div class="frame-val">
						<fmt:formatNumber value="${cropsquoteInfo.crops_quote}"
							pattern="#,###.#" />
					</div>
				</div>
				<div class="frame-line">
					<div class="frame-tit">측정 날짜</div>
					<div class="frame-val">
						<fmt:formatDate value="${cropsquoteInfo.regDate}" type="date"
							pattern="yyyy-MM-dd" />
					</div>
				</div>
				<div class="frame-line">
					<div class="frame-tit">도매 예상 구매가</div>
					<div class="frame-val">
						<fmt:formatNumber
							value="${cropsquoteInfo.crops_quote * auctionInfo.harvest_amount}"
							pattern="#,###.#" />
					</div>
				</div>
				<div class="frame-line">
					<div class="frame-tit">낙찰 손익금</div>
					<div class="frame-val">
						<fmt:formatNumber
							value="${cropsquoteInfo.crops_quote * auctionInfo.harvest_amount
						 - maxAndCntInfo.max_auction_price}"
							pattern="#,###.#" />
					</div>
				</div>
				<div class="frame-line">
					<div class="frame-tit">낙찰 손익율</div>
					<div class="frame-val">
						<c:choose>
							<c:when test="${maxAndCntInfo.max_auction_price ne null}">
								<fmt:formatNumber
									value="${((cropsquoteInfo.crops_quote * auctionInfo.harvest_amount 
					     - maxAndCntInfo.max_auction_price)
					     /maxAndCntInfo.max_auction_price)}"
									type="percent" />
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="0" type="percent" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<p class="frame-tag">입찰현황</p>
			<div class="auctionhistory-div">
				<div class="auctionhisotry-inner-layout">
					<c:forEach items="${auctionHistoryInfo}" var="list">
						<div class="auction-participant-info">
							<p class="auction-participant-name">${list.user_name}</p>
							<p class="auction-participant-val">
								<fmt:formatNumber value="${list.user_price}" pattern="#,###.#" />
							</p>
							<p class="auction-participate-date">
								<fmt:formatDate value="${list.bid_date}" type="date"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
			<p class="frame-tag">경매할 포인트 입력</p>
			<div class="auction-price-form">
				<input id="auction-price-input" name="auctionInputPrice"
					class="auction-price-input" type="text" value="0" maxlength="11">
				<label class="won-unit" for="auction-price-input">원</label>
			</div>
			<div class="point-show">
				<p>포인트 부족</p>
			</div>

			<div class="last-layer">
				<div class="bookmark-layer">
					<div class="bookmark-btn">
						<c:set value="${myBookmarkShow}" var="myBookmark" />
						<c:choose>
							<c:when test="${myBookmark == 1}">
								<img id="heart-icon" class="heart-icon filled"
									src="${cpath}/assets/heart_fill.png" />
							</c:when>
							<c:otherwise>
								<img id="heart-icon" class="heart-icon"
									src="${cpath}/assets/heart_empty.png" />
							</c:otherwise>
						</c:choose>
						<p id="heart-num" class="heart-num">${bookmarkCnt}</p>
					</div>
				</div>
				<button id="auction-confirm-btn" class="auction-confirm-btn">입찰하기</button>
			</div>
		</div>
	</div>
	<jsp:include page="${cpath}/WEB-INF/views/footer.jsp" />
</body>
</html>