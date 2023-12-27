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
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body>

	<!-- 경작 준비중 -->
<div id="show_more_outer_${product_serial_num}" class="show_more_outer">
	<button class="accordion">
		<div class="button-align">
			<div class="update1icon">1</div>
			<div class="update1item1">경작준비중</div>
			<div class="item--SmT">경작이 곧 시작돼요</div>
		</div>
		<div class="panel-align">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '경작준비중'}">
					<div class="panel">
						<div class="auto-group-3qdt-9A5">
							<img class="wheat-18458351280-gfo" src="${f.cultivating_image}" />
							<div class="auto-group-hkbx-LkM">
								<div class="auto-group-6tox-hL1">
									<div class="item--E53">경작준비중 정보</div>
									<div class="item-20230915-7uX">${f.update_date}</div>
								</div>
								<div class="item--pow">${f.cultivating_content}</div>
							</div>	
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</button>
	

	<!-- 경작 중 -->
	<button class="accordion">
		<div class="button-align">
			<div class="update1icon">2</div>
			<div class="update1item1">경작중</div>
			<div class="item--SmT">작물이 건강하게 자라고 있어요</div>
		</div>		
		<div class="panel-align">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '경작중'}">
					<div class="panel">
						<div class="auto-group-3qdt-9A5">
							<img class="wheat-18458351280-gfo" src="${f.cultivating_image}" />
							<div class="auto-group-hkbx-LkM">
								<div class="auto-group-6tox-hL1">
									<div class="item--E53">경작중 정보</div>
									<div class="item-20230915-7uX">${f.update_date}</div>
								</div>
								<div class="item--pow">${f.cultivating_content}</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</button>
	
	<button class="accordion">
		<div class="button-align">
			<div class="update1icon">3</div>
			<div class="update1item1">수확중</div>
			<div class="item--SmT">작물을 수확하고 있어요</div>
		</div>	
		<div class="panel-align">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '수확중'}">
					<div class="panel">
						<div class="auto-group-3qdt-9A5">
							<img class="wheat-18458351280-gfo" src="${f.cultivating_image}" />
							<div class="auto-group-hkbx-LkM">
								<div class="auto-group-6tox-hL1">
									<div class="item--E53">수확중 정보</div>
									<div class="item-20230915-7uX">${f.update_date}</div>
								</div>
								<div class="item--pow">${f.cultivating_content}</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</button>
	
	<button class="accordion">
		<div class="button-align">
			<div class="update1icon">4</div>
			<div class="update1item1">수확완료</div>
			<div class="item--SmT">작물 수확을 완료했어요</div>
		</div>
		<div class="panel-align">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '수확완료'}">
					<div class="panel">
						<div class="auto-group-3qdt-9A5">
							<img class="wheat-18458351280-gfo" src="${f.cultivating_image}" />
							<div class="auto-group-hkbx-LkM">
								<div class="auto-group-6tox-hL1">
									<div class="item--E53">수확완료 정보</div>
									<div class="item-20230915-7uX">${f.update_date}</div>
								</div>
							</div>
							<div class="item--pow">${f.cultivating_content}</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</button>
	
</div>
<script>
document.querySelectorAll("#show_more_outer_${product_serial_num} button").forEach(function(button) {
	button.addEventListener('click', function() {
		this.classList.toggle('is-open');
		var content = this.querySelectorAll('.panel');
		content.forEach(function(panel) {
			if (panel.style.display === 'none' || !panel.style.display) {
				panel.style.display = 'flex'; // 클릭했을 때 display를 'flex'로 설정
			} else {
				panel.style.display = 'none'; // 클릭하지 않았을 때 display를 'none'으로 설정
			}
		});
	
	});
});
</script>

</body>
</html>
