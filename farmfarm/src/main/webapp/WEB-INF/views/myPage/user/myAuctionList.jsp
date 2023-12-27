<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
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

<body>
	<div class="mypage--Se9">
	<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
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
					src="${aList.auction_thumb_img_url}"
					<c:if test="${aList.product_status eq '경매중'}">
                		onclick="location.href='/auction/auctionDetail?product_serial_num=${fList.product_serial_num}'"
             		</c:if> />

				<div class="fundinginfo-B9X">
					<div class="auto-group-anxd-tCM">
						<p class="item--aqs">${aList.product_name}</p>
						<p class="item--UwF">${aList.farm_name}</p>
						<div class="auto-group-huhf-zPo">
							<img class="mdi-location-v2Z" src="./assets/location.png" />
							<p class="item--3cy">
								<c:choose>
									<c:when
										test="${not empty aList.farm_address and aList.farm_address.contains('')}">
										<c:set var="words" value="${aList.farm_address.split(' ')}" />
										<c:out value="${words[0]} ${words[1]}" />
									</c:when>
									<c:otherwise>
										<c:out value="${aList.farm_address}" />
									</c:otherwise>
								</c:choose>
							</p>
						</div>
					</div>
				</div>

				<div class="auctiondeadlinegroup-Nj7">
					<c:set var="days"
						value="${fn:substringBefore(Math.floor((aList.d_day)/1440), '.')}" />
					<c:set var="remainingHours"
						value="${fn:substringBefore(Math.floor(((aList.d_day)%1440) / 60), '.')}" />
					<c:set var="remainingMinutes" value="${(((aList.d_day)%1440)%60)}" />


					<div class="auctionremaining-VYq">${days}일
						${remainingHours}시간 ${remainingMinutes}분</div>
					<p class="auctiondeadline-pr1">${aList.auction_deadline} 마감</p>
				</div>

				<p class="fundingpay-7WM">${aList.max_user_price}p</p>
				<div class="fundingstate-MQh">${aList.product_status}</div>
				<div
					class="item--KJD ${aList.product_status eq '경매완료' and aList.auction_status eq 'X' ? 'failure' : ''}"
					id="auctionStatus">
					<c:choose>
						<c:when test="${aList.product_status eq '경매중'}">
				            진행중
				        </c:when>
						<c:when
							test="${aList.product_status eq '경매완료' and aList.auction_status eq 'O'}">
				            낙찰
				        </c:when>
						<c:when
							test="${aList.product_status eq '경매완료' and aList.auction_status eq 'X'}">
				            낙찰실패
				        </c:when>
						<c:when test="${aList.product_status eq '정산완료'}">
				            낙찰
				        </c:when>
						<c:otherwise>
							<!-- 다른 경우에 대한 처리 -->
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:forEach>

	</div>
</body>
</html>