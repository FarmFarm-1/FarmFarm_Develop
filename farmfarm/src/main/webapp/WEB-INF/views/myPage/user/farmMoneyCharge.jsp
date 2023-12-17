<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="icon" href="/favicon.ico" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="theme-color" content="#000000" />
	<title>mypage/서포터/팜머니충전</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Gmarket+Sans%3A400"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A300%2C400%2C700%2C800"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Pretendard%3A300%2C400%2C700%2C800"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400"/>
	<link rel="stylesheet" href="${cpath}/styles/farmMoneyCharge.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		$(document).ready(function() {
			$(".inputfarmmoney-zdK").on("input", formattingNum);
			$(".inputfarmmoney-zdK").on("change", formattingNum);
			$(".inputfarmmoney-zdK").on("keyup", formattingNum);
		});
		
		let chargeAmount = 0;
		let serial_num = "${sessionScope.serial_num}";
		
		function formattingNum(e) {
	    	let input = e.target.value;
	        if(input.length > 0) {
	        	let num = input.replace(/,/g, ""); // 콤마 제거
	        	if (!$.isNumeric(num)) {
	        		showModal("입력 오류","숫자만 입력하세요");
	                $(this).val(input.slice(0, -1)); // 마지막 문자 제거
	            } else {
	                $(this).val(Number(num).toLocaleString("en")); // 천 단위로 콤마 추가
	                chargeAmount = Number(num);
	            }
	        } else {
	            chargeAmount = 0; // 입력값이 없을 때 chargeAmount를 0으로 설정
	        }
	    }
		
		function requestCharging() {
			if(serial_num.substring(0,2) === "us") {
				if(chargeAmount.length == 0) {
					showModal("입력 오류","금액을 입력하세요.");
				} else if(parseInt(chargeAmount) < 10000) {
					showModal("입력 오류","최소 결제 가능 포인트는 10,000원 입니다");
			    } else {
					//ajax로 서버에 chargeAmount 저장
					KGInipay(); // 여기에서 ajax로 입력값과 실 결제값 검증. node.js 말고 어떤 방식을 써야할지.
				}
			} else {
				showModal("로그인이 필요한 기능입니다","서포터 회원으로 로그인 하세요");
			}
		}
		
		function KGInipay() {
			const impKey = "${impKey}";
			IMP.init(impKey);
			IMP.request_pay({
			    pg : 'html5_inicis', //테스트 시 html5_inicis.INIpayTest 기재 
			    pay_method : 'card',
			    name : '팜머니 충전 : ' + chargeAmount+'원', //상품명
			    amount : 1, //chargeAmount --> 1
			    buyer_email : "${userInfo.user_email}",
			    buyer_name : "${userInfo.user_name}",
			},function(rsp) {
				if (rsp.success) {
					$.ajax({
						url : "${cpath}/mypage/chargePointCfrm",
						data : {
			                paid_amount : chargeAmount, // 실결제 1원 고정이므로, chargeAmount를 전달.
			            },
						type : "post",
						success : function(res){
							if(res == 1) {
								showModal("결제 결과","포인트 결제가 완료되었습니다");
								document.querySelector('.btnOk').addEventListener('click', function() {
					                location.reload(true);
					            });
							}else {
								showModal("결제 결과","포인트 결제가 실패되었습니다");
								document.querySelector('.btnOk').addEventListener('click', function() {
					                location.reload(true);
					            });
							}
						},
						error : function(xhr) {
							showModal("결제 결과","포인트 결제가 실패되었습니다");
							location.reload(true);
						}
					});            
				} else {
					let msg = "결제 실패";
					msg += " 사유 : " + rsp.error_msg;
					showModal("결제 결과",msg);
					document.querySelector('.btnOk').addEventListener('click', function() {
		                location.reload(true);
		            });
				}
			});
		}
		
		function setAmount(amount) {
		    
			const selectedElem = document.querySelector(".farmmoney-border-layer.selected-outline");
			if (selectedElem) {
				selectedElem.classList.remove('selected-outline');
				const selectedEllipse = selectedElem.querySelector(".ellipse-34-7NV .inner-circle");
		        if (selectedEllipse) selectedEllipse.remove();
			}
			const currentElem = document.querySelector("#farmmoney-border-layer-"+amount);
			currentElem.classList.add("selected-outline");
			
			document.querySelector(".inputfarmmoney-zdK").value = amount;
			let event = new Event("input");
			document.querySelector(".inputfarmmoney-zdK").dispatchEvent(event);
			
			// 새로운 div 생성
			const newDiv = document.createElement("div");  
		    newDiv.style.width = "0.6rem";
		    newDiv.style.height = "0.6rem";
		    newDiv.style.position = "absolute";
		    newDiv.style.left = "50%";
		    newDiv.style.top = "50%";
		    newDiv.style.transform = "translate(-50%, -50%)";
		    newDiv.style.backgroundColor = "#64a246";
		    newDiv.style.borderRadius = "0.3rem";
		    newDiv.classList.add("inner-circle");
		    const ellipseElem = currentElem.querySelector(".ellipse-34-7NV");
		    ellipseElem.appendChild(newDiv);
		}
	</script>
