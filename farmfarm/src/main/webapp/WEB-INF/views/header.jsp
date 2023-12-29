<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="cpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${cpath }/favicon/farmfarmfavicon.png" type="image/x-icon" />
<title>팜팜</title>
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
                    menu_funding.style.fontWeight  = '800';
                    var elements = document.getElementsByClassName('underbar-1');
                    if (elements.length > 0) {
                        elements[0].classList.remove('hidden');
                    }
                } else if (headerSelect === "auction") {
                    menu_auction.style.color = '#2d2d2d';
                    menu_auction.style.fontWeight  = '800';
                    var elements = document.getElementsByClassName('underbar-2');
                    if (elements.length > 0) {
                        elements[0].classList.remove('hidden');
                    }
                } else if (headerSelect === "myFarm") {
                    menu_myFarm.style.color = '#2d2d2d';
                    menu_myFarm.style.fontWeight  = '800';
                    var elements = document.getElementsByClassName('underbar-3');
                    if (elements.length > 0) {
                        elements[0].classList.remove('hidden');
                    }
                }
            });
    function selectMyFarm() {
        var curUser = "${sessionScope.serial_num}";
        if (curUser == "") {
            //header_join_login 띄움
            showModal_success("로그인이 필요한 기능입니다.");
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
            }
        });
    }
    
    function directLink(path, formName, pathVariableId) {
	   	document.getElementById(pathVariableId).value = path;
		document.getElementById(formName).submit();
    }
    function makeProject() {
    	$.ajax({
    		url : "${cpath}/myPageFarmer/checkFarmerAccount",
    		method : "POST",
    		success: function(res) {
    			if(res == 'success') {
    				directLink('makeProject','makeProjectForm', 'makeProjectPathInput');
    			} else {
    				showModal_myproject("WARNING","계좌 등록 후, 상품 등록이 가능합니다");
    				/* directLink('accountRegister','regAccountFarmerForm', 'regAccountPathInput'); */
    			}
    		}
    	});
    }
</script>
<body>
	<div class="header">
		<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
		<div class="header_div">
			<div class="header_main">
				<div class="header_title_menu">
					<div class="header_title">
						<a onclick="location.href='${cpath}/'"> <img class="logo_img"
							src="${cpath }/assets/logo_sweetpotato.png" />
							<p class="logo_name">팜팜</p>
						</a>
					</div>
					<div class="header_menu">
						<div class="menu_funding">
							<a id="menu_funding"
								onclick="location.href='${cpath}/funding/fundingMain'">펀딩</a>

						</div>
						<div class="underbar-1 hidden"></div>
						<div class="menu_auction">
							<a id="menu_auction"
								onclick="location.href='${cpath}/auction/auctionMain'">경매</a>
						</div>
						<div class="underbar-2 hidden"></div>
						<div class="menu_myFarm">
							<a id="menu_myFarm" onclick="selectMyFarm()">마이팜</a>
						</div>
						<div class="underbar-3 hidden"></div>
					</div>
				</div>
				<div class="header_join_login" id="header_join_login">
					<a href="${cpath}/signup" onclick="resetHeaderSelect()">회원가입&nbsp;</a> <a
						href="${cpath}/login" onclick="resetHeaderSelect()">로그인</a>
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

					<p class="logout" onclick="location.href='${cpath}/logout'">로그아웃</p>

					<form id="myFarmMoneyForm" action="${cpath}/myPageUser" method="post">
					    <input type="hidden" name="path" id="farmMoneyPathInput" />
	                    <div class="userPoint_div"
	                        onclick="directLink('farmMoneyCharge','myFarmMoneyForm','farmMoneyPathInput')">
	                        내 팜머니 : <span class="userPoints"></span>P
	                    </div>
	                </form>
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
          
          <p class="flogout" onclick="location.href='${cpath}/logout'">로그아웃</p>
          
					<form id="makeProjectForm" action="${cpath}/myPageFarmer" method="post">
					    <input type="hidden" name="path" id="makeProjectPathInput" />
	                    <div class="myProject"
	                        onclick="makeProject()">나의 프로젝트 만들기</div>
                    </form>
                    <form id="regAccountFarmerForm" action="${cpath}/myPageFarmer" method="post">
					    <input type="hidden" name="path" id="regAccountPathInput" />
                    </form>
				</div>
			</div>
		</div>
	</div>
	<div class="header_line"></div>
</body>
</html>
