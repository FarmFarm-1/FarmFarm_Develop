<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/회원가입/파머/정보입력</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet" href="./styles/signup2.css" />
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	document.addEventListener('keydown', onEnterLogin);

	function onEnterLogin() {
		var keyCode = window.event.keyCode;

		if (keyCode == 13
				&& window.getComputedStyle(document.querySelector('.modal')).display != 'none') {
			// 모달이 떠있다면, 먼저 모달을 닫고 함수를 종료
			console.log('modal on');
			document.querySelector('.modal').style.display = 'none';
			event.preventDefault(); // 이벤트 전파 방지
			return;
		}

	}
</script>

<script type="text/javascript">
	//	const signUpBtn = document.getElementById('signUpBtn');

	var email = document.getElementById('email');
	var emailCheck = document.getElementById('email_check');
	var cerNum = document.getElementById('cerNum');

	var email_check_btn = document.getElementById('email_check_btn');
	var check_cer_num_btn = document.getElementById('check_cer_num_btn');

	var password = document.getElementById('password');
	var passwordCheck = document.getElementById('passwordCheck');
	var name = document.getElementById('name');
	var signUpBtn = document.getElementById('signUpBtn');
	var cerNum_check = document.getElementById('cerNum_check_text');
	var password_check_text1 = document.getElementById('password_check_text');
	var password_check_text2 = document.getElementById('password_check_text2');

	signUpBtn.disabled = true;

	var email_check_boolean = false;
	var cerNum_check_boolean = false;

	function s_signup3() {

		$.ajax({
			type : "POST",
			url : "/s_signup3.do",
			data : {
				"email" : $("#email").val(),
				"password" : $("#password").val(),
				"name" : $("#name").val()
			},
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}

	function email_check() {

		$.ajax({
			url : "/emailCheck.do",
			type : "POST",
			data : {
				"email" : $("#email").val()
			},
			success : function(result) {
				if (result == "") {
					//인증 번호 전송
					/* alert('인증번호를 전송했습니다.'); */
					document.querySelector('.modal').style.display = 'flex'; //모달을 띄위는 코드
					document.querySelector('#signUpModal .item--MHF').textContent = "인증번호를 전송했습니다.";
					document.querySelector('#signUpModal .id-2-RY1').textContent = "이메일을 확인해주세요.";
					
					send_cer_num();
					email_check_boolean = true;
					check_cer_num_btn.style.display = 'flex';
				} else {
					// 모달 출력
					/* alert('이미 존재하는 이메일입니다.'); */
					document.querySelector('.modal').style.display = 'flex'; //모달을 띄위는 코드
					document.querySelector('#signUpModal .item--MHF').textContent = "이미 존재하는 이메일입니다.";
					document.querySelector('#signUpModal .id-2-RY1').textContent = "이메일을 다시 입력해주세요.";

					email_check_boolean = false;

				}
			}
		});

	}

	function send_cer_num() {

		$.ajax({
			url : "/sendCerNum.do",
			type : "POST",
			data : {
				"email" : $("#email").val()
			},
			success : function(result) {
				console.log(result);
				// 지금 인증번호가 왔는데
				cerNum = result;

			}
		});

	}

	function check_cer_num() {
		//const cerNum_check = document.getElementById('cerNum_check_text');
		var inputCerNum = $("#cerNum").val(); //입력한 인증번호
		console.log(inputCerNum);
		console.log(cerNum);

		if (inputCerNum == cerNum) {
			console.log('성공');
			// 인증 성공 warn text 2 flex
			//인증성공하면 초로객으로 인증성공 문구 보이게함
			cerNum_check.style.visibility = 'visible';
			document.getElementById('cerNum').disabled = true;
			//isCerSuccess = true;
			cerNum_check_boolean = true;
			allInputCheck();
		} else {
			document.querySelector('.modal').style.display = 'flex'; //모달을 띄위는 코드
			console.log(document.querySelector('#signUpModal .item--MHF'));
			document.querySelector('#signUpModal .item--MHF').textContent = "인증을 실패하였습니다.";
			document.querySelector('#signUpModal .id-2-RY1').textContent = "올바른 인증번호를 입력해주세요.";
			
			cerNum_check_boolean = false;
			console.log('불일치');
			// modal 인증 실패
			/* alert('인증 실패하였습니다. 다시 확인해주세요'); */
			//이거 안나옴ㅠ
			
			
			

		}
	}

	function allInputCheck() {
		var name = document.getElementById('name');
		console.log(email.value);
		console.log(password.value);
		console.log(name.value);

		/* 		const email = document.getElementById('email');
		 const cerNum = document.getElementById('cerNum');
		 const password = document.getElementById('password');
		 const passwordCheck = document.getElementById('passwordCheck');
		 const name = document.getElementById('name');
		 const signUpBtn = document.getElementById('signUpBtn'); */

		//input이 입력이 하나라도 안되면 버튼 비활성화
		/* if (email_check_boolean && cerNum_check_boolean && password.value!="" && passwordCheck.value!="" && name.value!="") {
			signUpBtn.disabled = true;
		} else {
			signUpBtn.disabled = false;
		} */

		//input이 다 체워지고 이메일 인증 성공하고 인증번호 일치하면 가입하기 버튼 활성화됨 
		//email유효성검사, 인증하기 버튼 눌렀음, 인증확인 버튼 눌렀음, 비밀번호유효성검사, 
		if (isEmail(email.value) && cerNum.value != ""
				&& isPassword(password.value) && name.value != ""
				&& password.value == passwordCheck.value
				&& cerNum_check_boolean && email_check_boolean) {
			signUpBtn.disabled = false;
			signUpBtn.style.backgroundColor = '#64A346';
		} else {
			signUpBtn.disabled = true;
			signUpBtn.style.backgroundColor = '#a2a2a3';
		}

	}
</script>
<script>
	//유효성 검사
	function printEmail() {
		// 이메일 입력창, 이메일 입력조건 불만족 시 하단에 표시되는 경고 텍스트 변수에 할당
		//const email = document.getElementById('email');
		//const email_check = document.getElementById('email_check');
		// 입력창의 값이 이메일 형태와 맞지 않게 입력된 경우
		if (!isEmail(email.value)) {
			// 이메일 입력창의 테두리 빨간색으로 변경
			email.style.borderColor = '#EF4444';
			// 입력창 하단의 경고 텍스트 보이게
			emailCheck.style.visibility = 'visible';
			email_check_btn.disabled = true;
		}
		// 이메일 형태에 적합하게 입력된 경우
		else {
			// 테두리 색 원래대로 변경
			email.style.borderColor = '#9CA3AF';
			// 경고 텍스트 안보이게 처리
			emailCheck.style.visibility = 'hidden';

			email_check_boolean = true;
			email_check_btn.disabled = false;

			// 로그인 버튼 활성화 여부를 체크하는 함수 선언

		}
		allInputCheck();
	}

	function isEmail(asValue) {
		// 이메일 형식에 맞게 입력했는지 체크
		let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test(asValue); // 형식에 맞는 경우에만 true 리턴	
	}

	function printPassword() {
		// 이메일 입력창, 이메일 입력조건 불만족 시 하단에 표시되는 경고 텍스트 변수에 할당
		//const password = document.getElementById('password');
		//const password_check = document.getElementById('password_check_text');
		// 입력창의 값이 이메일 형태와 맞지 않게 입력된 경우

		if (password.value != passwordCheck.value) {
			password_check_text2.style.visibility = 'hidden';

		} else {
			if (passwordCheck.value != '') {
				password_check_text2.style.visibility = 'visible';
			}

		}
		if (!isPassword(password.value)) {
			// 이메일 입력창의 테두리 빨간색으로 변경
			password.style.borderColor = '#EF4444';
			// 입력창 하단의 경고 텍스트 보이게
			password_check_text1.style.visibility = 'visible';

			allInputCheck();
		}
		// 이메일 형태에 적합하게 입력된 경우
		else {
			// 테두리 색 원래대로 변경
			password.style.borderColor = '#9CA3AF';
			// 경고 텍스트 안보이게 처리
			password_check_text1.style.visibility = 'hidden';
			// 로그인 버튼 활성화 여부를 체크하는 함수 선언
			allInputCheck();
		}
	}

	function isPassword(asValue) {
		// 비밀번호 형식에 맞게 입력했는지 체크
		let regExp = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
		return regExp.test(asValue); // 형식에 맞는 경우에만 true 리턴	
	}

	function printPasswordCheck() {
		// 이메일 입력창, 이메일 입력조건 불만족 시 하단에 표시되는 경고 텍스트 변수에 할당
		//const password = document.getElementById('password');
		//const password_check = document.getElementById('passwordCheck');
		//const password_check_text = document.getElementById('password_check_text2');

		// 입력한 비밀번호 값이 비밀번호 확인 값과 같을 때
		if (password.value == passwordCheck.value) {
			if (passwordCheck.value != '') {
				password_check_text2.style.visibility = 'visible';
			}

			allInputCheck();

		} else {
			password_check_text2.style.visibility = 'hidden';

			allInputCheck();

		}

	}
</script>
<body>
	<div class="mainpage--jfs">
		<div class="group-173-qRP">
			<div class="auto-group-mb2v-NRK">
				<!-- <p class="item--teZ">회원가입</p> -->
				<p class="item--PLR">
					<span class="item--PLR-sub-0">*</span> <span
						class="item--PLR-sub-1">필수입력사항</span>
				</p>
			</div>
			<div class="auto-group-ymdo-CSH">
				<div class="rectangle-90-7p91">
					<p class="item--eZB1">파머</p>
				</div>
				<div class="rectangle-98-tTX1">
					<p class="item--jDF1">농작물을 투자/구매하고 싶어요!</p>
				</div>
				<!-- <div class="rectangle-89-bcq">
      			</div> -->


				<form class="rectangle-89-bcq" method="post" id="signupForm"
					style="display: block;">

					<div class="term_status">
						<div class="rectangle-93-JTw"></div>
						<div class="rectangle-95-dm7"></div>
						<div class="ellipse-4-mcR"></div>
						<img class="uim-check-abo" src="./assets/check_img.png" /> <img
							class="group-101-ey3" src="./assets/orange_circle.png" />
						<div class="ellipse-5-gjP"></div>
					</div>

					<div class="term_status2">
						<p class="item--QfP">약관 동의</p>
						<p class="item--6o7">정보 입력</p>
						<p class="item--mPT">가입 완료</p>
					</div>

					<div class="formmail-EQu">
						<div class="group-97-ZCH">
							<div class="item--4eq">이메일</div>
							<p class="item--AC5">*</p>
						</div>
						<div class="auto-group-vdzx-t85">
							<input onkeyup="printEmail()" type="text" name="user_email"
								id="email" class="group-98-dbT" placeholder="이메일 형식으로 입력해주세요."
								required="required" /> <input type="button"
								id="email_check_btn" onclick="email_check()"
								class="group-96-GeR" value="인증하기" />
						</div>
						<span id="email_check" class="warn_text"> 유효한 이메일 주소를
							입력하세요.</span>
					</div>

					<div class="formmail-EQu1">
						<div class="group-97-ZCH1">
							<div class="item--4eq1">인증번호</div>
							<p class="item--AC51">*</p>
						</div>
						<div class="auto-group-vdzx-t851">
							<input type="text" name="cerNum" id="cerNum"
								class="group-98-dbT1" placeholder="인증번호를 입력해 주세요."
								required="required" /> <input type="button"
								id="check_cer_num_btn" onclick="check_cer_num()"
								class="group-96-GeR1" value="인증확인">
						</div>
						<span id="cerNum_check_text" class="warn_text2"> 인증성공 </span>
					</div>

					<div class="formpwd-VXB">
						<div class="group-97-Qu3">
							<div class="item--8KF">비밀번호</div>
							<p class="item--B2d">*</p>
						</div>
						<input onkeyup="printPassword()" type="password" name="user_pw"
							id="password" class="group-98-reZ"
							placeholder="8~16자의 영문, 숫자, 특수기호" required="required" /> <span
							id="password_check_text" class="warn_text"> 비밀번호는 최소 8자에서
							16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.</span>
						<!-- <div class="group-98-reZ">8~16자의 영문, 숫자, 특수기호</div> -->
					</div>

					<div class="formpwd2-8nR">
						<div class="group-97-fGZ">
							<div class="item--bAD">비밀번호 확인</div>
							<p class="item--tQD">*</p>
						</div>
						<input onkeyup="printPasswordCheck()" type="password"
							name="passwordCheck" id="passwordCheck" class="group-98-2FX"
							placeholder="비밀번호를 한번 더 입력해 주세요." required="required" /> <span
							id="password_check_text2" class="warn_text2"> 비밀번호 일치 </span>
						<!-- <div class="group-98-2FX">비밀번호를 한번 더 입력해 주세요.</div> -->
					</div>

					<div class="formpwd-NWR">
						<div class="group-97-Vqw">
							<div class="item--dSM">이름</div>
							<p class="item--9Qh">*</p>
						</div>
						<!-- <input onkeyup="printEmail()" type="text" name="user_email" id="email"
								class="group-98-dbT" placeholder="이메일 형식으로 입력해주세요."
								required="required" /> -->
						<input onkeyup="allInputCheck()" type="text" name="user_name"
							id="name" class="group-98-g9j" placeholder="이름을 입력해 주세요."
							required="required" />
						<!-- <div class="group-98-g9j">이름을 입력해 주세요.</div> -->
					</div>

					<div class="auto-group-sgld-ue5">
						<input type="button" onclick="location.href='login.do'"
							class="group-100-Q53" value="취소" />
						<!-- <div class="group-100-Q53">취소</div> -->
						<!-- <button onclick="s_signup3()" id="signUpBtn" name="signUpBtn"
					class="group-99-bQR" type="submit" form="signupForm">가입하기</button> -->
						<button id="signUpBtn" type="button" onclick="s_signup3()"
							name="signUpBtn" class="group-99-bQR">가입하기</button>
						<!-- <button onclick="location.href='signup3.do'" class="group-99-bQR">가입하기</button> -->
						<!-- <div class="group-99-bQR">가입하기</div> -->
					</div>
				</form>

			</div>

			<!-- <div class="auto-group-sgld-ue5">
				<button onclick="location.href='login.do'" class="group-100-Q53">취소</button>
				<div class="group-100-Q53">취소</div>
				<button onclick="s_signup3()" id="signUpBtn" name="signUpBtn"
					class="group-99-bQR" type="submit" form="signupForm">가입하기</button>
				<button onclick="location.href='s_signup3Post.do'" id="signUpBtn"
					name="signUpBtn" class="group-99-bQR" type="submit">가입하기</button>
				<button onclick="location.href='signup3.do'" class="group-99-bQR">가입하기</button>
				<div class="group-99-bQR">가입하기</div>
			</div> -->

		</div>

	</div>

</body>
</html>