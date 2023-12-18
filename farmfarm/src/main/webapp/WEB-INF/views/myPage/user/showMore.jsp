<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더보기</title>
<link rel="stylesheet" href="${cpath }/styles/cart.css" />
<link rel="stylesheet" href="${cpath }/styles/orderpayPage02.css" />
</head>
<body>

	<br>
	<div class="method">
		<div class="delivery">
			<input id="radio_dlivery" name="radio_dlivery" type="radio"
				onclick="delivery_radio_function(event)" value="delivery"
				name="delivery" checked="checked" /> <label for="delivery"
				class="method_delivery">배달</label> <input id="radio_dlivery"
				name="radio_dlivery" type="radio"
				onclick="delivery_radio_function(event)" value="pick_up"
				name="delivery" /> <label for="pick_up" class="method_pick_up">픽업</label>
			<div class="address">
				<b class="bord1">동네</b>
				 <div class="address2">${member.member_address }</div>
			</div>
		</div>

	</div>
	<br>

	<div class="cart">
		<c:forEach items='${cart_list}' var="cart">
			<div
				id='${cart.key}_${cart.value[0].store_is_pickup && cart.value[0].store_is_delivery?"cart_dispaly_all":cart.value[0].store_is_pickup?"cart_dispaly_pickup":"cart_dispaly_delivery"}'
				class='${cart.value[0].store_is_pickup && cart.value[0].store_is_delivery?"cart_dispaly_all": cart.value[0].store_is_pickup?"cart_dispaly_pickup":"cart_dispaly_delivery"}'>
				<%-- <div class='${cart.value[0].store_name}'> --%>
				<div class="cart_title">
					<input type="radio" name="titla_radio" id="${cart.key}_checkbox"
						onclick="checkbox_all_function(event)">
					<div class="cart_title_font">${cart.key}</div>
					<div class="cart_close_font">X</div>
				</div>
				<c:forEach items='${cart.value}' var="menu">
					<div class="cart_content">
						<input type="checkbox" class="menu_select"
							onclick="checkbox_function(event)"
							id="${cart.key}_${menu.menu_name}_check"> <img
							src="${path}/resources/images/025logo.png" class="img"
							width="137px" height="144" />
						<div class="menu_name">
							<input value="${menu.menu_name}" class="${cart.key}"
								readonly="readonly">
						</div>
						<div class="option">
							<div class="coupon">쿠폰 적용</div>
							<div class="price_content">
								<input value="${menu.menu_price}"
									id="${cart.key}_${menu.menu_name}_price" readonly="readonly">
							</div>
							<input value="${menu.menu_discount_price}"
								id="${cart.key}_${menu.menu_name}_discount_price" type="hidden">
							<div class="price_content">
								<input value="${menu.cart_product_count}"
									id="${cart.key}_${menu.menu_name}_cnt" min="0" type="number">
							</div>
						</div>
						<div class="close_font">X</div>
					</div>

				</c:forEach>

				<div class="cart_price_content">
					<div class="total_price">
						<div class="cart_proce_font">상품금액</div>
						<div class="price_content">
							<input type="number" id="${cart.key}_total_price"
								readonly="readonly" value="${total_cart[cart.key].total_price }">원
						</div>
					</div>
					<div class="total_price">
						<div class="cart_proce_Operator">-</div>
					</div>
					<div class="total_price">
						<div class="cart_proce_font">할인금액</div>
						<div class="price_content_color_red">
							<input type="number" id="${cart.key}_total_discount_price"
								readonly="readonly"
								value="${total_cart[cart.key].total_discount_price}">원
						</div>
					</div>
					<div class="delivery_fee">
						<div class="total_price">
							<div class="cart_proce_Operator">+</div>
						</div>
						<div class="total_price">
							<div class="cart_proce_font">배송비</div>
							<div class="price_content">
								<input type="number" id="${cart.key}_delivery_fee"
									readonly="readonly"
									value="${total_cart[cart.key].store_delivery_fee }">원

							</div>
						</div>
					</div>
					<div class="total_price">
						<div class="cart_proce_Operator">=</div>
					</div>
					<div class="total_price">
						<div class="cart_proce_font">주문금액</div>
						<div class="price_content">
							<input type="number" id="${cart.key}_total" readonly="readonly"
								value="${total_cart[cart.key].total }">원
						</div>
					</div>
				</div>
			</div>
			<br>
		</c:forEach>
	</div>

	<div class="sidebar">
		결제 정보
		<div>
			총 주문 상품 수 <input type="number" id="payment_total_cnt"
				readonly="readonly" value="0"><br> 총 상품금액 <input
				type="number" id="payment_total_price" readonly="readonly" value="0"><br>
			총 할인금액 <input type="number" id="payment_total_dis_price"
				readonly="readonly" value="0"><br>
			<div id="payment_fee">
				총 배송비 <input type="number" id="payment_total_fee"
					readonly="readonly" value="0"><br>
			</div>
		</div>

		<div>
			총 결제금액 <input type="number" id="payment_total" readonly="readonly"
				value="0">
		</div>
		<input type="button" value="주문하기" id="payment_button">
	</div>

	<div class="containermiddle">
		<!-- <div class="middle_bar"> -->
		<div class="middele_box">
			<div class="text1">주문 결제</div>
			<div class="text2">
				<a href="${path}/cart.do">01 장바구니 ></a><a
					href="${path}/paymentInsert.do"> 02 주문/결제 ></a><a> 03 결제완료</a>
			</div>
			<div class="front">
				<img class="pay01" id="pay01" src="/app/resources/images/pay01.png"
					alt="pay01img">
			</div>
			<div class="back">
				<img class="pay02" id="pay02" src="/app/resources/images/pay02.png"
					alt="pay02img">
			</div>
		</div>
	</div>

	<div class="method">
		<div class="delivery">
			<input id="radio_dlivery" name="radio_dlivery" type="radio"
				value="delivery" name="delivery"
				${get_id.equals("delivery")?"checked='checked'":""}
				onclick="return false;" /> <label for="delivery"
				class="method_delivery">배달</label> <input id="radio_dlivery"
				name="radio_dlivery" type="radio" value="pick_up" name="delivery"
				${!get_id.equals("delivery")?"checked='checked'":""}
				onclick="return false;" /> <label for="pick_up"
				class="method_pick_up">픽업</label>
		</div>
		<div class="address">
			<b>동네</b><br> ${member.member_address}
		</div>
	</div>


	<div class="deliveryInfo">
		<br> <br> <br>
		<form class="form-grup-delivery" id="deliveryform">
			<div class="form-grup-1" id="delivery_div">
				<div class="select1">
					<div>
						<p>1.배달 정보를 입력해주세요.</p>
					</div>
					<div>
						<lable>배송지선택 </lable>
						<select id="select_options" onchange="getselect(event)">
							<option>배송지를 선택해주세요.</option>
							<c:forEach var="alist" items="${member_address_list}">
								<option name="select_address"
									value="${alist.member_address_name}">${alist.member_address_name}</option>
							</c:forEach>
						</select>
					</div>
					<!--  위도 경도 정보  -->
					<input id="address_latitude" name="address_latitude"
						value="${alist.member_address_latitude }" style="display: none;" />
					<input id="address_longitude" name="address_longitude"
						value="${alist.member_address_longitude}" style="display: none;" />
					<div>
						<div>
							<lable>전화 번호</lable>
							<small id="phone1"></small> - <small id="phone2"></small> - <small
								id="phone3"></small>
						</div>
						<input type="tel" id="phone" name="phone"
							placeholder="예: 010-123-4567" readonly style="display: none;"
							value="${ login_member_phone}">
					</div>
					<div>
						<label>이름</label> <input type="text" id="name" name="name"
							value="${login_member_id}" readonly>
					</div>
					<div>
						주소
						<c:forEach items="${member_address_map}" var="member_address">
							<div id="${member_address.key}" style="display: none;"
								class="key">
								<label> 주소 </label> <input type="text" id="address1"
									name="addresspay"
									value="${member_address.value.member_address }" readonly><br>
								<input type="text" id="address2" name="addresspay"
									value="${member_address.value.member_address_detail }" readonly>
							</div>
						</c:forEach>
					</div>
					<input type="button" id="add_address_btn" name="add_address_btn"
						value="주소 추가">
				</div>

			</div>
			<div class="form-grup-2"></div>
			<fieldset>
				<p>2...요청 사항을 입력해 주세요</p>
				<input type="text" id="request_del" name="request" value="요청사항작성란">
			</fieldset>
			<div class="form-grup-3"></div>
			<fieldset>
				<p>3...할인 혜택을 받아보세요</p>
				<label> 쿠 폰 </label> <select>
					<option>1.할인 쿠폰</option>
					<option>2.할인 쿠폰</option>
					<optinon>3.할인 쿠폰</optinon>
				</select> <br>
				<lable> /////포인트 / 마일리지 </lable>
				<div>
					<lable> 포인트</lable>
					<input type="text" id="point" name="point">
					<lable>원</lable>
					<input type="text" id="readpoint" name="readpoint"
						value="가지고있는 포인트 값" readonly> <input type="button"
						id="usepoint" name="usepoint" value="마일리지 모두 사용">
				</div>
				<div>

					<input type="text" id="mileage" name="mileage">
					<lable>원</lable>
					<input type="text" id="readmileage" name="readmileage"
						value="가지고있는 마일리지 값" readonly> <input type="button"
						id="usemileage" name="usemileage" value="마일리지 모두 사용">
				</div>
			</fieldset>
			<div class="form-grup-4"></div>
			<fieldset>
				<p>4...결제 수단을 선택 해주세요</p>
				<br>
				<c:forEach var="paymentTpye" items="${payment_type_use}">
					<input type='radio' name='paymethod2' checked="checked"
						onclick="payment_type_function(event)"
						value="${paymentTpye.payment_type_seq}" />${paymentTpye.payment_type}
		     	   </c:forEach>
			</fieldset>
		</form>
		<!-- --------------------------------------------배달 픽업 form 구분  ------------------------------------ -->
		<form class="form-grup-pickup" id="pickup-form">
			<div class="form-grup-1" id="pickup_div">
				<div>
					<p>1.주문자의 정보를 확인 해주 세요</p>
				</div>
				<div>
					<lable>전화 번호</lable>
					<input type="tel" id="phoneNumber" name="phoneNumber"
						class="phone-input" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
						placeholder="예: 010-123-4567" readonly
						value="${ login_member_phone}">
					<!-- <small>형식: 010-123-4567</small> -->
					<%-- <p>${login_member_phone}</p> --%>
				</div>
				<div>
					<label>이름</label> <input type="text" id="name" name="name"
						value="${login_member_id}" readonly>
				</div>
				<div>
					주소
					<c:forEach items="${member_address_map}" var="member_address">
						<div id="${member_address.key}" style="display: none;" class="key">
							<label> 주소 </label> <input type="text" id="address1"
								name="address" value="${member_address.value.member_address }"
								readonly><br> <input type="text" id="address2"
								name="address"
								value="${member_address.value.member_address_detail }" readonly>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="form-grup-2"></div>
			<fieldset>
				<p>2...요청 사항을 입력해 주세요</p>
				<h1>TO.사장님</h1>
				<input type="text" id="request" name="request" value="요청사항작성란">
			</fieldset>
			<div class="form-grup-3"></div>
			<fieldset>
				<p>3...할인 혜택을 받아보세요</p>
				<label> 쿠 폰 </label> <select>
					<option>1.할인 쿠폰</option>
					<option>2.할인 쿠폰</option>
					<optinon>3.할인 쿠폰</optinon>
				</select> <br>
				<lable> /////포인트 / 마일리지 </lable>
				<div>
					<lable> 포인트</lable>
					<input type="text" id="point" name="point">
					<lable>원</lable>
					<input type="text" id="readpoint" name="readpoint"
						value="가지고있는 포인트 값" readonly> <input type="button"
						id="usepoint" name="usepoint" value="마일리지 모두 사용">
				</div>
				<div>

					<input type="text" id="mileage" name="mileage">
					<lable>원</lable>
					<input type="text" id="readmileage" name="readmileage"
						value="가지고있는 마일리지 값" readonly> <input type="button"
						id="usemileage" name="usemileage" value="마일리지 모두 사용">
				</div>
			</fieldset>
			<div class="form-grup-4">
				<fieldset>
					<p>5...결제 수단을 선택 해주세요</p>
					<br>
					<c:forEach var="paymentTpye" items="${payment_type_use}">
						<input type='radio' name='paymethod2'
							onclick="payment_type_function(event)"
							value="${paymentTpye.payment_type_seq}" />${paymentTpye.payment_type}
		     	   </c:forEach>
				</fieldset>
			</div>
		</form>
	</div>
	<!--    -----------------------------------------------모달  ------------------------------------------------------------- -->
	<div id="add_address_form" class="hidden">
		<div id="add_adress_content">
			<!-- <form action="addmoreAddress.do" method="post"> -->
			<div class="form-group">
				<label>배송지 이름 추가</label><br> <input type="text"
					name="addressName" id="addressName">
			</div>

			<div class="form-group">
				<label>주소</label> </br> <input type="text" name="postcode"
					class="input-id" id="postcode" placeholder="Address" readonly /> <input
					type="button" onclick="get_address()" value="주소 찾기" required /> <br>
			</div>
			<div class="form-group">
				<label>도로명 주소</label></br> <input type="text" name="address" id="address"
					class="input-id" placeholder="Street name address" readonly
					required />
			</div>

			<div class="form-group">
				<label>상세 주소</label></br> <input type="text" name="address_detail"
					class="input-id" id="detail_address" placeholder="Detailed Address"
					required /><br>
			</div>
			<input id="address_latitude" name="address_latitude"
				style="display: none;" /> <input id="address_longitude"
				name="address_longitude" style="display: none;" />
			<div id="moda-form-butn">
				<input type="button" id="alter" name="alter" value="추가하기">
				<button id="add_address_close_btn">닫기</button>
			</div>
			<!-- </form> -->
		</div>
	</div>

</body>
</html>