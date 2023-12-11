<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>findPassword...</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet" href="${cpath}/styles/findPassword.css" />

<script>
	document.addEventListener('keydown', onEnterLogin);
	
	function onEnterLogin() {
		var keyCode = window.event.keyCode;
		
		const email = document.getElementById('email').value;   
		
		
		console.log( window.getComputedStyle(document.querySelector('.modal')).display);
		
		if (keyCode == 13 && window.getComputedStyle(document.querySelector('.modal')).display != 'none') {
			// 모달이 떠있다면, 먼저 모달을 닫고 함수를 종료
			console.log('modal on');
			document.querySelector('.modal').style.display = 'none';
			event.preventDefault(); // 이벤트 전파 방지
			return;
		}
		
		
		if (keyCode == 13 && window.getComputedStyle(document.querySelector('.modal')).display == 'none') { //엔테키 이면
			console.log('form enter');
			
			if (isEmail(email)){
				console.log('isEmail ok!!');
				submitEmail();
			}
		}
		
			
			
	}
</script>

<script>
	
	function printEmail() {
	
		// 이메일 입력창, 이메일 입력조건 불만족 시 하단에 표시되는 경고 텍스트 변수에 할당
		const email = document.getElementById('email');
		const email_check = document.getElementById('email_check');

		// 입력창의 값이 이메일 형태와 맞지 않게 입력된 경우
		if (!isEmail(email.value)) {

			// 이메일 입력창의 테두리 빨간색으로 변경
			email.style.borderColor = '#EF4444';
			// 입력창 하단의 경고 텍스트 보이게
			email_check.style.visibility = 'visible';
			btnCheck();
		}
		// 이메일 형태에 적합하게 입력된 경우
		else {
			// 테두리 색 원래대로 변경
			email.style.borderColor = '#9CA3AF';
			// 경고 텍스트 안보이게 처리
			email_check.style.visibility = 'hidden';

			// 로그인 버튼 활성화 여부를 체크하는 함수 선언
			btnCheck();

		}

	}

	function isEmail(asValue) {
		// 이메일 형식에 맞게 입력했는지 체크
		let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test(asValue); // 형식에 맞는 경우에만 true 리턴	
	}
	
	 function btnCheck() {
			
		    // 이메일, 비밀번호, 로그인 버튼 변수 할당
		    const email = document.getElementById('email').value;       
		    const login_btn = document.getElementById('findBtn');
		       
		    // 이메일 입력조건과 비밀번호 입력조건중 하나라도 만족하지 못하는 경우 로그인 버튼 비활성화
		    if (isEmail(email)) {
		        login_btn.disabled = false;
		        login_btn.style.backgroundColor = '#64a246';
		    }
		    else {        
		        login_btn.disabled = true;
		        login_btn.style.backgroundColor = '#a2a2a3';
		    }
		  }
	function submitEmail(){
		$.ajax({
			url : "${cpath}/login/findPassword.do",
			type : "POST",
			data : {
				email : $("#email").val()
			},
			success : function(result) {
				//alert(result);
				if(result == "등록되지 않은 이메일입니다."){
					document.querySelector('#basicModal .alertTitle').textContent = "등록되지 않은 이메일입니다.";
     				document.querySelector('#basicModal .alertContent').textContent = "이메일 정보를 다시 확인해 주세요.";
                    document.querySelector('.modal').style.display='flex';
				}else{
					document.querySelector('#basicModal .alertTitle').textContent = "임시비밀번호 발송 완료";
     				document.querySelector('#basicModal .alertContent').textContent = "이메일을 확인하여 로그인 후 비밀번호를 변경해주세요.";
                    document.querySelector('.modal').style.display='flex';
      
                }
			},
		})
	}
	/* $(function() {
		$("#findBtn").click(function() {

			$.ajax({
				url : "${cpath}/login/findPassword.do",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					//alert(result);
					if(result == "등록되지 않은 이메일입니다."){
						document.querySelector('#basicModal .alertTitle').textContent = "등록되지 않은 이메일입니다.";
         				document.querySelector('#basicModal .alertContent').textContent = "이메일 정보를 다시 확인해 주세요.";
	                    document.querySelector('.modal').style.display='flex';
					}else{
						document.querySelector('#basicModal .alertTitle').textContent = "임시비밀번호 발송 완료";
         				document.querySelector('#basicModal .alertContent').textContent = "이메일을 확인하여 로그인 후 비밀번호를 변경해주세요.";
	                    document.querySelector('.modal').style.display='flex';
	      
	                }
				},
			})
		});
	}) */
</script>

<title>비밀번호 찾기</title>
</head>

<body>
	<div class="mainpage--2jF">
		<jsp:include page="basicModal.jsp" />

		<div class="group">
			<p class="item--fjb">비밀번호 찾기</p>
			<p class="item--kFF">비밀번호가 생각나지 않으세요?</p>
			<p class="item--Qah">
				회원정보에 등록하신 이메일 주소로 비밀번호를 발송해 드립니다. <br /> 아래 입력하신 이메일 주소는 회원정보에 등록된
				이메일 주소와 반드시 같아야 합니다.
			</p>
			<div class="auto-group-43ch-Zc1">
				<div class="auto-group-nycr-5aM">
					<div class="formmail-bYh">
						<div class="item--Xx9">이메일</div>
						<input type="text" name="email" id="email" onkeyup='printEmail()'
							class="group-98-SpD" placeholder="이메일 형식으로 입력해주세요." /> <span
							id="email_check" class="warn_text"> 유효한 이메일 주소를 입력하세요.</span>
					</div>
				</div>
				<button disabled type="button" id="findBtn" class="group-99-HK3"
					onclick="submitEmail()">확인</button>



			</div>
		</div>
	</div>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/footer.jsp" />


</body>
</html>