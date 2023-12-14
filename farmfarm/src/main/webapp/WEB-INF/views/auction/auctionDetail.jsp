<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/styles/jaeho.css" />
</head>
<title>AuctionList</title>
</head>
<body>
	<%@include file="../headerfooter/header.jsp"%>
	<div class="farmfarm_container">
		<div class="funding_detail"></div>
		<div class="funding_info_right">
			<div class="tit_wrap">
				<div class="tit">${fundingInfo.product_name }</div>
			</div>
			<p class="funding_text">${fundingInfo.farm_introduction }</p>
			<div class="participation">
				<span>577명 참여</span> <span>D - 14</span>
			</div>
			<div class="auction_price">
				총 모금액
				<fmt:formatNumber value="${fundingInfo.target_total_amount}"
					pattern="#,###" />
				원
			</div>
			<div class="detail_info border_green">
				<div class="seller">
					<div class="img_wrap"></div>
					<%-- <img src="${pageContext.request.contextPath }/resources/assets/fd_farmer_pic.png" alt="profile"/> --%>

					${fundingInfo.farmer_name } <span class="chat_open"></span>
				</div>
				<div class="auction_detail">
					<div>
						<div class="detail_tit">농장명</div>
						<div class="content">${fundingInfo.farm_name }</div>
					</div>
					<div>
						<div class="detail_tit">농장 주소</div>
						<div class="content">${fundingInfo.farm_address }</div>
					</div>
					<div>
						<div class="detail_tit">농장 면적</div>
						<div class="content">
							<fmt:formatNumber value="${fundingInfo.farm_square_footage}"
								pattern="#,###" />
							평
						</div>
					</div>
					<div>
						<div class="detail_tit">농작물 이름</div>
						<div class="content">${fundingInfo.product_kind }</div>
					</div>
					<div>
						<div class="detail_tit">재배 예정일</div>
						<div class="content">${fundingInfo.expected_planting_date }</div>
					</div>
					<div>
						<div class="detail_tit">수확 예정일</div>
						<div class="content">${fundingInfo.expected_harvest_date }</div>
					</div>
					<div>
						<div class="detail_tit">파머 연락처</div>
						<div class="content">${fundingInfo.farmer_phone }</div>
					</div>
				</div>
			</div>
<!-- 			<div class="amount_info border_green">
				<div class="auction_detail">
					<div>
						<div class="detail_tit">출하량</div>
						<div class="content">500kg</div>
					</div>
					<div>
						<div class="detail_tit">단위당 단가&#40;경매시작가&#41;</div>
						<div class="content">800,000원</div>
					</div>
				</div>
			</div> -->
<!-- 			<div class="provide_price border_green">
				<div>시세(api) 활용해서 값의 차이 제공</div>
			</div> -->
<!-- 			<div class="auction_list border_green">
				<div class="list_tit">입찰목록</div>
				<div class="auction_group">
					<div class="person on">
						<span>배재호</span> <span>800,000원</span> <span>23-11-23
							11:13:55</span>
					</div>
					<div class="person">
						<span>배재호</span> <span>800,000원</span> <span>23-11-23
							11:13:55</span>
					</div>
					<div class="person">
						<span>배재호</span> <span>800,000원</span> <span>23-11-23
							11:13:55</span>
					</div>
				</div>
			</div> -->
			<div class="tit">경매할 포인트 입력</div>
			<div class="insert_point border_green">
				<input type="text" id="inpPoint" /> <span>원</span>
			</div>
			<div class="btn_wrap">
				<button class="btn_like">1,615</button>
				<button class="btn_bid" onclick="submitForm()">입찰하기</button>
			</div>
		</div>
		<div class="funding_info_left">
			<div class="fd_introducepic"></div>
			<div class="funding_info_left_bottom">
			<p class="project_story">프로젝트 스토리</p>
			<div class="fd_prostorypic"></div>
			<div class="stroymoregroup"></div>
			<div class="grouptext">
				<p class="text">스토리 더보기</p>
				<img class="fd_greencheck"
					src="${pageContext.request.contextPath }/resources/assets/fd_greencheck.png" />
			</div>
			</div>
			<div class="group-162-Cn9">
				<p class="item--XJd">펀딩할 포인트 선택</p>
				<div class="auto-group-sfb3-AsP">
					<div class="input_pct">
						<form id="payForm" action="${cpath}/funding/fundingDetail"
							method="post">
							<input list="paylist" type="number" name="pay" id="pay"
								class="item-10-Dam" max="100">
							<!-- select, textarea,  -->
						</form>
						<datalist id="paylist"></datalist>
					</div>
					<div class="Paydiv" id="Paydiv"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
		document
				.querySelector("#inpPoint")
				.addEventListener(
						"keyup",
						function(e) {
							let value = e.target.value;
							value = Number(value.replaceAll(',', ''));

							if (isNaN(value)) {
								document.querySelector("#inpPoint").value = 0;
							} else {
								const formatValue = value
										.toLocaleString("ko-KR");
								document.querySelector("#inpPoint").value = formatValue;
							}
						})
		const start = 0.01;
		const end = 100;
		const datalist = document.getElementById("paylist");
		const payInput = document.getElementById("pay");
		const payDiv = document.getElementById("Paydiv");
		const payMoney = ${fundingInfo.target_total_amount};
		var result = 0;

		for (let value = start; value <= end; value += 0.01) {
			const roundedValue = parseFloat(value.toFixed(2));
			const option = document.createElement("option");
			option.value = roundedValue;
			datalist.appendChild(option);
		}

		payInput.addEventListener("input", function() {
			let inputValue = parseFloat(payInput.value);
			if (inputValue > end) {
				alert("입력하신 값이 최대값을 초과하였습니다. 최대 " + end + "까지만 입력 가능합니다.");
				payInput.value = end;
			} else if (payInput.value && inputValue.toFixed(2) != inputValue) {
				alert("소수점 아래 자릿수는 2자리까지만 입력 가능합니다.");
				payInput.value = inputValue.toFixed(2);
			}
			updatePayDiv();
		});

		function updatePayDiv() {
			const selectedValue = parseFloat(payInput.value) || 0;
			result = Math.floor(selectedValue * (payMoney / 100));
			const formattedResult = new Intl.NumberFormat('ko-KR')
					.format(result);
			payDiv.innerHTML = formattedResult + "포인트";
		}
	</script>
	<script>
		function submitForm() {
			var form = document.getElementById("payForm");
			form.submit();
		}
	</script>
	<%@include file="../headerfooter/footer.jsp"%>
</body>
</html>
