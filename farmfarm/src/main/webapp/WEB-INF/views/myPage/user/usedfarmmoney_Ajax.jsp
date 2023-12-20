<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!-- Content -->
<div class="Content">
	<!-- forEach -->
	<c:forEach items="${showSearchDate}" var="pointItem" varStatus="status">
		<c:set var="path2" value="${cpath}/assets/paymenticon-MPK.png" />
		<c:set var="path3" value="${cpath}/assets/paymenticon-aA.png" />
		<c:set var="historyImg1" value="${cpath}/assets/paymenticon-aA.png" />
		<c:set var="historyImg2" value="${cpath}/assets/paymenticon-dTB.png" />
		<c:set var="historyImg3" value="${cpath}/assets/paymenticon-MPK.png" />
		<c:set var="history_content1"
			value="${fn:contains(showSearchDate[status.index].history_content, '참여')}" />
		<c:set var="history_content2"
			value="${fn:contains(showSearchDate[status.index].history_content, '실패')}" />

		<c:set var="history_content3"
			value="${fn:contains(farmList[status.index].history_content, '펀딩')}" />
		<c:set var="fundingPath"
			value="${cpath}/funding/fundingDetail?product_serial_num=${farmlist.product_serial_num}" />
		<c:set var="auctionPath"
			value="${cpath}/auction/auctionDetail?product_serial_num=${farmlist.product_serial_num}" />

		<div class="content_little_date"
			style="display:${showSearchDate[status.index].update_date==showSearchDate[(status.index-1)].update_date?'none':'show' }"
			id="farmdate">${pointItem.update_date}</div>
		<div class="content_detailall">
			<div class="historyImg">
				<img
					src="${history_content1 ? historyImg3 : history_content2 ? historyImg2 : historyImg1} " />
			</div>
			<div class="content_detail_firstAll">
				<div class="content_detail_first">${history_content1 ? '사용' : history_content2 ? '환불' : '충전' }</div>
				<div class="content_detail_second">${pointItem.update_time}</div>
			</div>
			<div class="productImg">
				<img src="${cpath}/assets/tomatoes-55667411280-VTB.png"
					style="visibility: ${history_content1 ? 'visible' : history_content2 ? 'visible' : 'hidden'}" />
			</div>
			<div class="content_detail_secondAll">
				<a class="content_detail2_first"
					href="${history_content3 ? fundingPath : auctionPath}">${farmlist.product_name }</a>
				<div class="content_detail2_second">${pointItem.farm_name }</div>
			</div>
			<div class="arrowImg">
				<img src="${cpath}/assets/group-uQq.png"
					style="visibility: ${history_content1 ? 'visible' : history_content2 ? 'visible' : 'hidden'}" />
			</div>
			<div class="historyText">${pointItem.history_content}</div>
			<div class="farmMoney">
				<div class="farmMoneyValue">
					${history_content1 ? '-' : '+'}
					<fmt:formatNumber value="${pointItem.amount}" pattern="#,###" />
				</div>
				<div class="farmMoneyText">팜머니</div>
			</div>
		</div>
	</c:forEach>
	<!--//forEach -->
</div>
<!--//Content -->