</head>
<body>
<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
<div class="mypage--akD">
  <div class="header-H8q">
    <div class="auto-group-h7bb-14q">
      <div class="group-144-hTT">
        <div class="auto-group-3p61-1j3">
          <img class="image-22-kAq" src="/assets/image-22-TWu.png"/>
          <p class="item--fHo">팜팜</p>
        </div>
        <div class="auto-group-8a9s-B1F">
          <div class="item--H4H">펀딩</div>
          <div class="item--o2d">경매</div>
          <div class="item--v7F">마이팜</div>
        </div>
        <img class="line-24-F9X" src="/assets/line-24-JUV.png"/>
      </div>
      <div class="headerlogin-Bos">
        <div class="auto-group-5auv-wHF">
          <img class="headerchaticon-35P" src="/assets/headerchaticon-iNq.png"/>
          <p class="item--NdT">쪽지함</p>
          <div class="headernewchat-5nm">
            <div class="rectangle-121-cnh">
            </div>
            <p class="n-MEV">N</p>
          </div>
        </div>
        <div class="headerinfo-THX"> 박지은님 팜머니 : 50,000p</div>
      </div>
    </div>
    <div class="rectangle-101-KKj">
    </div>
  </div>
  <div class="auto-group-xktu-4o7">
    <div class="menu-xNh">
      <div class="auto-group-jjgh-hLH">
        <div class="userinfo-E5K">
          <div class="auto-group-v9l1-kJZ">
            <div class="auto-group-ycqm-jgH">서포터</div>
            <img class="vector-BYH" src="/assets/vector-vtD.png"/>
            <p class="item--j41">팜쪽이님</p>
          </div>
        </div>
        <div class="logout-Qvq">
          <p class="item--YXF">로그아웃</p>
          <div class="log-out-nAh">
          </div>
        </div>
        <div class="my-activity-hYZ">
          <p class="item--qem">나의 활동</p>
          <div class="myfunding-MND">
            <img class="group-srM" src="/assets/group-b8h.png"/>
            <p class="item--Ctd">펀딩한 팜</p>
            <img class="group-6DK" src="/assets/group-kE1.png"/>
          </div>
          <div class="myauction-SY5">
            <img class="item--ADB" src="/assets/-Kc9.png"/>
            <p class="item--sNV">경매한 팜</p>
            <img class="group-nEZ" src="/assets/group-xfP.png"/>
          </div>
          <div class="cart-itu">
            <img class="bytesize-heart-TLh" src="/assets/bytesize-heart-t5K.png"/>
            <p class="item--nds">찜목록</p>
            <img class="group-6uT" src="/assets/group-Hq7.png"/>
          </div>
          <div class="chat-3ph">
            <img class="humbleicons-chat-P7s" src="/assets/humbleicons-chat-GRK.png"/>
            <p class="item--huF">쪽지</p>
            <img class="group-ohP" src="/assets/group-S4d.png"/>
          </div>
        </div>
        <div class="my-farmmoney-v1K">
          <p class="item--rvZ">마이 팜머니</p>
          <div class="chargefarmmoney-McR">
            <div class="buttonhighlight-52d">
            </div>
            <p class="item--oUR">팜머니 충전</p>
            <img class="ph-piggy-bank-h41" src="/assets/ph-piggy-bank-xN1.png"/>
            <img class="group-Do3" src="/assets/group-SDb.png"/>
          </div>
          <div class="usingfarmmoney-MuF">
            <img class="iconoir-web-window-energy-consumption-Hnu" src="/assets/iconoir-web-window-energy-consumption-FC9.png"/>
            <p class="item--c4V">팜머니 사용 내역</p>
            <img class="group-foT" src="/assets/group-gBf.png"/>
          </div>
          <div class="depositlist-CoP">
            <img class="tabler-zoom-money-YcM" src="/assets/tabler-zoom-money-WAZ.png"/>
            <p class="item--fws">입금 내역</p>
            <img class="group-xAH" src="/assets/group-7tH.png"/>
          </div>
        </div>
        <div class="setting-JV3">
          <div class="auto-group-8c3p-4DK">
            <p class="item--C4d">설정</p>
            <img class="mdi-password-check-outline-7xH" src="/assets/mdi-password-check-outline-mUR.png"/>
          </div>
          <p class="item--fU1">비밀번호 변경</p>
          <img class="group-P97" src="/assets/group-L6H.png"/>
        </div>
      </div>
    </div>
    <div class="auto-group-gsyx-hfb">
      <div class="info-E9j">
        <div class="pammoney-Mk9">
          <div class="pammoneytext-tEH">
            <div class="pointicon-qQR">P</div>
            <p class="item--WFf">팜머니</p>
            <p class="pointamount-Qbw">50,000P</p>
          </div>
        </div>
        <div class="my-status-FMf">
          <div class="auto-group-ag5s-NhB">
            <div class="item--gSy">
              <p class="item--cLd">펀딩</p>
              <p class="item-5-LXX">5</p>
            </div>
            <img class="line-33-f41" src="/assets/line-33-NQM.png"/>
            <div class="item--QGV">
              <p class="item--LR3">경매</p>
              <p class="item-3-fy7">3</p>
            </div>
            <img class="line-34-DDw" src="/assets/line-34-KDX.png"/>
            <div class="item--97b">
              <p class="item--g7X">찜</p>
              <p class="item-11-oxq">11</p>
            </div>
          </div>
          <div class="auto-group-1jym-YvR">
            <div class="group-182-Fpq">
              <img class="group-135-bNu" src="/assets/group-135-4vR.png"/>
              <div class="item--KZo">결제정보 관리</div>
            </div>
            <div class="item--1Bj">간편하게 계좌 등록하고, 빠르게 결제하세요!</div>
            <div class="group--3PK">
              <div class="item--z3f">계좌 등록</div>
              <img class="group-GWy" src="/assets/group-yfs.png"/>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 사용 영역  시작 -->
      <div class="farmmoneycharge-layout">
        <div class="farmmoneyheader-v5j">
          <p class="item--rVB">팜머니 충전</p>
          <div class="item--aRB">
         	 팜머니를 충전하면 펀딩과 경매에 참여할 수 있습니다.<br/>얼마를 충전할까요?
          </div>
        </div>
        <div class="auto-group-ubjk-aZb">
          <div class="farmmoneyinputbox-Uus">
            <input class="inputfarmmoney-zdK" type="text" value="0" maxlength="11" />
            <p class="item--HMX">팜머니</p>
          </div>
          <div class="chargebtn-aLd" onclick="requestCharging()">충전하기</div>
        </div>
        <div class="farmmoney-DPb">
          <div class="auto-group-jcuk-LUD">
            <div class="farmmoney-border-layer" id="farmmoney-border-layer-10000" onclick="setAmount(10000)">
              <div class="auto-group-djpt-QDB">
                <div class="ellipse-34-7NV">
                </div>
              </div>
              <p class="item-10000--c4M">
                <span class="item-10000--c4M-sub-0" >10,000 </span>
                <span class="item-10000--c4M-sub-1">팜머니</span>
              </p>
            </div>
            <div class="farmmoney-border-layer" id="farmmoney-border-layer-100000" onclick="setAmount(100000)">
              <div class="auto-group-djpt-QDB">
                <div class="ellipse-34-7NV">
                </div>
              </div>
              <p class="item-10000--c4M">
                <span class="item-10000--c4M-sub-0">100,000 </span>
                <span class="item-10000--c4M-sub-1">팜머니</span>
              </p>
            </div>
          </div>
          <div class="auto-group-jcuk-LUD">
            <div class="farmmoney-border-layer" id="farmmoney-border-layer-20000" onclick="setAmount(20000)">
             <div class="auto-group-djpt-QDB">
                <div class="ellipse-34-7NV">
                </div>
              </div>
              <p class="item-10000--c4M">
                <span class="item-10000--c4M-sub-0">20,000 </span>
                <span class="item-10000--c4M-sub-1">팜머니</span>
              </p>
            </div>
            <div class="farmmoney-border-layer" id="farmmoney-border-layer-200000" onclick="setAmount(200000)">
              <div class="auto-group-djpt-QDB">
                <div class="ellipse-34-7NV">
                </div>
              </div>
              <p class="item-10000--c4M">
                <span class="item-10000--c4M-sub-0">200,000 </span>
                <span class="item-10000--c4M-sub-1">팜머니</span>
              </p>
            </div>
          </div>
          <div class="auto-group-jcuk-LUD">
            <div class="farmmoney-border-layer" id="farmmoney-border-layer-50000" onclick="setAmount(50000)">
              <div class="auto-group-djpt-QDB">
                <div class="ellipse-34-7NV">
                </div>
              </div>
              <p class="item-10000--c4M">
                <span class="item-10000--c4M-sub-0">50,000 </span>
                <span class="item-10000--c4M-sub-1">팜머니</span>
              </p>
            </div>
            <div class="farmmoney-border-layer" id="farmmoney-border-layer-500000" onclick="setAmount(500000)">
              <div class="auto-group-djpt-QDB">
                <div class="ellipse-34-7NV">
                </div>
              </div>
              <p class="item-10000--c4M">
                <span class="item-10000--c4M-sub-0">500,000 </span>
                <span class="item-10000--c4M-sub-1">팜머니</span>
              </p>
            </div>
          </div>
        </div>
        <div class="farmmoneyfooter-6sF">
          <img class="line-62-2ku" src="REPLACE_IMAGE:24:10843"/>
          <div class="item--As7">결제된 금액은 팜머니로 충전됩니다. </div>
        </div>
      </div>
      <!-- 사용 영역  종료 -->
    </div>
  </div>
  <div class="footer-T5X">
    <div class="auto-group-xxrf-BGR">
      <div class="inc-6PP">팜팜 INC.</div>
      <p class="item--QQ5">팜팜</p>
      <img class="image-22-urd" src="/assets/image-22-Tzu.png"/>
      <div class="group-147-rWy">
        <div class="c-z7P">C</div>
        <div class="ellipse-30-gku">
        </div>
      </div>
    </div>
    <div class="auto-group-rduh-arH">
      <div class="item--WV3">투자위험고지</div>
      <div class="about-farmfarm-oDF">ABOUT FARMFARM</div>
    </div>
    <div class="auto-group-yznm-8mK">
      <p class="item--T2u">
      투자는 원금 손실과 유동성 및 현금성에 대한 투자위험을 가지고 있습니다.
      <br/>
      투자 전에 투자위험고지를 꼭 확인해주세요. 
      <br/>
      
      <br/>
      (주)팜팜은 중개업(온라인소액투자중개 및 통신판매중개)를 영위하는 플랫폼 제공자로 자금을 모집하는 당사자가 아닙니다.
      <br/>
      따라서 투자손실의 위험을 보전하거나 리워드 제공을 보장해 드리지 않으며 이에 대한 법적인 책임을 지지 않습니다.
      </p>
      <div class="auto-group-mj53-iWZ">
        <p class="item--fAu">팜팜이란?</p>
        <p class="item--o2D">새소식</p>
        <p class="item--L29">커뮤니티파트너</p>
      </div>
    </div>
    <div class="line-51-FQ1">
    </div>
    <p class="c-1153-4-77-ds-sw-4-yqo">
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-0">팜팜(주) </span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-1">| </span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-2">대표이사 김지원 </span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-3">|</span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-4"> 사업자등록번호 258-01-10034</span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-5"> |</span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-6"> 통신판매업신고번호 2023-서울서북C-1153 </span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-7">|</span>
      <span class="c-1153-4-77-ds-sw-4-yqo-sub-8"> 서울특별시 마포구 월드컵북로4길 77 신한DS 금융 SW아카데미 4반</span>
    </p>
    <p class="infofarmfarmkr-1661-1003-YSy">
      <span class="infofarmfarmkr-1661-1003-YSy-sub-0">이메일 상담 info@farmfarm.kr </span>
      <span class="infofarmfarmkr-1661-1003-YSy-sub-1">| </span>
      <span class="infofarmfarmkr-1661-1003-YSy-sub-2">유선상담 1661-1003</span>
    </p>
  </div>
</div>
</body>