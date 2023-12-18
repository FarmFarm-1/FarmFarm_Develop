<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cpath}/styles/usedfarmmoney.css" />

</head>
<body>
<h1>"${showSearchDate.update_date}"</h1>
	<div id="Content">
		<!-- Content -->
		<div class="content_tit">팜머니 내역</div>
		<div class="searchDate">
			<div class="searchDateBigText">조회 기간</div>
				<div class="callendar">
					<input type="date" id="startDate" name="startDate">
					<p>-</p>
					<input type="date" id="endDate" name="endDate">
					<button id="dateSearchBtn" onclick="">검색</button>
				</div>
			<div class="searchDateSmallText">
				최근 1년 이내, 최대 3개월 중 일 단위로 선택할 수 있습니다.
			</div>
		</div>
		<c:forEach items="${showSearchDate}" var="showSearchDate" varStatus="status">
			<%-- 	<c:if test="${farmlist.update_date >= startDate && farmlist.update_date <= endDate}"> --%>
			<div class="content_little_date"
				style="display:${showSearchDate[status.index].update_date==showSearchDate[(status.index-1)].update_date?'none':'show' }"
				id="farmdate">${showSearchDate.update_date}</div>
			<div class="content_detailall">
				<div class="historyImg">
					<img src="${cpath}/assets/paymenticon-MPK.png" />
				</div>
				<div class="content_detail_firstAll">
					<div class="content_detail_first">사용</div>
					<div class="content_detail_second">오후 03:55</div>
				</div>
				<div class="productImg">
					<img src="${cpath}/assets/tomatoes-55667411280-VTB.png" />
				</div>
				<div class="content_detail_secondAll">
					<div class="content_detail2_first">${showSearchDate.product_name }</div>
					<div class="content_detail2_second">${showSearchDate.farm_name }</div>
				</div>
				<div class="arrowImg">
					<img src="${cpath}/assets/group-uQq.png" />
				</div>
				<div class="historyText">${showSearchDate.history_content}</div>
				<div class="farmMoney">
					<c:choose>
						<c:when test="${showSearchDate.history_content ne '참여'}">
							<div class="farmMoneyValue">
								-
								<fmt:formatNumber value="${showSearchDate.amount}" pattern="#,###" />
							</div>
						</c:when>
						<c:otherwise>
							<div class="farmMoneyValue">
								+
								<fmt:formatNumber value="${showSearchDate.amount}" pattern="#,###" />
							</div>
						</c:otherwise>
					</c:choose>
					<div class="farmMoneyText">팜머니</div>
				</div>
			</div>
			<%-- </c:if> --%>
		</c:forEach>
		<!-- Content -->
	</div>
	<script>
		function submitForm() {
			document.getElementById("dateSearch").submit();
		}

		let startDateInput = document.getElementById("startDate");
		let endDateInput = document.getElementById("endDate");
		startDateInput.value = "";
		endDateInput.value = "";
		// 현재 날짜를 가져오는 함수
		function getCurrentDate() {
			const today = new Date();
			const year = today.getFullYear();
			let month = today.getMonth() + 1;
			let day = today.getDate();

			// 월과 일이 한 자리 수인 경우 앞에 0을 추가
			month = month < 10 ? '0' + month : month;
			day = day < 10 ? '0' + day : day;
			return `${year}-${month}-${day}`;
		}

		// 시작일과 마감일의 최소값과 최대값 설정
		startDateInput.min = getCurrentDate();
		endDateInput.min = getCurrentDate();

		startDateInput.addEventListener('change', function() {
			endDateInput.min = startDateInput.value;
		});

		endDateInput.addEventListener('change', function() {
			startDateInput.max = endDateInput.value;
		});
	</script>
</body>
</html>