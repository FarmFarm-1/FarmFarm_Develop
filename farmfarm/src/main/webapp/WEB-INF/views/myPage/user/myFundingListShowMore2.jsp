<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myFundingListShowMore</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet" href="${cpath }/styles/myFundingListShowMore.css" />
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#button").click(function() {
			$("#divToggle").toggle();
		});
	});
</script>
<body>
	<!-- <div class="mypage--uuf "> -->
		<div class="fundingupdatedetail-Tqf">
			<span class="line-55-nsw"></span>

			<div class="update1-UfX">
				<div class="update1icon-1fT">1</div>
				<div class="item--WMK">경작 준비중</div>
				<div class="item--cQM">경작이 곧 시작돼요</div>
			</div>

			<div class="update2-GA9">
				<div class="update2icon-PVf">2</div>
				<div class="item--sfj">경작 중</div>
				<div class="item--P8H">곡물이 건강하게 자라고 있어요</div>
			</div>

			<div class="update3-fTs">
				<div id="button" class="update3icon-b6d">3</div>
				<!-- <div class="item--sfj">수확 중</div> -->
				<div id="divToggle" class="updatedetail-fcH">
					<div class="auto-group-hs7j-Q45">
						<div class="item--X8h">수확 중</div>
						<div class="item--SmT">곡물을 수확하고 있어요</div>
					</div>
					<div class="auto-group-3qdt-9A5">
						<div class="wheat-18458351280-gfo"></div>
						<div class="auto-group-hkbx-LkM">
							<div class="auto-group-6tox-hL1">
								<div class="item--E53">수확 정보</div>
								<div class="item-20230915-7uX">2023.09.15</div>
							</div>
							<div class="item--pow">이렇게 자라고 있습니다 어쩌고 몇 키로 나올 것 같습니다 저쩌구구</div>
						</div>
					</div>
				</div>
			</div>

			<div class="update4-HZo">
				<div class="update4icon-cry">4</div>
				<div class="item--VQy">수확 완료</div>
				<div class="item--C4V">맛있는 곡물이 다 수확되었어요</div>
			</div>
		</div>
	<!-- </div> -->
</body>


</html>