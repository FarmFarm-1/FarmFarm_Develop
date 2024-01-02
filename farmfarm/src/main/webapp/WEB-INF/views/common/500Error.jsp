<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${cpath }/favicon/farmfarmfavicon.png" type="image/x-icon" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet" href="${cpath }/styles/error.css" />
<title>팜팜</title>
</head>
<body>

	<div class="container">
		<p class="p1">죄송합니다!</p>
		<p class="p2">시스템에서 예기치 못한 오류가 발생했습니다.</p>
		<p class="p2">문제를 해결하기 위해 최선을 다하고 있습니다.</p>
		<p class="p2">진행중인 사항을 다시 시도하거나, 관리자에게 문의 부탁드립니다.</p>
		<img class="logo_img1" src="${cpath }/assets/logo_sweetpotato.png" />
		<p class="p3" onclick="location.href='${cpath}/'">팜팜으로</p>
	</div>

</body>
</html>