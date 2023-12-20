<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mypage/파머/나의프로젝트/경매하기</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet" href="${cpath }/styles/mypage--nPw.css" />
</head>

<script>

	function goRegAuction(){

		alert('ajax : 경매등록하기 DB');
		$.ajax({
			url : "/myPageFarmer/regAuction",
			type: "POST",
			// data :
			// 어떤 상품에서 경매등록을 누른건지 ?
			// 상품 시리얼 넘, 상품명 , 위치, 농장명 넘기삼
			success : function(responseData) {
				if(responseData === 'success'){
					console.log('성공');
				}
				
			}
		});
	}



</script>

<script>
	function daySet() {
		console.log('dayset');
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
		document.getElementById("deadline").setAttribute("min", today);

	}
	function previewImage(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.imageupload-LVj').css('background-image',
						'url(' + e.target.result + ')');
				$('.vector-1Ly').remove();
				$('.item--YLu').remove();
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	function previewImage2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.imageupload-WDB').css('background-image',
						'url(' + e.target.result + ')');
				$('.vector-z8M').remove();
				$('.item--KwK').remove();
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>




<body>
	<div class="mypage--ro7" onclick = "daySet()">
		<div class="auctionform-YHj">
			<div class="auto-group-d797-4G5">
				<p class="item--z9j">나의 프로젝트 경매 신청하기</p>
				<div class="item--tF7">경작이 완료된 작물을 경매 신청하고 대량 판매해 보세요.</div>
			</div>
			<div class="projectinfo-ACd">
				<div class="fundinginfo-Ho3">
					<div class="tomatoes-55667411280-qpZ"></div>
					<div class="auto-group-cp41-hLy">
						<p class="item--QmB">그래호구마호박고구마</p>
						<p class="item--vUd">고구마무봤나나</p>
						<div class="auto-group-vkim-efX">
							<img class="mdi-location-BQZ" src="./assets/mdi-location-8ah.png" />
							<p class="item--rmb">강원 원주</p>
						</div>
					</div>
				</div>
			</div>
			<div class="line-66-Pf3"></div>
			<div class="line-67-vQ5"></div>
			<div class="line-68-s4R"></div>
			<div class="auto-group-yddf-Qq3">
				<div class="auctionthubimage-X8y">
					<div class="auctionthubimageleft-eDb">
						<p class="item--nah">농산물 이미지</p>
						<p class="item--77B">
							경매를 위한 농산물 이미지를 업로드 해주세요. <br /> 상세 페이지의 최상단에 노출됩니다.
						</p>
					</div>
					<div class="imageupload-LVj"
						onclick="document.getElementById('inputFile').click();">
						<div class="imageuploadicon-GeH">
							<img class="vector-1Ly" src="./assets/vector-GPP.png" />
							<p class="item--YLu">사진 올리기</p>
						</div>
					</div>
					<input type="file" id="inputFile" style="display: none;"
						onchange="previewImage(this)" />
				</div>
				<div class="auctionimage-aoP">
					<div class="auctionimageleft-jAV">
						<p class="item--gbX">농산물 상세 이미지</p>
						<p class="item-5--bTb">
							상세 페이지에 삽일될 이미지를 업도르 해주세요. <br> 농산물의 특징과 상태및 설명이 포함된 긴 이미지
							파일 입니다.<br> 정보를 잘 드러내는 설명식 이미지 파일을 선택해주세요.
						</p>
					</div>
					<div class="auto-group-lyxf-kzh">
						<div class="imageupload-WDB"
							onclick="document.getElementById('inputFile2').click();">
							<div class="imageuploadicon-pjf">
								<img class="vector-z8M" src="./assets/vector-ZR7.png" />
								<p class="item--KwK">사진 올리기</p>
							</div>
						</div>
						<input type="file" id="inputFile2" style="display: none;"
							onchange="previewImage2(this)" />

					</div>


				</div>
				<div class="auctionamount-z1B">
					<div class="auctionamountleft-uP3">
						<p class="item--4Fw">거래량</p>
						<p class="item--mg9">경매 거래량을 입력해 주세요.</p>
					</div>
					<div class="group-185-UqT">
						<input class="rectangle-195-dTT" type="number"></input>
						<div class="kg-izh">kg</div>
					</div>
				</div>
				<div class="auctionprice-e7f">
					<div class="auctionpriceleft-yQq">
						<p class="item--8Hj">시작가</p>
						<p class="item--G93">
							경매 시작가를 입력해 주세요. <br /> 현재 시세보다 저렴하면 더 많은 서포터의 참여율이 올라갑니다.
						</p>
					</div>
					<div class="group-185-tRK">
						<input class="rectangle-195-SBw" type="number"></input>
						<div class="p-xRB">p</div>
					</div>
				</div>
				<div class="auctiondeadline-Gwf">
					<div class="auctionpriceleft-nv1">
						<p class="item--vFX">경매 마감일</p>
						<p class="item--prh">경매 마감일을 설정해주세요.</p>
					</div>
					<input class="group-185-ut9" type="date" id="deadline"></input>
				</div>
			</div>
			<div class="auctionpushbtn-YgD" onclick="goRegAuction()">경매 신청하기</div>
		</div>
	</div>
</body>
</html>