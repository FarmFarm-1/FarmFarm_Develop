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
	href="${pageContext.request.contextPath }/resources/styles/fundingfinish.css" />
</head>
<body>
	<%@include file="../headerfooter/header.jsp"%>
	<div class="mainpage">
		<!-- <div class="material-symbols-bookmark-outline-Fwb"></div> -->
		<div class="img_text_group">
			<div class="greyback">
				<p class="text">펀딩완료</p>
				<div class="auto-group-dqfs-68D">
					<div class="group-123-d89">
						<img
							class="${pageContext.request.contextPath }/resources/assets/fd_white.png" />
					</div>
					<div class="group-124-Ds3">
						<p class="item--JNh">
							펀딩이 정상적으로 <br /> 완료되었습니다!
						</p>
						<p class="item--Jn1">팜팜을 이용해주셔서 감사합니다.</p>
					</div>
					<img
						class="${pageContext.request.contextPath }/resources/assets/handfund.png" />
				</div>
			</div>
		</div>
	</div>
	<%@include file="../headerfooter/footer.jsp"%>
</body>