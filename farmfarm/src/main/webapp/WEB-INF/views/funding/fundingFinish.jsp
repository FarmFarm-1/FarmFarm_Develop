<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/펀딩/구매 완료</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Abhaya+Libre+ExtraBold%3A800" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/styles/fundingfinish.css" />
</head>
<body>
	<%@include file="../headerfooter/header.jsp"%>
	<div class="mainpage">
		<div class="fundingfinishtext">펀딩완료</div>
		<!-- grayback -->
		<div class="grayback">
			<div class="whiteback">
				<div class="imgclass">
					<img src="${pageContext.request.contextPath }/assets/handfund.png" />
				</div>
				<div class="content_group">
					<div class="text_tit">
						펀딩이 정상적으로<br />완료되었습니다!
					</div>
					<div class="text_content">팜팜을 이용해주셔서 감사합니다.</div>
				</div>
			</div>
		</div>
		<!-- //grayback -->
	</div>
	<%@include file="../headerfooter/footer.jsp"%>
</body>