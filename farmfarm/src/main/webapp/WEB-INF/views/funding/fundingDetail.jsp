<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/펀딩/구매 전 확인/버튼비활성</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Abhaya+Libre+ExtraBold%3A800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A500%2C700%2C800" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/styles/fundingdetail.css" />
</head>
<body>
	<%@include file="../headerfooter/header.jsp"%>
	<div class="body">
		<div class="mainpage--869">
			<div class="auto-group-wh8h-Ezy">
				<p class="item--61b">펀딩하기</p>
				<div class="auto-group-u5ho-Y8V">
					<img class="fd_white"
						src="${pageContext.request.contextPath }/resources/assets/fd_white.png" />
					<div class="group-118-A9s">
						<p class="item--HEV">주문 정보</p>
						<div class="line-25-y7K"></div>
						<div class="group-101-FsT">
							<p class="item--o8H">상품명</p>
							<p class="item--K6d">${fundingInfo.product_name}</p>
						</div>
						<div class="group-110-Hth">
							<p class="item--25b">농장명</p>
							<p class="item--wyF">${fundingInfo.farm_name}</p>
						</div>
						<div class="group-111-gA9">
							<p class="item--DQy">농작물 이름</p>
							<p class="item--KD7">${fundingInfo.product_kind }</p>
						</div>
						<p class="item--EUV">결제 포인트</p>
						<div class="line-25-XyP"></div>
						<div class="group-101-UNq">
							<p class="item--DLR">목표 펀딩 금액</p>
							<p class="item-10000--Xc1">
							<fmt:formatNumber value="${fundingInfo.target_total_amount}" pattern="#,###" />포인트</p>
						</div>
						<div class="group-101-dQ9">
							<p class="item--kzZ">내 펀딩 비율</p>
							<p class="item-1-sJV">${fundingInfo.user_funding_pct}</p>
						</div>
						<div class="group-101-zP7">
							<p class="item--8VK">최종 가격</p>
							<p class="item-10000--rw7">
							<fmt:formatNumber value="${fundingInfo.target_total_amount}" pattern="#,###" />포인트</p>
						</div>
					</div>
					<div class="checkbox-pmT">
						<div class="auto-group-h2nh-jNd">
							<input type="checkbox" id="checkbox1" class="checkbox1">
							<label for="checkbox1" class="item--wjb">주문 내용을 확인했으며, 아래
								내용에 모두 동의합니다.</label>
						</div>
						<div class="line-54-rrZ"></div>
						<div class="auto-group-ziz3-cKw">
							<div class="auto-group-nyff-M2d">
								<input type="checkbox" id="checkbox2" class="checkbox2">
								<label for="checkbox2" class="item-3--B1f">(필수) 개인정보
									수집/이용 동의 보기</label>
							</div>
							<div class="auto-group-dhcq-eA9">
								<input type="checkbox" id="checkbox3" class="checkbox3">
								<label for="checkbox3" class="item--7Jd">(선택) 개인정보 제3자
									제공 동의 보기</label>
							</div>
							<div class="auto-group-je85-S61">
								<input type="checkbox" id="checkbox4" class="checkbox4">
								<label for="checkbox3" class="item--v1B">(필수) 결제대행 서비스
									이용약관 (주)팜팜팜</label>
							</div>
						</div>
					</div>
					<button id="payButton" class="group-120-aMK"
						onclick="location.href='${cpath}/funding/fundingFinish';">${fundingInfo.funding_amount}
						포인트 결제하기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		const checkboxCheckbox1 = document.getElementById("checkbox1");
		const checkboxCheckbox2 = document.getElementById("checkbox2");
		const checkboxCheckbox3 = document.getElementById("checkbox3");
		const checkboxCheckbox4 = document.getElementById("checkbox4");
		const payButton = document.getElementById("payButton");
		payButton.disabled = true;

		checkboxCheckbox1.addEventListener('change', updateAllpayButton);
		checkboxCheckbox2.addEventListener('change', updatePayButtonState);
		checkboxCheckbox3.addEventListener('change', updatePayButtonState);
		checkboxCheckbox4.addEventListener('change', updatePayButtonState);

		function updateAllpayButton() {
			if (checkboxCheckbox1.checked) {
				checkboxCheckbox2.checked = true;
				checkboxCheckbox3.checked = true;
				checkboxCheckbox4.checked = true;
			} else {
				checkboxCheckbox2.checked = false;
				checkboxCheckbox3.checked = false;
				checkboxCheckbox4.checked = false;
			}
			updatePayButtonState();
		}

		function updatePayButtonState() {
			console.log(checkboxCheckbox1.checked);
			if (checkboxCheckbox2.checked == false
					|| checkboxCheckbox3.checked == false
					|| checkboxCheckbox4.checked == false) {
				checkboxCheckbox1.checked = false;
				payButton.style.cursor = 'default';
			} else {
				checkboxCheckbox1.checked = true;
				payButton.style.cursor = 'pointer';
			}

			const allCheckboxesChecked = checkboxCheckbox2.checked
					&& checkboxCheckbox4.checked;
			payButton.style.backgroundColor = allCheckboxesChecked ? '#64A346'
					: '#b7b7b7';
			payButton.disabled = allCheckboxesChecked ? false : true;
		}
	</script>
	<%@include file="../headerfooter/footer.jsp"%>
</body>