<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarmFarm Header</title>
<c:set value="${pageContext.request.contextPath}" var="cpath"/>
<link rel="shortcut icon" href="${cpath}/assets/favicon/favicon.ico" type="image/x-icon">
<link rel="icon" href="${cpath}/assets/favicon/favicon.ico" type="image/x-icon">
<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" /> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700" /> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="${cpath}/styles/header.css" />
<link rel="stylesheet"
	href="${cpath}/styles/footer.css" />
</head>
<body>
	<div class="header">
		<div class="header_div">
			<div class="header_main">
				<div class="header_title_menu">
					<div class="header_title">
						<a href="javascript:void(0)"> <img class="logo_img"
							src="${cpath}/assets/logo.png" />
							<p class="logo_name">팜팜</p>
						</a>
					</div>
					<div class="header_menu">
						<div class="menu_funding">
							<a href="javascript:void(0)">펀딩</a>
						</div>
						<div class="menu_auction">
							<a href="javascript:void(0)">경매</a>
						</div>
						<div class="menu_myFarm">
							<a href="javascript:void(0)">마이팜</a>
						</div>
					</div>
				</div>
				<ul class="header_join_login">
					<li><a href="javascript:void(0)">회원가입&nbsp;</a></li>
					<li><a href="javascript:void(0)">로그인</a></li>
				</ul>
			</div>
			<div class="header_line"></div>
		</div>
	</div>
</body>
</html>