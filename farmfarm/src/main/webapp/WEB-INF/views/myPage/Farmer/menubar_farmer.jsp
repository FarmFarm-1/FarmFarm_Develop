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
<title>mypage/파머/나의프로젝트</title>

<link rel="stylesheet" href="${cpath }/styles/mypage_menubar.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.36.0/apexcharts.min.js"></script>
</head>

<script>
	function updateCultivate(){
		
		$.ajax({
			url : "/myPageFarmer/showUpdateCultivate",
			// data :
			// 어떤 상품에서 update 누른건지 ?
			// 상품 시리얼 넘, 상품명 , 위치, 농장명 넘기삼
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
		
	}

	

	function regAuction(){
		
		$.ajax({
			url : "/myPageFarmer/showRegAuction",
			// data :
			// 어떤 상품에서 경매등록을 누른건지 ?
			// 상품 시리얼 넘, 상품명 , 위치, 농장명 넘기삼
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
		
		
	}
	function profit(){
		// ajax -> 입급내역 here.html
		$.ajax({
			url : "/myPageFarmer/profitShare",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	function chat(){
		// ajax -> 입급내역 here.html
		$.ajax({
			url : "/myPageFarmer/chat",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	function changePw(){
		$.ajax({
			url : "/myPageFarmer/changePassword",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	function account(){
		$.ajax({
			url : "/myPageFarmer/accountRegister",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	

</script>

<body>
	<jsp:include page="${cpath }/WEB-INF/views/header.jsp" />
	<div class="jw-center">
		<div class="mypage--Se9">
			<!-- header -->
			<div class="auto-group-wrk9-we5">
				<div class="menu">
					<div class="userinfo">
						<div class="auto-group-autb-WKo">
							<div class="auto-group-yaf7-cNq">파머</div>
							<img class="vector-4PF" src="${cpath }/assets/person.png" />
							<div class="item--ASH-2">
								<p class="item--ASH"></p>
								<p class="item--ASH-1">님</p>
							</div>
						</div>
					</div>
					<button class="logout-QrR" onclick="location.href='/logout'">
						<p class="item--8XX">로그아웃</p>
						<div class="log-out-1bK"></div>
					</button>

					<div class="menu_cate">
						<p class="cate">활동 관리</p>

						<div class="auto-group-3tvm-62R">
							<button class="menuBtn" onclick="location.href='/myPageFarmer'">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/fundingIcon.png" />
									<p class="item--7Nm">나의 프로젝트</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>


							<button class="menuBtn" onclick="profit()">
								<div class="chat-eEH">
									<img class="humbleicons-chat-nLV"
										src="${cpath }/assets/incomeIcon.png" />
									<p class="item--7Nm">입금 내역</p>
									<img class="group-omP" src="${cpath }/assets/right.png" />
								</div>
							</button>
							<button class="menuBtn" onclick="chat()">
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
						<p class="cate">설정</p>

						<div class="auto-group-3tvm-62R">
							<button class="menuBtn" onclick="changePw()">
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
					<div class="mydata-xUm">
						<div class="auto-group-v7t1-s5w">
							<p class="item--bXj">마이 데이터</p>
							<div class="item--KCq">내 프로젝트의 진행상황을 확인해보세요</div>

							<button onclick="account()" class="accountpagebtn-zpm">
								<img class="group-135-hjB"
									src="${cpath }/assets/info_accIcon2.png" />
								<div class="item--RQH">수익 계좌 관리</div>
							</button>

						</div>
						<div class="info1-ieH">
							<img class="auto-group-mtnh-Q1K"
								src="${cpath }/assets/info_cartIcon.png" />
							<div class="item--w1F">찜하기</div>
							<div class="item-123--re1">
								<span class="item-123--re1-sub-0">0 </span> <span
									class="item-123--re1-sub-1">건</span>
							</div>
						</div>
						<div class="info2-hY9">
							<img class="auto-group-mtnh-Q1K"
								src="${cpath }/assets/info_moneyIcon.png" />
							<div class="item--w1F">펀딩 모금액</div>
							<div class="item-123--re1">
								<span class="p-EwP-sub-0">0</span> <span class="p-EwP-sub-1">
								</span> <span class="item-123--re1-sub-1">P</span>
							</div>
						</div>
						<div class="info3-gwo">
							<img class="auto-group-mtnh-Q1K"
								src="${cpath }/assets/info_peopleIcon.png" />
							<div class="item--w1F">경매 참여 인원</div>
							<div class="item-123--re1">
								<span class="item-56--CYm-sub-0">0</span> <span
									class="item-56--CYm-sub-1"> </span> <span
									class="item-123--re1-sub-1">명</span>
							</div>
						</div>
					</div>

					<!-- ajax -->
					<div id="here"></div>
				</div>
			</div>
			<!-- footer -->

		</div>
	</div>
	<jsp:include page="${cpath }/WEB-INF/views/footer.jsp" />
</body>

<script>

var max_cart;
var max_money;
var max_supporter;

window.onload = ()=>{
	
	
	navBarCnt();
	
	
	var $counter_cart = document.querySelector('.item-123--re1-sub-0');
	var $counter_money = document.querySelector('.p-EwP-sub-0');
	var $counter_supporter = document.querySelector('.item-56--CYm-sub-0');
	
	setTimeout(()=>counter($counter_cart, max_cart),200);
	setTimeout(()=>counter($counter_money, max_money),200);
	setTimeout(()=>counter($counter_supporter, max_supporter),200);
	
	
	var curReq = "${sessionScope.MyFarmer}";
	if(curReq==""){
		console.log('그냥접근');
		f2();
	}else{
		console.log('프로젝트로 만들기로 접근')
		f1();
	}
}

	function navBarCnt(){
		// 이제 여기서 ajax로 가서 찜 건수, 펀딩 모금액 ,경매 참여 인원 가지고 와서 전역변수에 다 저장할거임
		// max_cart, max_money, max_supporter
		$.ajax({
			url : "/myPageFarmer/navBarCnt",
			async : false,
			success : function(responseData) {
				max_money = responseData.cntFund
				max_cart = responseData.cntCart
				max_supporter = responseData.cntAuction
				$(".item--ASH").html(responseData.name);
			}
		});
		
		
	}
	
	function counter($counter, max){
		let now = max;
		const handle = setInterval(() => {
			
			$counter.innerHTML = (Math.ceil(max-now)).toLocaleString();
			if(now<1){
				clearInterval(handle);
			}
			var step = now / 10;
			now -= step;
		},30);
	} 
	
	function f2(){
		$.ajax({
			url : "/myPageFarmer/myProject",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	
	function f2(){
		$.ajax({
			url : "/myPageFarmer/myProject",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	
	function f1(){
		$.ajax({
			url : "/myPageFarmer/regPro",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	
</script>