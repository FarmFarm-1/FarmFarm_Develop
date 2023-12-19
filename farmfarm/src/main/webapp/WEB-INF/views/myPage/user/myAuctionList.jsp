<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myAuctionList</title>
</head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet" href="${cpath }/styles/myAuctionList.css" />
<script>

</script>
<body>



 	<%-- 현재 시간을 가져오기 --%>
    <%
        Date currentDate = new Date();
        pageContext.setAttribute("currentDate", currentDate);
    %>

    <%-- JSTL을 사용하여 현재 시간을 포맷해서 출력 --%>
    <fmt:formatDate value="${currentDate}" pattern="yy-MM-dd HH:mm" var="formattedDate" />

    <h1>현재 시간: ${formattedDate}</h1>

	<div class="mypage--Se9">
		<!-- 고정 -->
		<p class="item--ydo">경매에 참여 내역을 확인해보세요.</p>
		<div class="fundinglistheader-H8h">
			<p class="item--CmT">상품 정보</p>
			<p class="item--ufs">남은 시간</p>
			<p class="item--DwT">현재 최고 입찰가</p>
			<p class="item--juo">경매 진행 상태</p>
			<p class="item--E5s">낙찰 진행 상태</p>
		</div>

		<!-- 경매 리스트 -->
		<c:forEach items="${myAuctionList }" var="aList">
	
		
			<div class="fundinglist1-giZ">
				<img class="tomatoes-55667411280-5Eu"
					src="${cpath }/assets/tomatoes.png" />

				<div class="fundinginfo-B9X">
					<div class="auto-group-anxd-tCM">
						<p class="item--aqs">${aList.product_name}</p>
						<p class="item--UwF">${aList.farm_name}</p>
						<div class="auto-group-huhf-zPo">
							<img class="mdi-location-v2Z" src="./assets/location.png" />
							<p class="item--3cy">${aList.farm_address}</p>
						</div>
					</div>
				</div>

				<div class="auctiondeadlinegroup-Nj7">
					<div class="auctionremaining-VYq">15시간 23분</div>
					<p class="auctiondeadline-pr1">${aList.auction_deadline}마감</p>
				</div>

				<p class="fundingpay-7WM">${aList.max_user_price}p</p>
				<!--  -->
				<div class="fundingstate-MQh">${aList.product_status}</div>
				<div class="item--KJD">낙찰</div>
				<!-- 낙찰 실패 -->

			</div>


		</c:forEach>

	</div>




</body>

</html>