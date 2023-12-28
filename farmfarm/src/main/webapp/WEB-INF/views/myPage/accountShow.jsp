<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" href="${cpath}/styles/userAccountShow.css">
<style>
* {
	padding: 0;
	margin: 0;
}

#modalWrap-accountRegister {
	position: fixed; /* Stay in place */
	z-index: 2; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	display: none;
    align-items: center;
    justify-content: center;
}

#modalBody {
	width: 550px;
    height: 230px;
	padding: 30px 30px 30px 30px;
	margin: 0 auto;
	border-radius:1rem;
	background-color: #f5f5f5;
	box-shadow: 2px 3px 4px rgba(0, 0, 0, 0.25);
	justify-content: center;
}

#closeBtn-accountRegister {
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;
	font-family: Pretendard, 'Source Sans Pro';
}

.content_detail {
    width: 550px;
    height: 50px;
    display: flex;
    font-family: Pretendard, 'Source Sans Pro';
    align-items: center;
}
#bank_code {
	font-family: Pretendard, 'Source Sans Pro';
}
#bank_code_tit {
	border-radius: 0.5rem;
	height: 30px;
	padding-left: 10px;
	width: 210px;
	font-family: Pretendard, 'Source Sans Pro';
	font-size : 15px;
}
.bank_detail_tit {
    flex-basis: 150px;
    margin-left: 100px;
    font-size: 20px;
    font-family: Pretendard, 'Source Sans Pro';
    height: 20px;
}

.detail_content input{
	font-size : 15px;
	border-radius: 0.5rem;
	padding-left: 10px;
	width: 200px;
	height: 30px;
	font-family: Pretendard, 'Source Sans Pro';
}
.btn {
	text-align: center;
}
.btn button{
	width:200px;
	height:40px;
	background-color: #64A346;
	color: #FFF;
	border: none;
	border-radius: 0.5rem;
	font-size: 15px;
	font-family: Pretendard, 'Source Sans Pro';
	margin: 30px 0 5px 0;
}

button:hover {
	cursor: pointer;
}
</style>
<script>
	function hideAccountModal() {
		const modal = document.getElementById('modalWrap-accountRegister');
		modal.style.display = 'none'
	}
	
	function showAccountModal() {
		const modal = document.getElementById('modalWrap-accountRegister');
		modal.style.display = 'flex';
	}
	
	function verifyAndRegister() {
		let bank_code_tit = document.querySelector("#bank_code_tit");
		let bank_code = bank_code_tit.options[bank_code_tit.selectedIndex].value;
		let bank_num = document.querySelector("#bank_num").value.trim();
		let bank_name_kr = bank_code_tit.options[bank_code_tit.selectedIndex].text;
		let accountReloadFormURL = document.querySelector("#accountReloadForm");
		if (bank_num.length == 0) {
			alert("계좌 번호를 입력하세요");
		} else {
			$.ajax({
				url:"${cpath}/mypage/verifyAndRegAccount",
				type:"POST",
				data:{
					"bank_code" : bank_code,
					"bank_num" : bank_num,
					"bank_name_kr" : bank_name_kr
				},
				success: function(res){
					if(res == "UserSuccess") {
						accountReloadFormURL.action = "${cpath}/myPageUser";
						alert("계좌 변경이 완료되었습니다");
						directLink('accountRegister','accountReloadForm', 'accountPathInput');
					} else if(res == "FarmerSuccess") {
						accountReloadFormURL.action = "${cpath}/myPageFarmer";
						alert("계좌 변경이 완료되었습니다");
						directLink('accountRegister','accountReloadForm', 'accountPathInput');
					} else if (res == "UserFail") {
						accountReloadFormURL.action = "${cpath}/myPageUser";
						alert("계좌 변경에 실패하였습니다");
						directLink('accountRegister','accountReloadForm', 'accountPathInput');
					} else if (res == "FarmerFail") {
						accountReloadFormURL.action = "${cpath}/myPageFarmer";
						alert("계좌 변경에 실패하였습니다");
						directLink('accountRegister','accountReloadForm', 'accountPathInput');
					} else if (res == "FarmerNotCoincide") {
						accountReloadFormURL.action = "${cpath}/myPageFarmer";
						alert("본인의 계좌만 등록 가능합니다.");
						directLink('accountRegister','accountReloadForm', 'accountPathInput');
					} else if (res == "UserNotCoincide") {
						accountReloadFormURL.action = "${cpath}/myPageUser";
						alert("본인의 계좌만 등록 가능합니다.");
						directLink('accountRegister','accountReloadForm', 'accountPathInput');
					} else {
						alert("계좌 변경에 실패하였습니다");
						location.href = "${cpath}/";
					}	
				},
				error: function(xhr) {
					alert("계좌 변경에 실패되었습니다.");
					location.href = "${cpath}/";
				}
			});
		}
	}
	
	function directLinkAtAccount(path, formName, pathVariableId) {
	   	document.getElementById(pathVariableId).value = path;
		document.getElementById(formName).submit();
    }
