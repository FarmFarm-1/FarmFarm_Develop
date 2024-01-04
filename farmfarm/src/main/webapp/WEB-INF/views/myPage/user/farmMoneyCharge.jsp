<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cpath}/styles/farmMoneyCharge.css" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(document).ready(function() {
		$(".inputfarmmoney-zdK").on("input", formattingNum);
		$(".inputfarmmoney-zdK").on("change", formattingNum);
		$(".inputfarmmoney-zdK").on("keyup", formattingNum);
		let chargeAmount = 0;
	});
	
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
				$.ajax({
					url: "/myPageUser/farmMoneyChargeCallAPI",
					type: "post",
					success: function(res){
						const user_email = res.user_email;
						const user_name = res.user_name;
						const impIdentifier = res.impIdentifier;
						
						// 여기에서 ajax로 입력값과 실 결제값 검증..
						IMP.init(impIdentifier);
						IMP.request_pay({
						    pg : 'html5_inicis', //테스트 시 html5_inicis.INIpayTest 기재 
						    pay_method : 'card',
						    name : '팜머니 충전 : ' + chargeAmount+'원', //상품명
						    amount : 1, //chargeAmount --> 1
						    buyer_email : user_email,
						    buyer_name : user_name,
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
				});
			}
		} else {
			showModal("로그인이 필요한 기능입니다","서포터 회원으로 로그인 하세요");
		}
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
	
	function callNodeJS() {
		let url = "";
		fetch(url)
		    .then(response => {
			if (!response.ok) {
				throw new Error(`HTTP error! status: ${response.status}`);
			}
				return response.text(); // Response 객체에서 텍스트 내용을 추출합니다.
			})
			.then(scriptContent => {
				const scriptElement = document.createElement('script');
				scriptElement.type = 'module';
				scriptElement.textContent = scriptContent;
				const container = document.getElementById('modal_body_cropgame_import');
				container.appendChild(scriptElement);
				showModal_cropgame();
		    })
		    .catch(error => {
		        console.error('Failed to load script:', error);
		    });
	}
</script>
<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
<jsp:include page="${cpath}/WEB-INF/views/modal/modal-cropgame.jsp" />
<!-- html 사용 영역  시작 -->
<div class="farmmoneycharge-layout">
  <div class="farmmoneyheader-v5j">
  	<div class="farmmoney-title-line">
	    <p class="item--rVB">팜머니 충전</p>
  	</div>
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
    <div class="item--As7">결제된 금액은 팜머니로 충전됩니다. </div>
  </div>
</div>
<!-- html 사용 영역  종료 -->