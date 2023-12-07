<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	function s_signup3() {
		$.ajax({
			url : "/s_signup3.do",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
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

				<form class="rectangle-89-bcq" method="get" id="signupForm"
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
							<input type="text" name="email" class="group-98-dbT"
								placeholder="이메일 형식으로 입력해주세요." required="required" />
							<!-- <div class="group-98-dbT">이메일 형식으로 입력해 주세요.</div> -->
							<button class="group-96-GeR" type="submit" form="signupForm">인증하기</button>
							<!-- <div class="group-96-GeR">인증하기</div> -->
						</div>
					</div>

					<div class="formmail-EQu1">
						<div class="group-97-ZCH1">
							<div class="item--4eq1">인증번호</div>
							<p class="item--AC51">*</p>
						</div>
						<div class="auto-group-vdzx-t851">
							<input type="text" name="certificationNumber"
								class="group-98-dbT1" placeholder="인증번호를 입력해 주세요."
								required="required" />
							<!-- <div class="group-98-dbT1">인증번호를 입력해 주세요.</div> -->
							<button class="group-96-GeR1" type="submit" form="signupForm">인증확인</button>
							<!-- <div class="group-96-GeR1">인증확인</div> -->
						</div>
					</div>

					<div class="formpwd-VXB">
						<div class="group-97-Qu3">
							<div class="item--8KF">비밀번호</div>
							<p class="item--B2d">*</p>
						</div>
						<input type="password" name="password" class="group-98-reZ"
							placeholder="8~16자의 영문, 숫자, 특수기호" required="required" />
						<!-- <div class="group-98-reZ">8~16자의 영문, 숫자, 특수기호</div> -->
					</div>

					<div class="formpwd2-8nR">
						<div class="group-97-fGZ">
							<div class="item--bAD">비밀번호 확인</div>
							<p class="item--tQD">*</p>
						</div>
						<input type="password" name="password" class="group-98-2FX"
							placeholder="비밀번호를 한번 더 입력해 주세요." required="required" />
						<!-- <div class="group-98-2FX">비밀번호를 한번 더 입력해 주세요.</div> -->
					</div>

					<div class="formpwd-NWR">
						<div class="group-97-Vqw">
							<div class="item--dSM">이름</div>
							<p class="item--9Qh">*</p>
						</div>
						<input type="text" name="name" class="group-98-g9j"
							placeholder="이름을 입력해 주세요." required="required" />
						<!-- <div class="group-98-g9j">이름을 입력해 주세요.</div> -->
					</div>
				</form>
			</div>

			<div class="auto-group-sgld-ue5">
				<button onclick="location.href='login.do'" class="group-100-Q53">취소</button>
				<!-- <div class="group-100-Q53">취소</div> -->
				<button onclick="s_signup3()" class="group-99-bQR" type="submit" form="signupForm">가입하기</button>
				<!-- <button onclick="location.href='signup3.do'" class="group-99-bQR">가입하기</button> -->
				<!-- <div class="group-99-bQR">가입하기</div> -->
			</div>
		</div>
	</div>
</body>
</html>