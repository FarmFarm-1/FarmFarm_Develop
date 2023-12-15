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

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />

<link rel="stylesheet" href="${cpath }/styles/mypage_menubar.css" />
<link rel="stylesheet" href="${cpath }/styles/myFundingList.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
	function myFundingList() {
		$.ajax({
			url : "/myPageUser/myFundingList",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
</script>

<body>
	<jsp:include page="${cpath}/WEB-INF/views/header.jsp" />
	<div class="jw-center">
		<div class="mypage--Se9">
			<!-- header -->
			<div class="auto-group-wrk9-we5">
				<div class="menu">
					<div class="userinfo">
						<div class="auto-group-autb-WKo">
							<div class="auto-group-yaf7-cNq">서포터</div>
							<img class="vector-4PF" src="${cpath }/assets/person.png" />
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
							<button class="menuBtn" onclick="myFundingList()">
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
							<button class="menuBtn" onclick="location.href='myFunding'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/paymentIcon.png" />
									<p class="item--7Nm">팜머니 사용 내역</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
							<button class="menuBtn" onclick="location.href='myFunding'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/incomeIcon.png" />
									<p class="item--7Nm">입금 내역</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
						</div>

					</div>

					<div class="menu_cate">
						<p class="cate">설정</p>

						<div class="auto-group-3tvm-62R">
							<button class="menuBtn" onclick="location.href='myFunding'">
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
					<div id="here">

						<div class="mypage--Se9">
							<!-- 고정 -->
							<p class="item--ydo">펀딩한 프로젝트를 확인해보세요.</p>
							<div class="fundinglistheader-H8h">
								<p class="item--CmT">상품 정보</p>
								<p class="item--ufs">펀딩 참여일</p>
								<p class="item--DwT">펀딩 달성률</p>
								<p class="item--juo">결제 포인트</p>
								<p class="item--E5s">나의 지분</p>
								<p class="item--MAV">진행 상태</p>
							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

							<!-- 펀딩 리스트 -->
							<div class="fundinglist1-giZ">

								<img class="tomatoes-55667411280-5Eu"
									src="${cpath }/assets/tomatoes.png" />
								<div class="fundinginfo-B9X">

									<div class="auto-group-anxd-tCM">
										<p class="item--aqs">달달 스테비아 토망고</p>
										<p class="item--UwF">행복농장</p>
										<div class="auto-group-huhf-zPo">
											<img class="mdi-location-v2Z" src="./assets/location.png" />
											<p class="item--3cy">경기 광주</p>
										</div>
									</div>
								</div>

								<p class="fundingdate-9R7">2023.12.10</p>
								<div class="fundingpct-4Y5">70%</div>
								<p class="fundingpay-7WM">30,000p</p>
								<p class="fundingmypercent-djb">2%</p>
								<div class="fundingstate-MQh">펀딩 진행중</div>

							</div>

						</div>

					</div>
				</div>
				<!-- footer -->
			</div>
		</div>
	</div>
	<jsp:include page="${cpath}/WEB-INF/views/footer.jsp" />
</body>
<script>
	/* window.onload = ()=>{
	 const $counter_funding = document.querySelector('#funding_num');
	 const $counter_auction = document.querySelector('#auction_num');
	 const $counter_cart = document.querySelector('#cart_num');
	 const max_funding = 5;
	 const max_auction = 3;
	 const max_cart = 11;
	 setTimeout(()=>counter($counter_funding, max_funding),200);
	 setTimeout(()=>counter($counter_auction, max_auction),200);
	 setTimeout(()=>counter($counter_cart, max_cart),200);
	 }
	 function counter($counter, max){
	 let now = max;
	 const handle = setInterval(() => {
	
	 $counter.innerHTML = Math.ceil(max-now);
	 if(now<1){
	 clearInterval(handle);
	 }
	 const step = now / 10;
	 now -= step;
	 },30);
	 }  */
</script>