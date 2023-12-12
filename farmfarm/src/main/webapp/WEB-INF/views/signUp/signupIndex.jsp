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
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
	
<link rel="stylesheet" href="styles/signup1.css" />

</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	document.addEventListener('keydown', onEnterLogin);

	function onEnterLogin() {
		var keyCode = window.event.keyCode;

		if (keyCode == 13
				&& window.getComputedStyle(document
						.querySelector('#signUpModal')).display != 'none') {
			// 모달이 떠있다면, 먼저 모달을 닫고 함수를 종료
			console.log('modal on');
			document.querySelector('#signUpModal').style.display = 'none';
			event.preventDefault(); // 이벤트 전파 방지
			return;
		}

	}
</script>

<script type="text/javascript">
	function f_signup1() {
		$.ajax({
			url : "/f_signup1.do",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}

	function s_signup2() {
		$.ajax({
			url : "/s_signup2.do",
			success : function(responseData) {
				$("#here").html(responseData);
			}
		});
	}

	function showFullText(termName) {
		$
				.ajax({
					url : "/termContents.do", //DB에 가서 약관을 가져와
					data : {
						"termName" : termName
					},
					success : function(responseData) {

						document.querySelector('#signUpModal').style.display = 'flex'; //모달을 띄위는 코드
						document.querySelector('#signUpModal .item--MHF').textContent = "이용약관";
						$(".id-2-RY1").html(responseData);
					}
				});
	}
</script>

<body>
	<div class="mainpage--1tZ">
		<jsp:include page="signupModal.jsp" />
		<jsp:include page="validationModal.jsp" />
		<div class="group-172-CfX">
			<div class="auto-group-bzzh-Xxh">
				<p class="item--Fth">회원가입</p>
				<!-- <p class="item--Y77">
					<span class="item--Y77-sub-0">*</span> <span
						class="item--Y77-sub-1">필수입력사항</span>
				</p> -->
			</div>

			<div id="here">
				<div class="auto-group-pxyy-6gM">
					<div class="rectangle-90-1YR1" onclick="f_signup1()">
						<p class="item--fWV1">파머</p>
					</div>

					<div class="rectangle-97-LKo1">
						<p class="item--NnH1">농작물을 투자/구매하고 싶어요!</p>
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
							- 필수 약관에 동의하셔야 회원가입이 가능합니다. <br /> - 선택 약관에 동의하지 않으셔도 회원가입이
							가능합니다.
						</div>

						<div class="line-22-7QR"></div>

						<div class="group-103-H7s1">
							<input type="checkbox" id="checkbox1" class="checkbox1">
							<label for="checkbox1" class="item--sW5">전체 약관동의</label>
						</div>

						<div class="group-103-H7s">
							<input type="checkbox" id="checkbox2" class="checkbox2">
							<label for="checkbox2" class="item--iys">개인정보 수집 및 이용
								동의(필수)</label> <label for="checkbox2" onclick="showFullText('terms1')" class="item--Qrh">전문
								보기</label>
						</div>

						<div class="group-104-XAd">
							<input type="checkbox" id="checkbox3" class="checkbox3">
							<label for="checkbox3" class="item--YLd">팜팜 이용약관(필수)</label> <label
								for="checkbox3" onclick="showFullText('sterms2')" class="item--2Wh">전문
								보기</label>
						</div>

						<div class="group-105-jR7">
							<input type="checkbox" id="checkbox4" class="checkbox4">
							<label for="checkbox4" class="item--NU5">팜팜의 소식과 다양한
								안내(선택)</label> <label for="checkbox4" onclick="showFullText('terms3')" class="item--GZT">전문
								보기</label>
						</div>

						<!-- <div class="group-106-P8H">
							<input type="checkbox" id="checkbox5" class="checkbox5">
							<label for="checkbox5" class="item--dHX">팜팜의 소식과 다양한
								안내(선택)</label>
						</div> -->
					</div>
				</div>

				<div class="auto-group-uuhw-Ws7">
					<button onclick="location.href='login.do'" class="group-100-DFj">취소</button>
					<button onclick="s_signup2()" id="nextButton" class="group-99-pWR">다음</button>
				</div>
			</div>

		</div>
	</div>

	<script>
		var checkbox1 = document.getElementById("checkbox1");
		var checkbox2 = document.getElementById("checkbox2");
		var checkbox3 = document.getElementById("checkbox3");
		var checkbox4 = document.getElementById("checkbox4");
		//var checkbox5 = document.getElementById("checkbox5");
		var nextButton = document.getElementById("nextButton");
		nextButton.disabled = true;

		checkbox1.addEventListener('change', updateAgreeAllTermButton);
		checkbox2.addEventListener('change', updateNextButtonState);
		checkbox3.addEventListener('change', updateNextButtonState);
		checkbox4.addEventListener('change', updateNextButtonState);
		//checkbox5.addEventListener('change', updateNextButtonState);

		function updateAgreeAllTermButton() {

			if (checkbox1.checked) {
				checkbox2.checked = true;
				checkbox3.checked = true;
				checkbox4.checked = true;
				//checkbox5.checked = true;
				nextButton.disabled = true;
			} else {
				checkbox2.checked = false;
				checkbox3.checked = false;
				checkbox4.checked = false;
				//checkbox5.checked = false;
				nextButton.disabled = false;
			}

			updateNextButtonState();

		}

		function updateNextButtonState() {
			/* console.log(checkbox1.checked); */
			if (checkbox2.checked == false || checkbox3.checked == false
					 || checkbox4.checked == false) { //|| checkbox5.checked == false
				checkbox1.checked = false;
			} else {
				checkbox1.checked = true;
			}

			var allCheckboxesChecked = checkbox2.checked && checkbox3.checked;
					//&& checkbox4.checked;
			nextButton.style.backgroundColor = allCheckboxesChecked ? '#64A346'
					: '#a2a2a3';
			nextButton.disabled = allCheckboxesChecked ? false : true;
		}
	</script>
</body>