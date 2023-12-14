<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/펀딩/구매 전 확인/버튼비활성</title>
<c:set value="${pageContext.request.contextPath}" var="cpath"/>
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
	href="${cpath}/styles/fundingbuy.css" />
</head>
<body>
	<jsp:include page="${cpath}/WEB-INF/views/header.jsp" />
	<div class="body">
		<div class="mainpage--869">
			<div class="mainpage">
				<p class="fundingtext">펀딩하기</p>
				<div class="graybackground">
					<!-- do_funding -->
					<div class="do_funding">
						<!-- funding_text_wrap  -->
						<div class="funding_text_wrap">
							<div class="funding_text">
								<div class="title">주문 정보</div>
								<div class="inner">
									<div class="line">
										<div>상품명</div>
										<div>${fundingInfo.product_name}</div>
									</div>
									<div class="line">
										<div>농장명</div>
										<div>${fundingInfo.farm_name}</div>
									</div>
									<div class="line">
										<div>농작물 이름</div>
										<div>${fundingInfo.product_kind}</div>
									</div>
								</div>
							</div>
							<!-- //funding_text -->
							<!-- funding_text -->
							<div class="funding_text">
								<div class="title">결제 포인트</div>
								<div class="inner">
									<div class="line">
										<div>전체 펀딩 목표 금액</div>
										<div>${fundingInfo.target_total_amount}</div>
									</div>
									<div class="line">
										<div>내 펀딩 비율</div>
										<div>${pay }</div>
									</div>
									<div class="line">
										<div>최종 가격</div>
										<div>${payMoney}</div>
									</div>
								</div>
							</div>
							<!-- //funding_text -->
						</div>
						<!-- checkbox-pmT -->
						<div class="checkbox-pmT">
							<div class="auto-group-h2nh-jNd">
								<input type="checkbox" id="checkbox1" class="checkbox1">
								<label for="checkbox1" class="agreegroup">주문 내용을 확인했으며, 펀딩
									하는 것에 동의합니다.</label>
							</div>
							<div class="line-54-rrZ"></div>
							<div class="auto-group-ziz3-cKw"></div>
						</div>
						<!-- //checkbox-pmT -->
						<div class="pay_wrap">
							<button id="payButton" class="group-120-aMK"
								onclick="location.href='${cpath}/funding/fundingFinish';">${fundingInfo.funding_amount}
								포인트 결제하기</button>
						</div>
					</div>
					<!-- //do_funding -->
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
	<jsp:include page="${cpath}/WEB-INF/views/footer.jsp" />
</body>