<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>fundingList</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700%2C800" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/styles/fundinglist.css" />
</head>
<body>
	${fundingInfo.farm_name } ${fundingInfo.farm_introduction }
	<%@include file="../headerfooter/header.jsp"%>
	<div class="mainpage--xso">
		<div class="auto-group-2zxm-u2M">
			<div class="material-symbols-bookmark-outline-ZrD"></div>
			<!--<img class="fd_introducepic" src="${pageContext.request.contextPath }/resources/assets/fd_introducepic.png" />-->
			<div class="fd_introducepic"></div>
			<p class="kg-7FT">${fundingInfo.product_name }</p>
			<p class="item-577--zq3">
				<span class="item-577--zq3-sub-0">577</span> <span
					class="item-577--zq3-sub-1">명 참여</span>
			</p>
			<div class="group-90-NUD">D - 14</div>
			<p class="item-33207900-mFT">
				<span class="item-33207900-mFT-sub-0">총 모금액</span> <span
					class="item-33207900-mFT-sub-1"><fmt:formatNumber
						value="${fundingInfo.target_total_amount}" pattern="#,###" /></span> <span
					class="item-33207900-mFT-sub-2">원 </span>
			</p>
			<p class="item--Yow">${fundingInfo.farm_introduction }</p>
			<img class="fd_farmer_pic"
				src="${pageContext.request.contextPath }/resources/assets/fd_farmer_pic.png" />
			<div class="rectangle-104-SH3"></div>
			<p class="item--y25">프로젝트 스토리</p>
			<div class="material-symbols-bookmark-outline-SRT"></div>
			<div class="rectangle-70-xeh"></div>
			<div class="ellipse-22-7R7"></div>
			<p class="item--4Sq">${fundingInfo.farmer_name }</p>
			<p class="item--kuK">농장명</p>
			<p class="item--TYq">${fundingInfo.farm_name }</p>
			<p class="item--Qv1">농장 주소</p>
			<p class="item-71-wyo">${fundingInfo.farm_address }</p>
			<p class="item--Wi9">농장 면적</p>
			<p class="item-2-1yf">
				<fmt:formatNumber value="${fundingInfo.farm_square_footage}"
					pattern="#,###" />
				평
			</p>
			<p class="item--cFP">농작물 이름</p>
			<p class="item--82h">${fundingInfo.product_kind }</p>
			<p class="item--tTo">재배 예정일</p>
			<p class="item-20220909-cyT">${fundingInfo.expected_planting_date }</p>
			<p class="item--NNy">수확 예정일</p>
			<p class="item-20230909-vjF">${fundingInfo.expected_harvest_date }</p>
			<p class="item--TvD">파머 연락처</p>
			<p class="item-010-1234-5678-2nH">${fundingInfo.farmer_phone }</p>
			<div class="rectangle-122-8qK"></div>
			<div class="group-91-3hP">
				<p class="item--n9B">스토리 더보기</p>
				<img class="fd_greencheck"
					src="${pageContext.request.contextPath }/resources/assets/fd_greencheck.png" />
			</div>
			<div class="group-162-Cn9">
				<p class="item--XJd">펀딩할 포인트 선택</p>
				<div class="auto-group-sfb3-AsP">
					<div class="input_pct">
						<input list="paylist" name="pay" id="pay" class="item-10-Dam">
						<datalist id="paylist"></datalist>
					</div>
					<div class="Paydiv" id="Paydiv"></div>
				</div>
				<div class="auto-group-cwk5-WCV">
					<div class="auto-group-rfsm-r1T">
						<p class="item-1615-Miu">1,615</p>
						<div class="rectangle-90-pcV"></div>
						<img class="fd_heart"
							src="${pageContext.request.contextPath }/resources/assets/fd_heart.png" />
					</div>
					<button class="frame-16-4mj"
						onclick="location.href='${cpath}/funding/fundingDetail';">펀딩하기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		const start = 0.01;
		const end = 100;
		const datalist = document.getElementById("paylist");
		const payInput = document.getElementById("pay");
		const payDiv = document.getElementById("Paydiv");
		const payMoney = ${fundingInfo.target_total_amount};

		// Generate options within the specified range
		for (let value = start; value <= end; value += 0.01) {
			const roundedValue = parseFloat(value.toFixed(2)); // Round to two decimal places
			const option = document.createElement("option");
			option.value = roundedValue;
			datalist.appendChild(option);
		}

		// Listen for input value change
		payInput.addEventListener("input", updatePayDiv);

		function updatePayDiv() {
			const selectedValue = parseFloat(payInput.value) || 0;
			const result = Math.floor(selectedValue * (payMoney / 100));
			payDiv.textContent = result + "포인트";
		}
	</script>
	<%@include file="../headerfooter/footer.jsp"%>
</body>