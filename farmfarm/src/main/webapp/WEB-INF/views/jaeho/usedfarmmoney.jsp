<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${cpath}/styles/usedfarmmoney.css" />

</head>
<body>
	<!-- 날짜 -->
	<div class="content_tit">팜머니 내역</div>
	<div class="searchDate">
		<div class="searchDateBigText">조회 기간</div>

		<div class="callendar">
			<%-- <input type="hidden" id="update_date" name="update_date" value="${farmList[0].update_date}"> --%>
			<input type="date" id="startDate" name="startDate">
			<p>-</p>
			<input type="date" id="endDate" name="endDate">
		</div>
		<div class="searchDateSmallText">최근 1년 이내, 최대 3개월 중 일 단위로 선택할 수
			있습니다.</div>
		<button class="dateSearchBtn" id="dateSearchBtn"
			onclick="searchDate()">검색</button>
	</div>
	<!-- Content -->
	<div class="Content">
		<!-- forEach -->

		<c:forEach items="${farmList}" var="farmlist" varStatus="status">
			<c:set var="path2" value="${cpath}/assets/paymenticon-MPK.png" />
			<c:set var="path3" value="${cpath}/assets/paymenticon-aA.png" />
			<c:set var="historyImg1" value="${cpath}/assets/paymenticon-aA.png" />
			<c:set var="historyImg2" value="${cpath}/assets/paymenticon-dTB.png" />
			<c:set var="historyImg3" value="${cpath}/assets/paymenticon-MPK.png" />
			<c:set var="history_content1"
				value="${fn:contains(farmList[status.index].history_content, '참여')}" />
			<c:set var="history_content2"
				value="${fn:contains(farmList[status.index].history_content, '실패')}" />
			
			<div class="content_little_date"
				style="display:${farmList[status.index].update_date==farmList[(status.index-1)].update_date?'none':'show' }"
				id="farmdate">${farmlist.update_date}</div>
			<div class="content_detailall">
				<div class="historyImg">
					<img
						src="${history_content1 ? historyImg3 : history_content2 ? historyImg2 : historyImg1} " />
				</div>
				<div class="content_detail_firstAll">
					<div class="content_detail_first">${history_content1 ? '사용' : history_content2 ? '환불' : '충전' }</div>
					<div class="content_detail_second">${farmlist.update_time}</div>
				</div>
				<div class="productImg">
					<img src="${cpath}/assets/tomatoes-55667411280-VTB.png"
						style="visibility: ${history_content1 ? 'visible' : history_content2 ? 'visible' : 'hidden'}" />
				</div>
				<div class="content_detail_secondAll">
					<div class="content_detail2_first">${farmlist.product_name }</div>
					<div class="content_detail2_second">${farmlist.farm_name }</div>
				</div>
				<div class="arrowImg">
					<img src="${cpath}/assets/group-uQq.png"
						style="visibility: ${history_content1 ? 'visible' : history_content2 ? 'visible' : 'hidden'}" />
				</div>
				<div class="historyText">${farmlist.history_content}</div>
				<div class="farmMoney">
					<div class="farmMoneyValue">
						${history_content1 ? '-' : '+'}
						<fmt:formatNumber value="${farmlist.amount}" pattern="#,###" />
					</div>
					<div class="farmMoneyText">팜머니</div>
				</div>
			</div>
		</c:forEach>
		<!--//forEach -->
	</div>
	<!--//Content -->
	<script>
		let startDateInput = document.getElementById("startDate");
		let endDateInput = document.getElementById("endDate");

		function searchDate() {
			$.ajax({
				url : "${cpath}/jaeho/searchDate",
				data : {
					"startDate" : $("#startDate").val(),
					"endDate" : $("#endDate").val()
				},
				type : "post",
				success : function(res) {
					$(".Content").html(res);
				}
			});
		}

		function submitForm() {
			document.getElementById("dateSearch").submit();
		}

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