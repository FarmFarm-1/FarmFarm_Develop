<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main sub</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<jsp:include
		page="header.jsp" />
	
	<h1>메인페이지 대용</h1>
	<hr>
	<button onclick="location.href='login'">로그인 페이지로 이동</button>
	<hr>
	<button onclick="location.href='signup'">회원가입 페이지로 이동</button>
	<hr>
	<button onclick="location.href='logout'">로그아웃</button>
	<hr>
	<button onclick= "location.href='myFarm'">마이팜 파머 테스트</button>
	<form action="/manuallyInputCropsData" method="get">
		<input type="text" name="date">
		<input type="submit" value="cropsDataManuallyInput BY HS">
	</form>
	<button onclick= "location.href='/manuallySearchAccount'">계좌 조회 테스트</button>
</body>
</html>