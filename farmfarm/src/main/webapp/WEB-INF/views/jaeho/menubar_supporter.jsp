<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mypage/서포터/펀딩한팜</title>

<link rel="stylesheet" href="${cpath }/styles/mypage_menubar.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="jw-center">
		<div class="mypage--Se9">
			<!-- header -->
			<div class="auto-group-wrk9-we5">
				<div class="menu">
					<div class="userinfo">
						<div class="auto-group-autb-WKo">
							<div class="auto-group-yaf7-cNq">서포터</div>
							<img class="vector-4PF" src="${cpath}/assets/person.png" />
							<p class="item--ASH">팜쪽이님</p>
						</div>
					</div>
					<button class="logout-QrR" onclick="location.href='myFunding'">
						<p class="item--8XX">로그아웃</p>
						<div class="log-out-1bK"></div>
					</button>

					<div class="menu_cate">
						<p class="cate">나의 활동</p>

						<div class="auto-group-3tvm-62R">
							<button class="menuBtn" onclick="location.href='myFunding'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/fundingIcon.png" />
									<p class="item--7Nm">펀딩한 팜</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
							<button class="menuBtn" onclick="location.href='myFunding'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/auctionIcon.png" />
									<p class="item--7Nm">경매한 팜</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>

							<button class="menuBtn" onclick="location.href='myFunding'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/cartIcon.png" />
									<p class="item--7Nm">찜목록</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
							<button class="menuBtn" onclick="location.href='myFunding'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/chatIcon.png" />
									<p class="item--7Nm">쪽지</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
						</div>
					</div>
					<div class="menu_cate">
						<p class="cate">마이 팜머니</p>

						<div class="auto-group-3tvm-62R">
							<button class="menuBtn" onclick="location.href='myFunding'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/chargeIcon.png" />
									<p class="item--7Nm">팜머니 충전</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
							<button class="menuBtn" onclick="usedFarmMoney()">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/paymentIcon.png" />
									<p class="item--7Nm">팜머니 사용 내역</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
							<button class="menuBtn" onclick="depositList()">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/incomeIcon.png" />
									<p class="item--7Nm">정산 내역</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
						</div>
					</div>

					<div class="menu_cate">
						<p class="cate">설정</p>
						<div class="auto-group-3tvm-62R">
							<button class="menuBtn" onclick="passwdChange()">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/pwchageIcon.png" />
									<p class="item--7Nm">비밀번호 변경</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
						</div>
					</div>
				</div>
				<div class="auto-group-sfjb-WBF">
					<div class="info-1Nu">
						<button onclick="location.href='myFunding'" class="pammoney-7Rw">
							<div class="pammoneytext-dv5">
								<img class="pointIcon" src="${cpath }/assets/pointIcon.png" />
								<p class="item--qmF">팜머니</p>
								<p class="pointamount-wpH">50,000P</p>
							</div>
						</button>
						<div class="my-status-RjT">
							<div class="auto-group-xwbk-xDb">
								<button onclick="location.href='myFunding'" class="item--GEH">
									<p class="item--mB3">펀딩</p>
									<p class="item-5-U5T" id="funding_num">0</p>
								</button>

								<button onclick="location.href='myFunding'" class="item--GEH1">
									<p class="item--mB3">경매</p>
									<p class="item-5-U5T" id="auction_num">0</p>
								</button>

								<button onclick="location.href='myFunding'" class="item--GEH">
									<p class="item--mB3">찜</p>
									<p class="item-5-U5T" id="cart_num">0</p>
								</button>
							</div>
							<div class="auto-group-jptk-7g9">
								<div class="group-182-duP">
									<img class="group-135-BAD"
										src="${cpath }/assets/info_accIcon.png" />
									<div class="item--WCV">결제정보 관리</div>
								</div>
								<div class="item--cWR">간편하게 계좌 등록하고, 빠르게 결제하세요!</div>
								<button onclick="location.href='myFunding'" class="group--Gay">
									<div class="item--QhB">계좌 등록</div>
									<img class="group-uP3" src="${cpath }/assets/right_pushAcc.png" />
								</button>
							</div>
						</div>
					</div>
					<!-- ajax -->
					<div id="here"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function usedFarmMoney() {
			console.log("usedFarmMoney");
			$.ajax({
				url : "${cpath}/jaeho/farmList",
				success : function(res) {
					$("#here").html(res);
				}
			});
		}

		function depositList() {
			$.ajax({
				url : "${cpath}/jaeho/depositList",
				success : function(res) {
					$("#here").html(res);
				}
			});
		}

		function passwdChange() {
			$.ajax({
				url : "${cpath}/jaeho/aa",
				success : function(res) {
					$("#here").html(res);
				}
			});
		}
		function addToMyCart() {
			$.ajax({
				url : "${cpath}/mypage/addcart",
				type : "post",
				data : {
					"user_serial_num" : serial_num
				},
				success : function(res) {
					reloadMyCart();
				}
			});
		}
	</script>

	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
</html>