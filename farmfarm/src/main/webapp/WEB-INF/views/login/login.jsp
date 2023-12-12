<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>FarmFarm Login</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet" href="./styles/loginPage.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/LoginFormFarmer.js"></script>
<script type="text/javascript" src="./js/LoginFormUser.js"></script>
<script type="text/javascript" src="./js/FormChangeSubmit.js"></script>

</head>
<script>
	document.addEventListener('keydown', onEnterLogin);

	function onEnterLogin() {
		var keyCode = window.event.keyCode;

		const email = document.getElementById('farmer_email').value;
		const pw = document.getElementById('farmer_pw');

		const u_email = document.getElementById('user_email').value;
		const u_pw = document.getElementById('user_pw');

		var currentForm = document
				.querySelector('.rectangle-98-HoK[style="display: block;"]');

		console
				.log(window.getComputedStyle(document.querySelector('.modal')).display);

		if (keyCode == 13
				&& window.getComputedStyle(document.querySelector('.modal')).display != 'none') {
			// 모달이 떠있다면, 먼저 모달을 닫고 함수를 종료
			console.log('modal on');
			document.querySelector('.modal').style.display = 'none';
			event.preventDefault(); // 이벤트 전파 방지
			return;
		}

		if (keyCode == 13
				&& window.getComputedStyle(document.querySelector('.modal')).display == 'none') { //엔테키 이면
			console.log('form enter');

			if (currentForm.id === 'sloginForm') {
				if (isEmail(u_email)
						&& (u_pw.value.length >= 8 && u_pw.value.length <= 15)) {

					submitForm();

				}

			} else if (currentForm.id === 'floginForm') {
				if (isEmail(email)
						&& (pw.value.length >= 8 && pw.value.length <= 15)) {

					submitForm();

				}
			}
		}
	}
</script>
<body>
	<div class="mainpage--xA9">
		<jsp:include page="basicModal.jsp" />
		<div class="group-165-Tpy">

			<div class="auto-group-f5ed-AzH">
				<div class="auto-group-jda5-7uX">

					<br />
					<p class="item--TCh">
						반갑습니다 <br /> 팜팜입니다
					</p>
					<div class="ellipse-10-XTT"></div>
				</div>
				<div class="auto-group-sjok-3gh">
					<div class="item--C3o">
						<span class="item--C3o-sub-0">팜팜 처음 오셨나요? </span> <span>&nbsp;&nbsp;</span>
						<span class="item--C3o-sub-1">바로 회원가입하기 </span>
					</div>
					<img class="mingcute-right-line-2S9" src="./assets/right-arrow.png" />
				</div>
			</div>

			<div class="auto-group-prd3-k7F">
				<div class="rectangle-97-tDT" onclick="showForm('sloginForm')">
					<p class="item--RMo">서포터로 로그인하기</p>
				</div>
				<div class="group-102-V6m" onclick="showForm('floginForm')">
					<p class="item--RMo">파머로 로그인하기</p>
				</div>

				<form class="rectangle-98-HoK" method="get" id="sloginForm"
					style="display: block;">
					<div class="formmail-Qd3">
						<div class="group-97-JCd">
							<div class="item--DaV">이메일</div>
						</div>
						<input type="text" name="user_email" onkeyup='printEmail()'
							id="user_email" class="group-98-1FT" placeholder="이메일" /> <span
							id="email_check" class="warn_text"> 유효한 이메일 주소를 입력하세요.</span>
					</div>
					<div class="formpwd-Yub">
						<div class="group-97-EGd">
							<div class="item--Mc9">비밀번호</div>
						</div>
						<input type="password" name="user_pw" onkeyup='printPw()'
							id="user_pw" class="group-98-vYm" placeholder="비밀번호" /> <span
							id="pw_check" class="warn_text"> 8~15자 이내로 입력하세요.</span>
					</div>
					<div class="group-107-Axu">
						<div class="item--CPo"
							onclick="location.href='login/findPassword.do/user'">비밀번호
							찾기 ></div>
					</div>
				</form>

				<form class="rectangle-98-HoK" method="get" id="floginForm"
					style="display: none;">
					<div class="formmail-Qd3">
						<div class="group-97-JCd">
							<div class="item--DaV">이메일</div>
						</div>
						<input type="text" name="farmer_email" id="farmer_email"
							onkeyup='f_printEmail()' class="group-98-1FT" placeholder="이메일" />
						<span id="farmer_email_check" class="warn_text"> 유효한 이메일
							주소를 입력하세요.</span>
					</div>
					<div class="formpwd-Yub">
						<div class="group-97-EGd">
							<div class="item--Mc9">비밀번호</div>
						</div>
						<input type="password" name="farmer_pw" id="farmer_pw"
							onkeyup='f_printPw()' class="group-98-vYm" placeholder="비밀번호" />
						<span id="farmer_pw_check" class="warn_text"> 8~15자 이내로
							입력하세요.</span>
					</div>
					<div class="group-107-Axu">
						<div class="item--CPo"
							onclick="location.href='login/findPassword.do/farmer'">비밀번호
							찾기 ></div>
					</div>
				</form>

			</div>
			<div class="auto-group-gnzh-5Ch">
				<button class="group-99-Rvm" disabled type="button" id="login_btn"
					onclick="submitForm()">로그인</button>
			</div>
		</div>
	</div>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/footer.jsp" />
</body>

