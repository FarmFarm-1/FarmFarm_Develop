<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/회원가입/파머/약관동의</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet" href="styles/signup1.css" />
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function s_signup1() {
		$.ajax({
			url : "/s_signup1.do",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
	
	function f_signup2() {
		$.ajax({
			url : "/f_signup2.do",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}
</script>

<body>
	<div class="mainpage--1tZ">
		<div class="group-172-CfX">
			<!-- <div class="auto-group-bzzh-Xxh">
				<p class="item--Fth">회원가입</p>
				<p class="item--Y77">
					<span class="item--Y77-sub-0">*</span> <span
						class="item--Y77-sub-1">필수입력사항</span>
				</p>
			</div> -->

			<div id="here">
				<div class="auto-group-pxyy-6gM">
					<div class="rectangle-90-1YR">
						<p class="item--fWV">농작물 재배를 위해 펀딩받고 싶어요!</p>
					</div>

					<div class="rectangle-97-LKo" onclick="s_signup1()">
						<p class="item--NnH">서포터</p>
					</div>

					<div class="rectangle-89-e5b">

						<div class="term_status">
							<div class="rectangle-96-vMs"></div>
							<div class="rectangle-95-CRs"></div>
							<img class="group-102-RLZ" src="./assets/orange_circle.png" />

							<div class="ellipse-6-ney"></div>
							<div class="ellipse-5-fKT"></div>
						</div>

						<div class="term_status2">
							<p class="item--vWH">약관 동의</p>
							<p class="item--1nd">정보 입력</p>
							<p class="item--WzH">가입 완료</p>
						</div>

						<div class="item--6bo">
							-필수 약관에 동의하셔야 회원가입이 가능합니다. <br /> -선택 약관에 동의하지 않으셔도 회원가입이 가능합니다.
						</div>

						<div class="line-22-7QR"></div>

						<div class="group-103-H7s1">
							<input type="checkbox" id="checkbox1" class="checkbox1">
							<label for="checkbox1" class="item--sW5">전체 약관동의</label>
							<!-- <img class="gg-check-o-Yvy" src="./assets/gray_big_circle.png" />
						<div class="item--sW5">전체 약관동의</div> -->
						</div>

						<div class="group-103-H7s">
							<input type="checkbox" id="checkbox2" class="checkbox2">
							<label for="checkbox2" class="item--iys">회원가입 기본 약관(필수)</label> <label
								for="checkbox2" class="item--Qrh">전문 보기</label>
							<!-- <img class="gg-check-o-Pwb" src="./assets/gray_small_circle.png" />
						<div class="item--iys">회원가입 기본 약관(필수)</div>
						<div class="item--Qrh">전문 보기</div> -->
						</div>

						<div class="group-104-XAd">
							<input type="checkbox" id="checkbox3" class="checkbox3">
							<label for="checkbox3" class="item--YLd">팜팜 이용약관(필수)</label> <label
								for="checkbox3" class="item--2Wh">전문 보기</label>
							<!-- <img class="gg-check-o-dDf" src="./assets/gray_small_circle.png" />
						<div class="item--YLd">팜팜 이용약관(필수)</div>
						<div class="item--2Wh">전문 보기</div> -->
						</div>

						<div class="group-105-jR7">
							<input type="checkbox" id="checkbox4" class="checkbox4">
							<label for="checkbox4" class="item--NU5">개인정보 취급방침(필수)</label> <label
								for="checkbox4" class="item--GZT">전문 보기</label>
							<!-- <img class="gg-check-o-eY5" src="./assets/gray_small_circle.png" />
						<div class="item--NU5">개인정보 취급방침(필수)</div>
						<div class="item--GZT">전문 보기</div> -->
						</div>

						<div class="group-106-P8H">
							<input type="checkbox" id="checkbox5" class="checkbox5">
							<label for="checkbox5" class="item--dHX">팜팜의 소식과 다양한
								안내(선택)</label>
							<!-- <img class="gg-check-o-Jm3" src="./assets/gray_small_circle.png" />
						<div class="item--dHX">팜팜의 소식과 다양한 안내(선택)</div> -->
						</div>
					</div>
				</div>

				<div class="auto-group-uuhw-Ws7">
					<button onclick="location.href='login.do'" class="group-100-DFj">취소</button>
					<!-- <div class="group-100-DFj">취소</div> -->
					<button onclick="f_signup2()" id="nextButton" class="group-99-pWR">다음</button>
					<!-- <button onclick="location.href='signup2.do'" id="nextButton"
						class="group-99-pWR">다음</button> -->
					<!-- <div class="group-99-pWR">다음</div> -->
				</div>
			</div>

		</div>
	</div>

	<script>
		var fcheckbox1 = document.getElementById("checkbox1");
		var fcheckbox2 = document.getElementById("checkbox2");
		var fcheckbox3 = document.getElementById("checkbox3");
		var fcheckbox4 = document.getElementById("checkbox4");
		var fcheckbox5 = document.getElementById("checkbox5");
		var fnextButton = document.getElementById("nextButton");
		fnextButton.disabled = true;

		fcheckbox1.addEventListener('change', updateAgreeAllTermButton);
		fcheckbox2.addEventListener('change', updateNextButtonState);
		fcheckbox3.addEventListener('change', updateNextButtonState);
		fcheckbox4.addEventListener('change', updateNextButtonState);
		fcheckbox5.addEventListener('change', updateNextButtonState);

		function updateAgreeAllTermButton() {

			if (fcheckbox1.checked) {
				fcheckbox2.checked = true;
				fcheckbox3.checked = true;
				fcheckbox4.checked = true;
				fcheckbox5.checked = true;
				fnextButton.disabled = true;
			} else {
				fcheckbox2.checked = false;
				fcheckbox3.checked = false;
				fcheckbox4.checked = false;
				fcheckbox5.checked = false;
				fnextButton.disabled = false;
			}

			updateNextButtonState();

		}

		function updateNextButtonState() {
			/* console.log(checkbox1.checked); */
			if (fcheckbox2.checked == false || fcheckbox3.checked == false
					|| fcheckbox4.checked == false
					|| fcheckbox5.checked == false) {
				fcheckbox1.checked = false;
			} else {
				fcheckbox1.checked = true;
			}

			var allCheckboxesChecked = fcheckbox2.checked
					&& fcheckbox3.checked && fcheckbox4.checked;
			fnextButton.style.backgroundColor = allCheckboxesChecked ? '#64A346'
					: '#a2a2a3';
			fnextButton.disabled = allCheckboxesChecked ? false : true;
		}
	</script>
</body>