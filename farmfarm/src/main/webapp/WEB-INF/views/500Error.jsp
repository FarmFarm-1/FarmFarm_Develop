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
		<p class="p1">500 ERROR</p>
		<p class="p2">죄송합니다. 페이지가 작동하지 않습니다.</p>
		<p class="p2">현재 요청을 처리할 수 없습니다.</p>
		<p class="p2">HTTP ERROR 500</p>
		<img class="logo_img" src="${cpath }/assets/logo_sweetpotato.png" />
		<p class="p3" onclick="location.href='${cpath}/'">팜팜으로</p>
	</div>

</body>
</html>