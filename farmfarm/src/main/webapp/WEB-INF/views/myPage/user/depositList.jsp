<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${cpath}/styles/depositList.css" />
<div class="Content">
	<div class="content_tit">정산 내역</div>
	<div class="content_little_tit">
		<div class="content_little_content">프로젝트 정보</div>
		<div class="content_little_content">정산 일자</div>
		<div class="content_little_content">입금 계좌</div>
		<div class="content_little_content">정산 내역</div>
	</div>
	<c:forEach items="${depositList}" var="pointItem" varStatus="status">
		<div class="content_detailall">
			<div class="content_num">${status.index + 1}</div>
			<div class="imgclass">
				<img src="${pointItem.funding_thumb_img_url }" />
			</div>
			<div class="content_detail_firstAll">
				<div class="content_detail_first">${pointItem.product_name }</div>
				<div class="content_detail_second">${pointItem.farm_name }</div>
				<div class="content_detail_third">
					<div class="locationImg">
						<img src="${cpath}/assets/mdi-location-CV3.png" />
					</div>
					<div class="locationText">${pointItem.farm_address }</div>
				</div>
			</div>
			<div class="content_detail">${pointItem.sharing_date }</div>
			<div class="content_detail">${pointItem.user_bank }</br>${pointItem.user_account }</div>
			<div class="content_detail2">
				￦
				<fmt:formatNumber value="${pointItem.deposit}" pattern="#,###" />
			</div>
		</div>
	</c:forEach>
</div>
