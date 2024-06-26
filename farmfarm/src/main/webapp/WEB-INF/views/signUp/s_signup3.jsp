<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="${cpath }/favicon/farmfarmfavicon.png" type="image/x-icon" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>팜팜</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C700" />

<link rel="stylesheet" href="./styles/signup3.css" />
</head>
<body>
	<div class="mainpage--BGh">
		<div class="group-174-idK">

			<!-- <p class="item--rDj">회원가입</p> -->

			<div class="auto-group-npnm-LPo">

				<div class="rectangle-90-p451">
					<p class="item--3b31">파머</p>
				</div>

				<div class="rectangle-98-XjB1">
					<p class="item--MCR1">농작물을 투자/구매하고 싶어요!</p>
				</div>

				<div class="rectangle-89-trZ">

					<div class="term_status">
						<div class="rectangle-93-xV3"></div>
						<div class="rectangle-95-65T"></div>
						<div class="ellipse-4-1TK"></div>
						<div class="ellipse-5-ju7"></div>
						<img class="group-101-aoF" src="./assets/orange_circle.png" /> <img
							class="uim-check-XCh" src="./assets/check_img.png" /> <img
							class="uim-check-rVs" src="./assets/check_img.png" />
					</div>

					<div class="term_status2">
						<p class="item--Gu3">약관 동의</p>
						<p class="item--NhB">정보 입력</p>
						<p class="item--UVK">가입 완료</p>
					</div>

					<div class="ellipse-9-bTT"></div>
					<img class="ant-design-idcard-outlined-KeM"
						src="./assets/join_img.png" />

					<div class="item--d3T">회원가입 완료</div>
					<div class="item--hp1">
						${signup_name}님의 <br /> 회원가입이 완료되었습니다.
					</div>
				</div>
			</div>
			<div onclick="location.href='login'" class="group-99-34Z">로그인</div>
		</div>
	</div>
</body>
</html>