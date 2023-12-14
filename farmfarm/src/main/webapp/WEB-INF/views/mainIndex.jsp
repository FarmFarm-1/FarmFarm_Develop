<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>farmfarm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<c:set var="cpath" value="${pageContext.request.contextPath}" />
	<h1>farmfarm homepage</h1>
	<hr>
	<c:set var="serialNum" value="${sessionScope.serial_num}" />
	<c:if test="${not empty serialNum}">
		로그인 세션 : ${serialNum}
	</c:if>
	<c:if test="${empty serialNum}">
	    <p>로그인되지 않음</p>
	</c:if>
	<hr>
	<h4>farmer login</h4>
	<form action="${cpath}/farmer/farmerLogout" method="get">
    	<input type="submit" value="파머 로그아웃">
    </form>
	<form action="${cpath}/farmer/farmerInput" method="post">
		email : <input type="text" name="farmer_email" value="farmer@farm.com">
		pw : <input type="text" name="farmer_pw" value="farmer">
		name : <input type="text" name="farmer_name" value="farmer">
		<input type="submit" value="파머 삽입">
	</form>
	<form id="farmerLogin" action="${cpath}/farmer/farmerLogin" method="post">
		email : <input type="text" name="farmer_email" value="farmer@farm.com">
		pw : <input type="text" name="farmer_pw" value="farmer">
		<input type="submit" value="파머로 로그인">
	</form>
		
	
	<h4>user login</h4>
    <form action="${cpath}/user/userLogout" method="get">
    	<input type="submit" value="유저 로그아웃">
    </form>
    </p>
	<form action="${cpath}/user/userInput" method="post">
		email : <input type="text" name="user_email" value="user@farm.com">
		pw : <input type="text" name="user_pw" value="user">
		name : <input type="text" name="user_name" value="user">
		<input type="submit" value="유저 삽입">
	</form>
	
	<form id="userLogin" action="${cpath}/user/userLogin" method="post">
		email : <input type="text" name="user_email" value="user@farm.com">
		pw : <input type="text" name="user_pw" value="user">
		<input type="submit" value="유저 로그인">
	</form>
		
	
	<hr>
	<button onclick="getAllUsers()">user 테이블을 로그로 보기</button>
	<button onclick="getAllFarmers()">farmer 테이블을 로그로 보기</button>
	
	<hr>
	<button onclick="location.href='${cpath}/funding/fundingList';">펀딩리스트</button>
	<button onclick="location.href='${cpath}/auction/auctionList';">옥션리스트</button>
	<script>
		let message = "${message}";
		if(message!="") {
			alert(message);
		}
		function getAllUsers() {
			$.ajax({
				url: '${cpath}/user/getAllUsers',
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
				url: '${cpath}/farmer/getAllFarmers',
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