</script>
<form id="accountReloadForm" method="post">
	<input type="hidden" name="path" id="accountPathInput" />
</form>  
<div class="accountregis-RDX">
<jsp:include page="${cpath}/WEB-INF/views/modal/modal.jsp" />
	<p class="item--ykq">나의 계좌</p>
	<div class="auto-group-wk5s-tcu">
		<div class="accountinfohead-yuF">
			<div class="auto-group-cf2d-vpV">
				
				<c:choose>
					<c:when test="${account_bank=='농협'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/nh.png" />
					</c:when>
					<c:when test="${account_bank=='KB국민은행'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/kbbank.png" />
					</c:when>
					<c:when test="${account_bank=='기업은행'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/ibk.png" />
					</c:when>
					<c:when test="${account_bank=='우리은행'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/woori.png" />
					</c:when>
					<c:when test="${account_bank=='신한은행'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/shinhan.png" />
					</c:when>
					<c:when test="${account_bank=='하나은행(서울은행)'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/hana.png" />
					</c:when>
					<c:when test="${account_bank=='카카오뱅크'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/kakao.png" />
					</c:when>
					<c:when test="${account_bank=='우체국'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/.png" />
					</c:when>
					<c:when test="${account_bank=='토스뱅크'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/toss.png" />
					</c:when>
					<c:when test="${account_bank=='K뱅크'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/kbank.png" />
					</c:when>
					<c:when test="${account_bank=='SC제일은행'}">
						<img class="shcsymbolci-1-fXB" src="/assets/bankicon/sc.png" />
					</c:when>
					<c:otherwise><img class="shcsymbolci-1-fXB" src="/assets/logo_sweetpotato.png" /></c:otherwise>
				</c:choose>
				
				<div class="bank-C1K">${account_bank}</div>
				<div class="changAccount-btn" onclick="showAccountModal()">계좌 변경</div>
			</div>
		</div>
		<div class="accountinfofoot-gx5">
			<p class="accountname-FkH">${account_holder}</p>
			<div class="accountnum-bp9">${account_num}</div>
		</div>
	</div>
</div>
<div id="modalWrap-accountRegister">
	<div id="modalContent">
		<div id="modalBody">
			<span id="closeBtn-accountRegister" onclick="hideAccountModal()">&times;</span>
			<div class="content_detail">
				<div class="bank_detail_tit">은행명</div>
				<div class="detail_content">
					<select id="bank_code_tit">
					<option value="004">KB국민은행</option>
					<option value="023">SC제일은행</option>
					<option value="039">경남은행</option>
					<option value="034">광주은행</option>
					<option value="003">기업은행</option>
					<option value="011">농협</option>
					<option value="031">대구은행</option>
					<option value="032">부산은행</option>
					<option value="002">산업은행</option>
					<option value="007">수협</option>
					<option value="088">신한은행</option>
					<option value="048">신협</option>
					<option value="005">외환은행</option>
					<option value="020">우리은행</option>
					<option value="071">우체국</option>
					<option value="037">전북은행</option>
					<option value="035">제주은행</option>
					<option value="012">축협</option>
					<option value="081">하나은행(서울은행)</option>
					<option value="027">한국씨티은행(한미은행)</option>
					<option value="089">K뱅크</option>
					<option value="090">카카오뱅크</option>
					<option value="209">유안타증권</option>
					<option value="218">현대증권</option>
					<option value="230">미래에셋증권</option>
					<option value="238">대우증권</option>
					<option value="240">삼성증권</option>
					<option value="243">한국투자증권</option>
					<option value="247">우리투자증권</option>
					<option value="261">교보증권</option>
					<option value="262">하이투자증권</option>
					<option value="263">에이치엠씨투자증권</option>
					<option value="264">키움증권</option>
					<option value="265">이트레이드증권</option>
					<option value="266">에스케이증권</option>
					<option value="267">대신증권</option>
					<option value="268">솔로몬투자증권</option>
					<option value="269">한화증권</option>
					<option value="270">하나대투증권</option>
					<option value="278">굿모닝신한증권</option>
					<option value="279">동부증권</option>
					<option value="280">유진투자증권</option>
					<option value="287">메리츠증권</option>
					<option value="289">엔에이치투자증권</option>
					<option value="290">부국증권</option>
					<option value="92">토스뱅크</option>
				</select>
				</div>
			</div>
			<div class="content_detail">
				<div class="bank_detail_tit">계좌번호</div>
				<div class="detail_content">
					<input id="bank_num" type="text" required="required" placeholder="계좌번호를 입력하세요" >
				</div>
			</div>
			<div class="btn">
				<button onclick="verifyAndRegister()">계좌 인증 및 등록</button>
			</div>
		</div>
	</div>
</div>
