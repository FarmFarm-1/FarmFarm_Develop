<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<p>farmfarm homepage</p>
	
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