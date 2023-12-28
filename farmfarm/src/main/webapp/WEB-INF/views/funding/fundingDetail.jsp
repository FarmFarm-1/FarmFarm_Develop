<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${cpath }/favicon/farmfarmfavicon.png" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>팜팜</title>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700%2C800" />
<link rel="stylesheet" href="${cpath}/styles/fundingdetail.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="${cpath}/WEB-INF/views/header.jsp" />
	<div class="farmfarm_container">
		<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
		<div class="funding_info_right">
			<div class="tit_wrap">
				<div class="tit_1">${fundingInfo.product_name }</div>
			</div>
			<div class="funding_text">${fundingInfo.farm_introduction}</div>
			<div class="participation">
				<span>${fundingInfocnt}</span><span>명 참여</span> <span>D -
					${fundingInfo.dueDay}</span>
			</div>
			<div class="auction_price">
				<div class="ap_text">총 모금액</div>
				<div class="ap_value">
					<fmt:formatNumber value="${fundingInfo.target_total_amount}"
						pattern="#,###" />
					원
				</div>
			</div>
			<div class="detail_info border_green">
				<div class="seller">
					<div class="img_wrap">
						<img src="${cpath}/assets/farmer_icon.png" />
					</div>
					<div class="farmer_name">${fundingInfo.farmer_name }</div>
					<div class="chat_open">
						<img src="${cpath}/assets/chat_icon.png" />
					</div>
				</div>
				<div class="funding_detail">
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
			<div class="funding_info_right_bottom">
				<div class="tit_2">펀딩할 포인트 선택</div>
				<div class="input_group">
					<div class="input_pct">
						<form id="payForm" action="${cpath}/funding/fundingBuy"
							method="post">
							<input list="paylist" type="number" name="pay" id="pay"
								class="item-10-Dam" max="${sumfundingpct}"> <input
								type="hidden" id="product_serial_num" name="product_serial_num"
								value="${fundingInfo.product_serial_num}"> <input
								type="hidden" id="payMoney" name="payMoney" value="${result}">
						</form>
						<datalist id="paylist"></datalist>
					</div>
					<p class="pctText">%</p>
					<div class="Paydiv" id="Paydiv"></div>
				</div>
				<div class="point-show">
					<span id="point">포인트 부족</span>
				</div>
				<div class="bookmark-layer">
					<div class="bookmark-btn">
						<c:set value="${myBookmarkShow}" var="myBookmark" />
						<c:choose>
							<c:when test="${myBookmark == 1}">
								<div class="img_heart_wrap">
									<img id="heart-icon" class="heart-icon filled"
										src="${cpath}/assets/heart_fill.png" />
								</div>
							</c:when>
							<c:otherwise>
								<div class="img_heart_wrap">
									<img id="heart-icon" class="heart-icon"
										src="${cpath}/assets/heart_empty.png" />
								</div>
							</c:otherwise>
						</c:choose>
						<p id="heart-num" class="heart-num">${bookmarkCnt}</p>
					</div>
					<button class="btn_fund" id="btn_fund" onclick="submitForm()"
						disabled>펀딩하기</button>
				</div>
			</div>
		</div>
		<div class="funding_info_left">
			<img class="fd_introducepic"
				src="${fundingInfo.funding_thumb_img_url }"></img>
			<div class="funding_info_left_bottom">
				<div class="detailinfo showstep1">
					<p class="project_story">프로젝트 스토리</p>
					<div class="gradient"></div>
					<img class="fd_prostorypic"
						src="${fundingInfo.funding_product_img_url }"></img>
				</div>

				<div class="btn_open">

					<div class="stroymoregroup">

						<div class="grouptext">
							<p class="text">스토리 더보기</p>
							<img class="fd_greencheck"
								src="${cpath}/assets/fd_greencheck.png" />
						</div>
					</div>
				</div>
				<div class="btn_close hide">
					<div class="stroymoregroup">
						<div class="grouptext">
							<p class="text">스토리 접기</p>
							<img class="fd_greencheck"
								src="${cpath}/assets/fd_greencheck_toggle.png" />
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
		/*더보기 이벤트 리스너*/
		document
				.addEventListener(
						'DOMContentLoaded',
						function() { //DOM 생성 후 이벤트 리스너 등록
							//더보기 버튼 이벤트 리스너
							document
									.querySelector('.btn_open')
									.addEventListener(
											'click',
											function(e) {

												let classList = document
														.querySelector('.detailinfo').classList; // 더보기 프레임의 클래스 정보 얻기
												let contentHeight = document
														.querySelector('.detailinfo > .fd_prostorypic').offsetHeight; //컨텐츠 높이 얻기

												// 더보기
												classList.remove('showstep1');
												classList.add('showstep2');

												document
														.querySelector('.btn_open').classList
														.add('hide');
												document
														.querySelector('.btn_close').classList
														.remove('hide');
												document
														.querySelector('.gradient').classList
														.add('hide');

											});
							document
									.querySelector('.btn_close')
									.addEventListener(
											'click',
											function(e) {

												let classList = document
														.querySelector('.detailinfo').classList; // 더보기 프레임의 클래스 정보 얻기
												let contentHeight = document
														.querySelector('.detailinfo > .fd_prostorypic').offsetHeight; //컨텐츠 높이 얻기

												//접기
												classList.remove('showstep2');
												classList.add('showstep1');
												document
														.querySelector('.btn_close').classList
														.add('hide');
												document
														.querySelector('.btn_open').classList
														.remove('hide');
												document
														.querySelector('.gradient').classList
														.remove('hide');

											});

						});

		let serial_num = "${sessionScope.serial_num}";
		let product_serial_num = "${fundingInfo.product_serial_num}";

		const start = 0.01;
		const end = 100 - "${sumfundingpct}";
		const datalist = document.getElementById("paylist");
		const payInput = document.getElementById("pay");
		const payDiv = document.getElementById("Paydiv");
		const payMoney = "${fundingInfo.target_total_amount}";
		const sumfundingpct = "${sumfundingpct}";
		const fundingbtn = document.getElementById("btn_fund");
		var result = 0;

		for (let value = start; value <= end; value += 0.01) {
			const roundedValue = parseFloat(value.toFixed(2));
			const option = document.createElement("option");
			option.value = roundedValue;
			datalist.appendChild(option);
		}
		payInput.addEventListener("input", function() {
			if (serial_num.substring(0, 2) === "us") {
				let inputValue = parseFloat(payInput.value);
				if (end != 0) {
					if (inputValue >= 0) {
						if (inputValue != 0) {
							if (inputValue > end) {
								showModal("WARNING",
										"입력하신 값이 최대값을 초과하였습니다. <br> 최대 " + end
												+ "까지만 입력 가능합니다.");
								payInput.value = end;
							} else if (payInput.value
									&& inputValue.toFixed(2) != inputValue) {
								showModal("WARNING",
										"소수점 아래 자릿수는 2자리까지만 입력 가능합니다.");
								payInput.value = inputValue.toFixed(2);
							}
							updatePayDiv();
						} else {
							negativePayDiv();
							payDiv.innerHTML = "";
						}
					} else {
						showModal("WARNING", "0원 이하는 구매가 불가능합니다.");
						negativePayDiv();
						payDiv.innerHTML = "";
					}
				} else {
					showModal("펀딩이 불가한 상품입니다.", "다른 상품을 확인하세요.");
				}
			} else {
				showModal("로그인이 필요한 기능입니다.", "서포터 회원으로 로그인 하세요.");
			}
		});

		function updatePayDiv() {
			var user_point = "${user_point}";
			const selectedValue = parseFloat(payInput.value) || 0;
			result = Math.floor(selectedValue * (payMoney / 100));
			const formattedResult = new Intl.NumberFormat('ko-KR')
					.format(result);
			const point = document.querySelector("#point");

			if (user_point >= result) {
				point.style.display = 'none';
				fundingbtn.disabled = false;
				fundingbtn.style.backgroundColor = '#64A346';
				fundingbtn.style.cursor = 'pointer';
			} else {
				point.style.display = 'flex';
				fundingbtn.disabled = true;
				fundingbtn.style.backgroundColor = '#b7b7b7';
				fundingbtn.style.cursor = 'default';
			}
			payDiv.innerHTML = formattedResult + "포인트";
			$("#payMoney").val(result);
		}

		function negativePayDiv() {
			fundingbtn.disabled = true;
			fundingbtn.style.backgroundColor = '#b7b7b7';
			fundingbtn.style.cursor = 'default';
		}

		function submitForm() {
			$.ajax({
				url : "${cpath}/funding/checkAccount",
				method : "post",
				success : function(res) {
					if (res == "success") {
						var form = document.getElementById("payForm");
						form.submit();
					} else {
						alert("계좌를 등록하세요");
					}
				},
				error : function() {
					alert("다시 시도하세요");
				}
			});
		}

		$(".bookmark-btn").click(
				function() {
					console.log(serial_num);
					if (serial_num.substring(0, 2) === "us") {
						let isHeartFilled = $("#heart-icon").toggleClass(
								"filled").hasClass("filled");
						if (isHeartFilled) {
							addToMyCart();
							$("#heart-icon").attr("src",
									"${cpath}/assets/heart_fill.png");
						} else {
							deleteFromMyCart();
							$("#heart-icon").attr("src",
									"${cpath}/assets/heart_empty.png");
						}
					} else {
						showModal("로그인이 필요한 기능입니다.", "서포터 회원으로 로그인 하세요.");
					}
				});

		function addToMyCart() {
			$.ajax({
				url : "${cpath}/mypage/addcart",
				type : "post",
				data : {
					"product_serial_num" : product_serial_num,
					"user_serial_num" : serial_num
				},
				success : function(res) {
					reloadMyCart();
				}
			});
		}

		function deleteFromMyCart() {
			$.ajax({
				url : "${cpath}/mypage/deletecart",
				type : "POST",
				data : {
					"product_serial_num" : product_serial_num,
					"user_serial_num" : serial_num
				},
				success : function(res) {
					reloadMyCart();
				}
			});
		}

		function reloadMyCart() {
			$.ajax({
				url : "${cpath}/mypage/reloadCart",
				type : "post",
				data : {
					"product_serial_num" : product_serial_num
				},
				success : function(res) {
					$("#heart-num").text(res);
				}
			});
		}
	</script>
	<jsp:include page="${cpath}/WEB-INF/views/footer.jsp" />
</body>
</html>
