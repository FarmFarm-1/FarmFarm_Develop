<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="${cpath }/styles/jaeho.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<body>
	<div class="Content">
		<div class="content_tit">
			이메일 아이디 로그인을 위한<br />비밀번호를 설정해 주세요.
		</div>
		<form id= "passwdchange" action="${cpath}/jaeho/passwdchange" method="post">
			<div class="grayback">
				<div class="content_detailall">
					<div class="content_detail">
						<div class="detail_tit">현재 비밀번호</div>
						<div class="detail_content">
							<input id="passwdCheck" type="password" name="passwdCheck" placeholder="비밀번호를 입력하세요.">
						</div>
					</div>
					<div class="content_detail">
						<div class="detail_tit">변경할 비밀번호</div>
						<div class="detail_content">
							<input id="newPasswd" type="password" name="newPasswd" placeholder="8~16자의 영문, 숫자, 특수기호">
						</div>
					</div>
					<div class="content_detail">
						<div class="detail_tit">비밀번호 확인</div>
						<div class="detail_content">
							<input id="newPasswdCheck" type="password" name="newPasswdCheck" placeholder="비밀번호를 한 번 더 입력해 주세요.">
						</div>
					</div>
				</div>
				<div class="btn">
					<button id="updatePasswdBtn" onclick="updatePasswd()">비밀번호
						변경</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 여기까지써 -->
	<script>
	function updatePasswd() {
		document.getElementById("updatePasswdBtn").submit();
	}
	</script>
</body>
</html>