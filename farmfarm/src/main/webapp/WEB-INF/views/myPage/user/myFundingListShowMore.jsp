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
	<button class="accordion">
		<div class="update1icon">1</div>
		<div class="update1item1">경작준비중</div>
	</button>
	<div class="panel">
		<div class="auto-group-hs7j-Q45">
			<div class="item--X8h">경작준비중</div>
			<div class="item--SmT">경작이 곧 시작돼요.</div>
		</div>

		<div class="auto-group-3qdt-9A5">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '경작준비중'}">
					<img class="wheat-18458351280-gfo"
					src="${f.cultivating_image}" />
									
				</c:if>
			</c:forEach>
			
			<!-- 바꿔야함 db에서 가져오는 사진 -->

			<div class="auto-group-hkbx-LkM">
				<div class="auto-group-6tox-hL1">
					<div class="item--E53">경작준비중 정보</div>
					<div class="item-20230915-7uX">
						<c:forEach items="${fundingDetail}" var="f">
							<%-- ${f.cultivate_status} --%>
							<c:if test="${f.cultivate_status eq '경작준비중'}">
									${f.update_date}
								</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="item--pow">
					<!-- 이렇게 자라고 있습니다 어쩌고 몇 키로 나올 것 같습니다 저쩌구구 -->
					<c:forEach items="${fundingDetail}" var="f">
						<%-- ${f.cultivate_status} --%>
						<c:if test="${f.cultivate_status eq '경작준비중'}">
									${f.cultivating_content}
								</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- 경작 중 -->
	<button class="accordion">
		<div class="update1icon">2</div>
		<div class="update1item1">경작중</div>
	</button>
	<div class="panel">
		<div class="auto-group-hs7j-Q45">
			<div class="item--X8h">경작중</div>
			<div class="item--SmT">작물이 건강하게 자라고 있어요.</div>
		</div>

		<div class="auto-group-3qdt-9A5">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '경작중'}">
					<img class="wheat-18458351280-gfo"
					src="${f.cultivating_image}" />
									
				</c:if>
			</c:forEach>

			<div class="auto-group-hkbx-LkM">
				<div class="auto-group-6tox-hL1">
					<div class="item--E53">경작중 정보</div>
					<div class="item-20230915-7uX">
						<c:forEach items="${fundingDetail}" var="f">
							<%-- ${f.cultivate_status} --%>
							<c:if test="${f.cultivate_status eq '경작중'}">
									${f.update_date}
								</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="item--pow">
					<c:forEach items="${fundingDetail}" var="f">
						<%-- ${f.cultivate_status} --%>
						<c:if test="${f.cultivate_status eq '경작중'}">
									${f.cultivating_content}
								</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<button class="accordion">
		<div class="update1icon">3</div>
		<div class="update1item1">수확중</div>
	</button>
	<div class="panel">
		<div class="auto-group-hs7j-Q45">
			<div class="item--X8h">수확중</div>
			<div class="item--SmT">작물을 수확하고 있어요.</div>
		</div>

		<div class="auto-group-3qdt-9A5">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '수확중'}">
					<img class="wheat-18458351280-gfo"
					src="${f.cultivating_image}" />
									
				</c:if>
			</c:forEach>

			<div class="auto-group-hkbx-LkM">
				<div class="auto-group-6tox-hL1">
					<div class="item--E53">수확중 정보</div>
					<div class="item-20230915-7uX">
						<c:forEach items="${fundingDetail}" var="f">
							<%-- ${f.cultivate_status} --%>
							<c:if test="${f.cultivate_status eq '수확중'}">
									${f.update_date}
								</c:if>
						</c:forEach>
					</div>
				</div>
				<div class="item--pow">
					<c:forEach items="${fundingDetail}" var="f">
						<%-- ${f.cultivate_status} --%>
						<c:if test="${f.cultivate_status eq '수확중'}">
									${f.cultivating_content}
								</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<button class="accordion">
		<div class="update1icon">4</div>
		<div class="update1item1">수확완료</div>
	</button>
	<div class="panel">
		<div class="auto-group-hs7j-Q45">
			<div class="item--X8h">수확완료</div>
			<div class="item--SmT">작물 수확을 완료했어요.</div>
		</div>

		<div class="auto-group-3qdt-9A5">
			<c:forEach items="${fundingDetail}" var="f">
				<c:if test="${f.cultivate_status eq '수확완료'}">
					<img class="wheat-18458351280-gfo"
					src="${f.cultivating_image}" />
									
				</c:if>
			</c:forEach>

			<div class="auto-group-hkbx-LkM">
				<div class="auto-group-6tox-hL1">
					<div class="item--E53">수확완료 정보</div>
					<div class="item-20230915-7uX">
						<c:forEach items="${fundingDetail}" var="f">
							<%-- ${f.cultivate_status} --%>
							<c:if test="${f.cultivate_status eq '수확완료'}">
									${f.update_date}
								</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="item--pow">
				<c:forEach items="${fundingDetail}" var="f">
					<%-- ${f.cultivate_status} --%>
					<c:if test="${f.cultivate_status eq '수확완료'}">
									${f.cultivating_content}
								</c:if>
				</c:forEach>
			</div>
		</div>
	</div>





	<!-- java script -->
	<!-- <script>
		var accordions = document.getElementsByClassName("accordion");

		for (var i = 0; i < accordions.length; i++) {
			accordions[i].onclick = function() {
				this.classList.toggle('is-open');

				var content = this.nextElementSibling;
				if (content.style.maxHeight) {
					// accordion is currently open, so close it
					content.style.maxHeight = null;
				} else {
					// accordion is currently closed, so open it
					content.style.maxHeight = content.scrollHeight + "rem";
				}
			}
		}
	</script> -->
	<script>
		//const cultivateStatus = ; //"경작중"
		const cultivateStatus = "${status}";
		console.log(cultivateStatus);
		const stautsArray = [ "경작준비중", "경작중", "수확중", "수확완료" ];
		var accordions = document.getElementsByClassName("accordion");

		for (var i = 0; i <= stautsArray.indexOf(cultivateStatus); i++) {
			accordions[i].onclick = function() {
				this.classList.toggle('is-open');

				var content = this.nextElementSibling;
				if (content.style.maxHeight) {
					// accordion is currently open, so close it
					content.style.maxHeight = null;
				} else {
					// accordion is currently closed, so open it
					content.style.maxHeight = content.scrollHeight + "rem";
				}
			}
		}
	</script>

</body>

</html>