<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${cpath }/styles/jaeho.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />

<div class="Content">
<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
	<div class="content_tit">
		이메일 아이디 로그인을 위한<br />비밀번호를 설정해 주세요.
	</div>

	<div class="grayback">
		<div class="content_detailall">
			<div class="content_detail">
				<div class="detail_tit">현재 비밀번호</div>
				<div class="detail_content">
					<input id="passwdCheck" type="password" name="passwdCheck"
						placeholder="비밀번호를 입력하세요.">
				</div>
			</div>
			<div class="content_detail">
				<div class="detail_tit">변경할 비밀번호</div>
				<div class="detail_content">
					<input id="newPasswd" type="password" name="newPasswd"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$"
						placeholder="8~16자의 영문, 숫자, 특수기호">
				</div>
			</div>
			<div class="content_detail">
				<div class="detail_tit">비밀번호 확인</div>
				<div class="detail_content">
					<input id="newPasswdCheck" type="password" name="newPasswdCheck"
						placeholder="비밀번호를 한 번 더 입력해 주세요.">
				</div>
			</div>
		</div>
		<div class="btn">
			<button id="updatePasswdBtn" onclick="check()">비밀번호 변경</button>
		</div>
	</div>

</div>
<!-- 여기까지써 -->
<script>
	document.addEventListener("keydown", function(event) {
		if (event.key === "Enter") {
			check();
			document.removeEventListener("keydown", arguments.callee); // 엔터 키 이벤트 리스너 제거
		}
	});

	function check() {
		let passwdCheck = document.getElementById("passwdCheck").value;
		let newPasswd = document.getElementById("newPasswd").value;
		let newPasswdCheck = document.getElementById("newPasswdCheck").value;

		//추가된 부분
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		if (reg.test(newPasswd) == false) {
			showModal_success("입력 오류", "비밀번호 표현식이 틀렸습니다.<br>8~16자의 영문, 숫자, 특수기호를 섞어주세요.");
			document.getElementById("newPasswd").focus();
			return;
		}
		if (reg.test(newPasswdCheck) == false) {
			showModal_success("입력 오류", "비밀번호 표현식이 틀렸습니다.<br>8~16자의 영문, 숫자, 특수기호를 섞어주세요.");
			document.getElementById("newPasswdCheck").focus();
			return;
		}
		//추가된 부분 끝

		if (newPasswd != newPasswdCheck) {
			showModal_success("입력 오류", "비밀번호가 다릅니다.<br>비밀번호를 확인해주세요!");
			return;
		}
		var obj = {
			"originalPass" : passwdCheck,
			"newPasswd" : newPasswd
		};
		console.log(obj);
		$.ajax({
			url : "${cpath}/myPageFarmer/passwdchange_farmer",
			data : obj,
			type : "post",
			success : function(responseData) {
				if (responseData == 0) {
					showModal_success("입력 오류", "비밀번호가 다릅니다.<br>비밀번호를 확인해주세요!");
				} else {
					showModal_success("변경 결과", "비밀번호 변경 성공!<br>변경된 비밀번호로 다시 로그인해주세요.");
					location.href = "${cpath}/logout";
				}
			}
		});
	}
</script>

