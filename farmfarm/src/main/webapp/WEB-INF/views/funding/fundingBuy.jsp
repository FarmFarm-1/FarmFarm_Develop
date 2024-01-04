<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="icon" href="${cpath }/favicon/farmfarmfavicon.png" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>팜팜</title>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
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
<link rel="stylesheet" href="${cpath}/styles/fundingbuy.css" />
</head>
<body>
	<div id="here">
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
									<form id="payForm" action="${cpath}/funding/fundingFinish"
										method="post">
										<div class="line">
											<div>내 펀딩 비율</div>
											<div name="pay">${pay }</div>
											<input class="pay" type="hidden" value="${pay}" name="pay">
										</div>
										<div class="line">
											<div>최종 가격</div>
											<div name="payMoney">${payMoney}</div>
											<input class="payMoney" type="hidden" value="${payMoney}" name="payMoney">
										</div>
										<input type="hidden" id="product_serial_num" class="product_serial_num"
											name="product_serial_num"
											value="${fundingInfo.product_serial_num}">
									</form>
								</div>
							</div>
							<!-- //funding_text -->
						</div>
						<!-- checkbox-pmT -->
						<div class="checkbox-pmT">
							<div class="auto-group-h2nh-jNd">
								<input type="checkbox" id="checkbox1" class="checkbox1">
								<label for="checkbox1" class="agreegroup">주문 내용을 확인했으며,
									펀딩 하는 것에 동의합니다.</label>
							</div>
							<div class="line-54-rrZ"></div>
							<div class="auto-group-ziz3-cKw"></div>
						</div>
						<!-- //checkbox-pmT -->
						<div class="pay_wrap">
							<button id="payButton" class="group-120-aMK"
								onclick="submitForm()">${fundingInfo.funding_amount}
								포인트 결제하기</button>
						</div>
					</div>
					<!-- //do_funding -->
				</div>
			</div>
		</div>
	</div>
	<script>
		function submitForm() {
			let pay = document.querySelector(".pay").value;
			let payMoney = document.querySelector(".payMoney").value;
			let product_serial_num = document.querySelector(".product_serial_num").value;
			$.ajax({
				url: "${cpath}/funding/fundingFinish",
				method: "POST",
				data: {
					"pay" : pay,
					"payMoney" : payMoney,
					"product_serial_num" : product_serial_num
				},
				success: function(res){
					if(res == 1) {
						$.ajax({
							url : "${cpath}/funding/fundingSuccess",
							success: function(res){
								$("#here").html(res);
							}
						});
					} else {
						showModal("펀딩 결과","펀딩에 실패 하였습니다. 다시 시도해 주세요");
					}
				},
				error : function(xhr){s
					if(xhr.responseText == "notEnoughPoint") {
						showModal_success("펀딩 실패","포인트가 부족합니다");
					} else {
						showModal("펀딩 결과","펀딩에 실패 하였습니다. 다시 시도해 주세요");
					}
				}
			});
		}

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
	</div>
</body>