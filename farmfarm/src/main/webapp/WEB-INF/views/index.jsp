<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<c:set var="farmerSerialNum" value="${sessionScope.farmer_serial_num}" />
	<c:if test="${not empty farmerSerialNum}">
	    <p>로그인 파머 : ${farmerSerialNum} 
	    <form action="/farmer/farmerLogout" method="get">
	    	<input type="submit" value="파머 로그아웃">
	    </form>
	    </p>
	</c:if>
	<c:if test="${empty farmerSerialNum}">
	    <p>로그인되지 않음</p>
	</c:if>
	<form action="/farmer/farmerInput" method="post">
		email : <input type="text" name="farmer_email" value="farmer@farm.com">
		pw : <input type="text" name="farmer_pw" value="farmer">
		name : <input type="text" name="farmer_name" value="farmer">
		<input type="submit" value="파머 삽입">
	</form>
	<form id="farmerLogin" action="/farmer/farmerLogin" method="post">
		email : <input type="text" name="farmer_email" value="farmer@farm.com">
		pw : <input type="text" name="farmer_pw" value="farmer">
		<input type="submit" value="파머로 로그인">
	</form>
		
	
	<h4>user login</h4>
	<c:set var="userSerialNum" value="${sessionScope.user_serial_num}" />
	<c:if test="${not empty userSerialNum}">
	    <p>로그인 서포터 : ${userSerialNum} 
	    <form action="/user/userLogout" method="get">
	    	<input type="submit" value="유저 로그아웃">
	    </form>
	    </p>
	</c:if>
	<c:if test="${empty userSerialNum}">
	    <p>로그인되지 않음</p>
	</c:if>
	<form action="/user/userInput" method="post">
		email : <input type="text" name="user_email" value="user@farm.com">
		pw : <input type="text" name="user_pw" value="user">
		name : <input type="text" name="user_name" value="user">
		<input type="submit" value="유저 삽입">
	</form>
	
	<form id="userLogin" action="/user/userLogin" method="post">
		email : <input type="text" name="user_email" value="user@farm.com">
		pw : <input type="text" name="user_pw" value="user">
		<input type="submit" value="유저 로그인">
	</form>
		
	
	<hr>
	<button onclick="getAllUsers()">user 테이블을 로그로 보기</button>
	<button onclick="getAllFarmers()">farmer 테이블을 로그로 보기</button>
	
	<hr>
	<form id="fundingListForm" action="/funding/fundingList" method="get">
	    <input type="submit" value="펀딩 리스트">
	</form>
	<form id="auctionListForm" action="/auction/auctionList" method="get">
	    <input type="submit" value="옥션 리스트">
	</form>
	<script>
		let message = "${message}";
		if(message!="") {
			alert(message);
		}
		
		let farmerSerialNum = "${sessionScope.farmer_serial_num}";
		if (farmerSerialNum != "") {
			$("#farmerLogin").hide();
		}
		let userLogin = "${sessionScope.user_serial_num}";
		if (userLogin != "") {
			$("#userLogin").hide();
		}
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