<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cpath}/styles/userAccountRegister.css">
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
.detail_tit {
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
		if (bank_num.length == 0) {
			alert("계좌 번호를 입력하세요");
		} else {
			$.ajax({
				url:"${cpath}/myPageUser/verifyAndRegAccount",
				type:"POST",
				data:{
					"bank_code" : bank_code,
					"bank_num" : bank_num,
					"bank_name_kr" : bank_name_kr
				},
				success: function(res){
					if(res == "success") {
						alert("계좌 등록이 완료되었습니다.");
					} else {
						alert("계좌 등록이 실패되었습니다.");
					}
					accountRegister();
				},
				error: function(xhr) {
					alert("계좌 등록이 실패되었습니다.");
					accountRegister();
				}
			});
		}
		
	}
</script>
<div id="modalWrap-accountRegister">
	<div id="modalContent">
		<div id="modalBody">
			<span id="closeBtn-accountRegister" onclick="hideAccountModal()">&times;</span>
			<div class="content_detail">
				<div class="detail_tit">은행명</div>
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
				</select>
				</div>
			</div>
			<div class="content_detail">
				<div class="detail_tit">계좌번호</div>
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
<div class="accountregis-8Q5">
	<div class="auto-group-pkjy-gAh">
		<p class="item--pGu">내 계좌를 등록하고 관리해보세요</p>
		<div class="accounticon-up9" onclick="showAccountModal()">
			<img class="ic-round-plus-qC1" src="/assets/ic-round-plus.png" />
		</div>
	</div>
	<div class="accountregisfoot-Ys7">
		<div class="item--uBs">등록된 계좌가 없습니다.</div>
		<div class="item--nmT" onclick="showAccountModal()">계좌 등록하기</div>
		<img class="mingcute-right-line-WBf"
			src="/assets/mingcute-right-line-2tM.png" onclick="showAccountModal()" />
	</div>
</div>
