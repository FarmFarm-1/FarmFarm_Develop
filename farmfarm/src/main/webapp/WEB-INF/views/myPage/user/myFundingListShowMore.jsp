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
		$("#button1").click(function() {
			$("#divToggle1").toggle();
		});

		$("#button2").click(function() {
			$("#divToggle2").toggle();
		});
	});
	
	/* function button1() {
		var toogle1 = document.getElementById("divToggle1");
		if(toogle1.style.visibility == "hidden" ){
			toogle1.style.visibility = "visible";
		}else {
			toogle1.style.visibility = "hidden";
		}
		
	} */
</script>
<body>
	<div class="fundingupdatedetail">
		<span class="line"></span>

		<!-- 경작 준비중 -->
		<div id="button1" class="update1"> <!-- onclick=button1() -->
			<div class="update1icon">1</div>
			<div class="update1item1">경작 준비중</div>
			<!-- <div class="update1item2">경작이 곧 시작돼요.</div> -->
		</div>

		<div id="divToggle1" class="updatedetail-fcH">
			<div class="auto-group-hs7j-Q45">
				<div class="item--X8h">경작 준비중</div>
				<div class="item--SmT">경작이 곧 시작돼요.</div>
			</div>

			<div class="auto-group-3qdt-9A5">
				<img class="wheat-18458351280-gfo"
					src="${cpath }/assets/wheat-18458351280.png" />
				<!-- 바꿔야함 db에서 가져오는 사진 -->

				<div class="auto-group-hkbx-LkM">
					<div class="auto-group-6tox-hL1">
						<div class="item--E53">경작 준비중 정보</div>
						<div class="item-20230915-7uX">2023.09.15</div>
					</div>
					<div class="item--pow">이렇게 자라고 있습니다 어쩌고 몇 키로 나올 것 같습니다 저쩌구구</div>
				</div>
			</div>
		</div>

		<!-- 경작 중 -->
		<div id="button2" class="update2">
			<div class="update2icon">2</div>
			<div class="update2item1">경작 중</div>
			<!-- <div class="update2item2">작물이 건강하게 자라고 있어요.</div> -->
		</div>

		<div id="divToggle2" class="updatedetail-fcH2">
			<div class="auto-group-hs7j-Q452">
				<div class="item--X8h2">경작 중</div>
				<div class="item--SmT2">작물이 건강하게 자라고 있어요.</div>
			</div>

			<div class="auto-group-3qdt-9A52">
				<img class="wheat-18458351280-gfo2"
					src="${cpath }/assets/wheat-18458351280.png" />
				<!-- 바꿔야함 db에서 가져오는 사진 -->

				<div class="auto-group-hkbx-LkM2">
					<div class="auto-group-6tox-hL12">
						<div class="item--E532">경작 중 정보</div>
						<div class="item-20230915-7uX2">2023.09.15</div>
					</div>
					<div class="item--pow2">이렇게 자라고 있습니다 어쩌고 몇 키로 나올 것 같습니다 저쩌구구</div>
				</div>
			</div>
		</div>

		<!-- 

		<div class="update3">
			<div id="button" class="update3icon">3</div>
			<div class="item--sfj">수확 중</div>
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

		<div class="update4">
			<div class="update4icon">4</div>
			<div class="item--VQy">수확 완료</div>
			<div class="item--C4V">맛있는 곡물이 다 수확되었어요</div>
		</div> -->

	</div>
</body>


</html>