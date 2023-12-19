<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarmFarm Header</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />

<link rel="stylesheet" href="${cpath }/styles/header.css" />
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
	var curUser = "${sessionScope.serial_num}";
	var headerSelect = "${sessionScope.headerSelect}";

	$(window).on(
			"load",
			function() {
				var header_join_login = document
						.querySelector('#header_join_login');
				var header_user_login = document
						.querySelector('#header_user_login');
				var header_farmer_login = document
						.querySelector('#header_farmer_login');

				var menu_funding = document.querySelector('#menu_funding');
				var menu_auction = document.querySelector('#menu_auction');
				var menu_myFarm = document.querySelector('#menu_myFarm');

				if (curUser == "") {
					//header_join_login 띄움
					header_join_login.style.display = 'flex';
				} else {
					if (curUser.substring(0, 2) === "us") {
						//header_user_login 띄움
						header_user_login.style.display = 'flex';
						showPamMoney();

					} else if (curUser.substring(0, 2) === "FA") {
						//header_farmer_login 띄움
						header_farmer_login.style.display = 'flex';
					}
				}

				if (headerSelect === "funding") {
					menu_funding.style.color = '#2d2d2d';
				} else if (headerSelect === "auction") {
					menu_auction.style.color = '#2d2d2d';
				} else if (headerSelect === "myFarm") {
					menu_myFarm.style.color = '#2d2d2d';
				}
			});

	function selectMyFarm() {
		var curUser = "${sessionScope.serial_num}";

		if (curUser == "") {
			//header_join_login 띄움
			alert('로그인 해주세요.');
		} else {
			if (curUser.substring(0, 2) === "us") {
				//header_user_login 띄움
				location.href = '/myPageUser';

			} else if (curUser.substring(0, 2) === "FA") {
				//header_farmer_login 띄움
				location.href = '/myPageFarmer';
			}
		}

	}


	function showPamMoney() {
		$.ajax({
			url : '/myPageUser/navBarCnt',
			type : 'GET',
			success : function(response) {
				let userPoint = response.userPoint.toLocaleString('ko-KR');

				$(".userPoints").html(userPoint);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}
</script>

<body>
	<div class="header">
		<div class="header_div">
			<div class="header_main">
				<div class="header_title_menu">
					<div class="header_title">
						<a onclick="location.href='${cpath}/main'"> <img
							class="logo_img" src="${cpath }/assets/logo.png" />
							<p class="logo_name">팜팜</p>
						</a>
					</div>
					<div class="header_menu">
						<div class="menu_funding">
							<a id="menu_funding"
								onclick="location.href='${cpath}/funding/fundingMain'">펀딩</a>
						</div>
						<div class="menu_auction">
							<a id="menu_auction"
								onclick="location.href='${cpath}/auction/auctionMain'">경매</a>
						</div>
						<div class="menu_myFarm">
							<a id="menu_myFarm" onclick="selectMyFarm()">마이팜</a>
						</div>
					</div>
				</div>

				<div class="header_join_login" id="header_join_login">
					<a onclick="location.href='${cpath}/signup'">회원가입&nbsp;</a> <a
						onclick="location.href='${cpath}/login'">로그인</a>
				</div>

				<div class="header_user_login" id="header_user_login">
					<div class="messageBox_div"
						onclick="location.href='${cpath}/messageBox'">
						<img class="messageBox_img" src="${cpath }/assets/messageBox.png">
						<p class="messageBox_text">쪽지함</p>
						<!-- 새로운 쪽지가 있으면  newMessage가 보인다.-->
						<div class="newMessage" id="newMessage">
							<p class="red_rectangle"></p>
							<p class="new_text">N</p>
						</div>
					</div>
					<div class="userPoint_div"
						onclick="location.href='${cpath}/chargePoints'">
						내 팜머니 : <span class="userPoints">1,000,000,000</span>p
					</div>
				</div>

				<div class="header_farmer_login" id="header_farmer_login">
					<div class="messageBox_div2"
						onclick="location.href='${cpath}/messageBox'">
						<img class="messageBox_img2" src="${cpath }/assets/messageBox.png">
						<p class="messageBox_text2">쪽지함</p>
						<!-- 새로운 쪽지가 있으면  newMessage가 보인다.-->
						<div class="newMessage2" id="newMessage2">
							<p class="red_rectangle2"></p>
							<p class="new_text2">N</p>
						</div>
					</div>
					<div class="myProject"
						onclick="location.href='${cpath }/makeProject'">나의 프로젝트 만들기</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header_line"></div>
</body>
</html>