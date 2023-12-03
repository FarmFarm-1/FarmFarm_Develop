<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>farmfarm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>farmfarm homepage</h1>
	<hr>
	<h4>farmer login</h4>
	<form action="/farmer/farmerInput" method="post">
		email : <input type="text" name="farmer_email" value="farmer@farm.com">
		pw : <input type="text" name="farmer_pw" value="farmer">
		name : <input type="text" name="farmer_name" value="farmer">
		<input type="submit" value="파머로 로그인">
	</form>
	
	
	<h4>user login</h4>
	<form action="/user/userInput" method="post">
		email : <input type="text" name="user_email" value="user@farm.com">
		pw : <input type="text" name="user_pw" value="user">
		name : <input type="text" name="user_name" value="user">
		<input type="submit" value="유저로 로그인">
	</form>
	
	<hr>
	<button onclick="getAllUsers()">user 테이블을 로그로 보기</button>
	<button onclick="getAllFarmers()">farmer 테이블을 로그로 보기</button>
	<script>
		function getAllUsers() {
			$.ajax({
				url: '/user/getAllUsers',
				type: 'GET',
				success: function(response) {
					//console.log(response);
				},
				error: function(error) {
					console.log(error);
				}
			});
		}
		function getAllFarmers() {
			$.ajax({
				url: '/farmer/getAllFarmers',
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