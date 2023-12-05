<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>mainpage/경매/상세 조회</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700%2C800" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C700%2C800" />
<link rel="stylesheet" href="/styles/auctionDetail.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="fromHeaderToMainBottom">
		<div class="auto-group-kfzx-KY9">
			<div class="material-symbols-bookmark-outline-BAM"></div>
			<div class="wheat-18458351280-TNm"></div>
			<p class="kg-q8R">${auctionInfo.product_name}</p>
			<p class="item-577--iCD">
				<span class="item-577--iCD-sub-1">현재 참여자 </span> <span
					class="item-577--iCD-sub-0">${maxAndCntInfo.participant_cnt}</span>
			</p>
			<div class="group-90-XBb">D - 14</div>
			<p class="item-33207900-4aq">
				<span class="item-33207900-4aq-sub-0">최고 입찰가 </span> 
				<span class="item-33207900-4aq-sub-1">${maxAndCntInfo.max_auction_price}</span>
				<span class="item-33207900-4aq-sub-2"> 원</span>
			</p>
			<div class="rectangle-104-1RX"></div>
			<div class="rectangle-90-h3T"></div>
			<div class="group-91-LcD">
				<p class="item--2E9">스토리 더보기</p>
				<img class="outline-chevron-down-5CR"
					src="/assets/arrow_see_more.png" />
			</div>
			<p class="item--MQq">프로젝트 스토리</p>
			<div class="rectangle-105-MJM"></div>
			<div class="rectangle-117-RZ7"></div>
			<div class="material-symbols-bookmark-outline-LRB"></div>
			<div class="rectangle-70-4MB"></div>
			<p class="item--Af7">${auctionInfo.farmer_name}</p>
			<div class="ellipse-22-oxy"></div>
			<p class="item--Vqo">농장 주소</p>
			<p class="item--BTj">농장 면적</p>
			<p class="item--t7F">농작물 종류</p>
			<p class="item--mwj">수확 완료일</p>
			<p class="item--n69">파머 연락처</p>
			<p class="item--gSR">농장명</p>
			<p class="item--nkM">출하량</p>
			<p class="kg-6m3">${auctionInfo.harvest_amount}kg</p>
			<p class="item-800000-R2d">${auctionInfo.starting_price}원</p>
			<p class="item--vEH">단위당 단가(경매시작가)</p>
			<p class="api--zV3">####해당 농산물의 시세 api####</p>
			<div class="rectangle-118-HDF"></div>
			<p class="item--J8M">${auctionInfo.farm_name}</p>
			<p class="item-71-bNM">${auctionInfo.farm_address}</p>
			<p class="item-2-Fho">${auctionInfo.farm_square_footage}</p>
			<p class="item--ZiV">${auctionInfo.farm_square_footage}</p>
			<p class="item-20220909-GN1">${auctionInfo.update_date}</p>
			<p class="item-010-1234-5678-etM">${auctionInfo.farmer_phone}</p>
			<p class="item--bUq">입찰 내역</p>
			<div class="group-142-9aD">
				<div class="auto-group-18qv-Tau">
					<p class="item--vjP">서*현</p>
					<p class="item-800000-ddo">########원</p>
					<p class="item-23-11-23-11-13-55-Xz5">23-11-23 11:13:55</p>
				</div>
				<div class="auto-group-mqju-RJm">
					<p class="item--LAq">박*은</p>
					<p class="item-780000-qtH">########원</p>
					<p class="item-23-11-22-22-54-35-NNR">23-11-22 22:54:35</p>
				</div>
				<div class="auto-group-slmt-hQh">
					<p class="item--oTj">박*원</p>
					<p class="item-750000-VLZ">########원</p>
					<p class="item-23-11-22-10-33-15-acu">23-11-22 10:33:15</p>
				</div>
				<div class="auto-group-9g9k-H1X">
					<p class="item--mxH">전*수</p>
					<p class="item-720000-t1K">########원</p>
					<p class="item-23-11-20-14-17-34-yHf">23-11-20 14:17:34</p>
				</div>
			</div>
		</div>
		<p class="item--a6R">경매할 포인트 입력</p>
		<div class="auto-group-mefo-FCZ">
			<div class="auto-group-n3su-y8Z">원</div>
			<div class="auto-group-5zg9-QUm">
				<div class="auto-group-nexv-X3b">
					<p class="item-1615-31w">1,615</p>
					<div class="rectangle-103-8p5"></div>
					<img class="outline-heart-qiV"
						src="/assets/outline_heart_55_49.png" />
				</div>
				<div class="auto-group-8bxr-Ycu">
					<p class="item-615-V2M">615</p>
					<div class="rectangle-91-apV"></div>
					<img class="outline-bookmark-uLy" src="/assets/crops_corn.png" />
				</div>
				<div class="frame-16-nvZ">입찰하기</div>
			</div>
		</div>
	</div>
</body>
</html>