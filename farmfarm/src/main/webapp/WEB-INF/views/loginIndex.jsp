<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	window.onload = function(){
		console.log("${path}")
		console.log("hi")
	}
</script>
</head>

<body>
	<h1>FarmFarm Login&SignUp</h1>
	<hr>
	<button onclick="location.href='login.do'">로그인 페이지로 이동</button>
	<hr>
	<button onclick="location.href='signup.do'">회원가입 페이지로 이동</button>
	<hr>
	<h1>${path}</h1>
	
	<form action="/test/testInput" method="post">
		email : <input type="text" name="user_email" value="test@gmail.com">
		pw : <input type="text" name="user_pw" value="test">
		name : <input type="text" name="user_name" value="test">
		<input type="submit">
	</form>
	
	<button onclick="getAllUsers()">user 테이블을 로그로 보기</button>
	<script>
		function getAllUsers() {
			$.ajax({
				url: '/test/getAllUsers',
				type: 'GET',
				success: function(response) {
					//console.log(response);
				},
				error: function(error) {
					console.log(error);
				}
			});
		}
	</script>
</body>
</html>