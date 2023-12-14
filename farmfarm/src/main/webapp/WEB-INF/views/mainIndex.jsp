<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>farmfarm</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<c:set var="cpath" value="${pageContext.request.contextPath}" />
	<h1>farmfarm homepage</h1>
	<hr>
	<c:set var="serialNum" value="${sessionScope.serial_num}" />
	<c:if test="${not empty serialNum}">
		로그인된 세션 : ${serialNum}
		<p>로그인 파머 : ${farmerSerialNum}</p>
		<form action="/farmer/farmerLogout" method="get">
			<input type="submit" value="파머 로그아웃">
		</form>
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
		pw : <input type="text" name="farmer_pw" value="farmer"> name
		: <input type="text" name="farmer_name" value="farmer"> <input
			type="submit" value="파머 삽입">
	</form>
	<form id="farmerLogin" action="${cpath}/farmer/farmerLogin" method="post">
		email : <input type="text" name="farmer_email" value="farmer@farm.com">
		pw : <input type="text" name="farmer_pw" value="farmer"> <input
			type="submit" value="파머로 로그인">
	</form>


	<h4>user login</h4>
    <form action="${cpath}/user/userLogout" method="get">
    	<input type="submit" value="유저 로그아웃">
    </form>
	<form action="${cpath}/user/userInput" method="post">
		email : <input type="text" name="user_email" value="user@farm.com">
		pw : <input type="text" name="user_pw" value="user"> name : <input
			type="text" name="user_name" value="user"> <input
			type="submit" value="유저 삽입">
	</form>	
	<form id="userLogin" action="${cpath}/user/userLogin" method="post">
		email : <input type="text" name="user_email" value="user@farm.com">
		pw : <input type="text" name="user_pw" value="user"> <input
			type="submit" value="유저 로그인">
	</form>

	<button onclick="location.href='${cpath}/funding/fundingMain';">펀딩리스트</button>
	<button onclick="location.href='${cpath}/auction/auctionMain';">옥션리스트</button>
	<button onclick="location.href='${cpath}/mypage/fundingList';">마이페이지 회원</button>
	<button onclick="location.href='${cpath}/mypage/projectList';">마이페이지 파머</button>
	<script>
		let message = "${message}";
		if (message != "") {
			alert(message);
		}
	</script>
</body>
</html>