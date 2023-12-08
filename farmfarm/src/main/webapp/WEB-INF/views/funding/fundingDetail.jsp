<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
								<fmt:formatNumber value="${fundingInfo.target_total_amount}"
									pattern="#,###" />
								포인트
							</p>
						</div>
						<div class="group-101-dQ9">
							<p class="item--kzZ">내 펀딩 비율</p>
							<p class="item-1-sJV">${pay}</p>
						</div>
						<c:set var="totalAmount"
							value="${fundingInfo.target_total_amount/100 * pay}" />
						<div class="group-101-zP7">
							<p class="item--8VK">최종 가격</p>
							<p class="item-10000--rw7">
								<fmt:formatNumber value="${totalAmount}"
									pattern="#,###" />
								포인트
							</p>
						</div>
					</div>
					<div class="checkbox-pmT">
						<div class="auto-group-h2nh-jNd">
							<input type="checkbox" id="checkbox1" class="checkbox1">
							<label for="checkbox1" class="item--wjb">주문 내용을 확인했으며, 펀딩
								하는 것에 동의합니다.</label>
						</div>
						<div class="line-54-rrZ"></div>
						<div class="auto-group-ziz3-cKw"></div>
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
		const payButton = document.getElementById("payButton");
		payButton.disabled = true;

		checkboxCheckbox1.addEventListener('change', updatePayButtonState);

		function updatePayButtonState() {
			payButton.style.backgroundColor = checkboxCheckbox1.checked ? '#64A346'
					: '#b7b7b7';
			payButton.style.cursor = checkboxCheckbox1.checked ? 'pointer'
					: 'default';
			payButton.disabled = checkboxCheckbox1.checked ? false : true;
		}
	</script>
	<%@include file="../headerfooter/footer.jsp"%>
</body>