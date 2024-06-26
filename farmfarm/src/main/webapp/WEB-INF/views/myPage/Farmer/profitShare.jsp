<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>정산 내역</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />
<link rel="stylesheet" href="${cpath}/styles/depositList_farmer.css" />
</head>
<body>
<button onclick="topFunction()" id="myBtn1" title="Go to top">Top</button>
	<div class="Content">
		<div class="content_tit">입금 내역</div>
		<div class="content_little_tit">
			<div class="content_little_content">프로젝트 정보</div>
			<div class="content_little_content">정산 일자</div>
			<div class="content_little_content">입금 계좌</div>
			<div class="content_little_content">정산 내역</div>
		</div>
		<c:forEach items="${depositList}" var="deposit" varStatus="status">
			<div class="content_detailall">
				<div class="content_num">${status.index + 1}</div>
				<div class="imgclass">
					<img src="${deposit.funding_thumb_img_url }" />
				</div>
				<div class="content_detail_firstAll">
					<div class="content_detail_first" >${deposit.product_name }</div>
					<div class="content_detail_second">${deposit.product_regdate }
						- ${deposit.sharing_date }</div>
					<div class="content_detail_third">
						<div class="locationImg">
							<img src="${cpath}/assets/mdi-location-CV3.png" />
						</div>
						<div class="locationText">${deposit.farm_address }</div>
					</div>
				</div>
				<div class="content_detail">${deposit.sharing_date }</div>
				<div class="content_detail">${deposit.farmer_bank }</br>${deposit.farmer_account }</div>
				<div class="content_detail2">
					￦
					<fmt:formatNumber value="${deposit.deposit}" pattern="#,###" />
				</div>
			</div>
		</c:forEach>
	</div>
</body>
<script>

//Get the button
var mybutton = document.getElementById("myBtn1");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

</script>
</html>