<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="/favicon.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>mainpage/경매/상세 조회</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400%2C500%2C700%2C800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Pretendard%3A400%2C700%2C800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400%2C500%2C700%2C800"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400"/>
  <link rel="stylesheet" href="/styles/auctionDetail.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="mainpage--eS1">
  <div class="auto-group-kfzx-KY9">
    <div class="header-mQ9">
      <div class="auto-group-tnvs-tjf">
        <div class="group-144-ord">
          <div class="auto-group-cv4h-Z57">
            <img class="image-22-Rt1" src="/assets/crops_corn.png"/>
            <p class="item--h4q">팜팜</p>
          </div>
          <div class="auto-group-k2kx-aPX">
            <div class="item--VWV">펀딩</div>
            <div class="item--zy3">경매</div>
            <div class="item--JTw">마이팜</div>
          </div>
          <img class="line-24-C3X" src="REPLACE_IMAGE:6:2094"/>
        </div>
      </div>
      <div class="rectangle-101-G3P">
      </div>
    </div>
    <div class="material-symbols-bookmark-outline-BAM">
    </div>
    <div class="wheat-18458351280-TNm">
    </div>
    <p class="kg-q8R">${auctionInfo.product_name}</p>
    <p class="item-577--iCD">
	  <span class="item-577--iCD-sub-1">현재 참여자 </span>
      <span class="item-577--iCD-sub-0">${maxAndCntInfo.participant_cnt}</span>
    </p>
    <div class="group-90-XBb">D - 14</div>
    <p class="item-33207900-4aq">
      <span class="item-33207900-4aq-sub-0">최고 입찰가 </span>
      <span class="item-33207900-4aq-sub-1">${maxAndCntInfo.max_auction_price}</span>
      <span class="item-33207900-4aq-sub-2"> 원</span>
    </p>
    <div class="rectangle-104-1RX">
    </div>
    <div class="rectangle-90-h3T">
    </div>
    <div class="group-91-LcD">
      <p class="item--2E9">스토리 더보기</p>
      <img class="outline-chevron-down-5CR" src="/assets/arrow_see_more.png"/>
    </div>
    <p class="item--MQq">프로젝트 스토리</p>
    <div class="rectangle-105-MJM">
    </div>
    <div class="rectangle-117-RZ7">
    </div>
    <div class="material-symbols-bookmark-outline-LRB">
    </div>
    <div class="rectangle-70-4MB">
    </div>
    <p class="item--Af7">${auctionInfo.farmer_name}</p>
    <div class="ellipse-22-oxy">
    </div>
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
    <div class="rectangle-118-HDF">
    </div>
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
    <div class="group-153-4a1">
      <div class="auto-group-zbfb-kSq">
        <img class="group-126-e2R" src="/assets/message_box.png"/>
        <p class="item--xoo">쪽지함</p>
        <div class="group-128-eRj">
          <div class="rectangle-121-Z2u">
          </div>
          <p class="n-g7X">N</p>
        </div>
      </div>
      <div class="group-127-jbb"> 박지은님 팜머니 : 50,000p</div>
    </div>
  </div>
  <p class="item--a6R">경매할 포인트 입력</p>
  <div class="auto-group-mefo-FCZ">
    <div class="auto-group-n3su-y8Z">원</div>
    <div class="auto-group-5zg9-QUm">
      <div class="auto-group-nexv-X3b">
        <p class="item-1615-31w">1,615</p>
        <div class="rectangle-103-8p5">
        </div>
        <img class="outline-heart-qiV" src="/assets/outline_heart_55_49.png"/>
      </div>
      <div class="auto-group-8bxr-Ycu">
        <p class="item-615-V2M">615</p>
        <div class="rectangle-91-apV">
        </div>
        <img class="outline-bookmark-uLy" src="/assets/crops_corn.png"/>
      </div>
      <div class="frame-16-nvZ">입찰하기</div>
    </div>
  </div>
  <div class="footer-3bb">
    <div class="auto-group-o8ry-xiZ">
      <div class="inc-T9X">팜팜 INC.</div>
      <p class="item--u1X">팜팜</p>
      <img class="image-22-LsX" src="/assets/crops_corn.png"/>
      <div class="group-147-31F">
        <div class="c-vaq">C</div>
        <div class="ellipse-30-Ys7">
        </div>
      </div>
    </div>
    <div class="auto-group-zqmp-QeR">
      <div class="item--VQy">투자위험고지</div>
      <div class="about-farmfarm-xJZ">ABOUT FARMFARM</div>
    </div>
    <div class="auto-group-tmuw-Hrd">
      <p class="item--23X">
      투자는 원금 손실과 유동성 및 현금성에 대한 투자위험을 가지고 있습니다.
      <br/>
      투자 전에 투자위험고지를 꼭 확인해주세요. 
      <br/>
      
      <br/>
      (주)팜팜은 중개업(온라인소액투자중개 및 통신판매중개)를 영위하는 플랫폼 제공자로 자금을 모집하는 당사자가 아닙니다.
      <br/>
      따라서 투자손실의 위험을 보전하거나 리워드 제공을 보장해 드리지 않으며 이에 대한 법적인 책임을 지지 않습니다.
      </p>
      <div class="auto-group-w6hk-Dfj">
        <p class="item--xNR">팜팜이란?</p>
        <p class="item--H9o">새소식</p>
        <p class="item--oP3">커뮤니티파트너</p>
      </div>
    </div>
    <div class="line-51-iF7">
    </div>
    <p class="c-1153-4-77-ds-sw-4-SB7">
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-0">팜팜(주) </span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-1">| </span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-2">대표이사 김지원 </span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-3">|</span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-4"> 사업자등록번호 258-01-10034</span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-5"> |</span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-6"> 통신판매업신고번호 2023-서울서북C-1153 </span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-7">|</span>
      <span class="c-1153-4-77-ds-sw-4-SB7-sub-8"> 서울특별시 마포구 월드컵북로4길 77 신한DS 금융 SW아카데미 4반</span>
    </p>
    <p class="infofarmfarmkr-1661-1003-AAy">
      <span class="infofarmfarmkr-1661-1003-AAy-sub-0">이메일 상담 info@farmfarm.kr </span>
      <span class="infofarmfarmkr-1661-1003-AAy-sub-1">| </span>
      <span class="infofarmfarmkr-1661-1003-AAy-sub-2">유선상담 1661-1003</span>
    </p>
  </div>
</div>
</body>