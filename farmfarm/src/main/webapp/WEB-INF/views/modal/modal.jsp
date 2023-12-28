<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'LINESeedKR-Bd';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'LINESeedKR-Bd-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/LINESeedKR-Bd-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

.modal {
	zoom: 0.8;
	z-index: 3;
	position: fixed;
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
	position: fixed;
	top: 50%;
	width: 700px;
	height: 400px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateY(-50%);
}

.modalExclamationMark {
	width: 7rem;
	margin-top: 3rem;
}

.modal_body .alertTitle {
	margin: 3rem 0rem 3rem 0rem;
	text-align: center;
	font-size: 4.5rem;
	font-weight: bolder;
	line-height: 1.2575;
	letter-spacing: 0.25rem;
	color: #2d2d2d;
	font-family: Pretendard, 'Source Sans Pro';;
	white-space: nowrap;
	flex-shrink: 0;
}

.modal_body .alertTitle_short {
	margin: 6rem 0rem;
	text-align: center;
	font-size: 4.5rem;
	font-weight: bolder;
	line-height: 1.2575;
	letter-spacing: 0.25rem;
	color: #2d2d2d;
	font-family: Pretendard, 'Source Sans Pro';;
	white-space: nowrap;
	flex-shrink: 0;
}

.modal_body .alertContent {
	margin-bottom: 5rem;
	text-align: center;
	font-size: 3rem;
	font-weight: bold;
	line-height: 1.2575;
	color: #2d2d2d;
	font-family: Pretendard, 'Source Sans Pro';
	flex-shrink: 0;
}

.modal_body .btnOk {
	cursor: pointer;
	margin: 2rem 29rem 2rem 29rem;
	width: 12rem;
	height: 7rem;
	text-align: center;
	font-size: 3rem;
	font-weight: 700;
	line-height: 1.2575;
	color: #f6f6f6;
	font-family: Pretendard, 'Source Sans Pro';
	white-space: nowrap;
	display: flex;
	align-items: center;
	justify-content: center;
	border: solid 0.1rem #64a246;
	box-sizing: border-box;
	background-color: #64a246;
	border-radius: 1rem;
	flex-shrink: 0;
}

.btnOk:hover {
	cursor: pointer;
	margin: 2rem 29rem 2rem 29rem;
	width: 12rem;
	height: 7rem;
	text-align: center;
	font-size: 3rem;
	font-weight: 700;
	line-height: 1.2575;
	color: #f6f6f6;
	font-family: Pretendard, 'Source Sans Pro';
	white-space: nowrap;
	display: flex;
	align-items: center;
	justify-content: center;
	border: solid 0.1rem #64a246;
	box-sizing: border-box;
	background-color: #5C913B;
	border-radius: 1rem;
	flex-shrink: 0;
}

.hidden{
	display: none !important;
}

.modal_body .btnOk_myproject {
	cursor: pointer;
	margin: 2rem 29rem 2rem 29rem;
	width: 12rem;
	height: 7rem;
	text-align: center;
	font-size: 3rem;
	font-weight: 700;
	line-height: 1.2575;
	color: #f6f6f6;
	font-family: Pretendard, 'Source Sans Pro';
	white-space: nowrap;
	display: flex;
	align-items: center;
	justify-content: center;
	border: solid 0.1rem #64a246;
	box-sizing: border-box;
	background-color: #64a246;
	border-radius: 1rem;
	flex-shrink: 0;
}

.btnOk_myproject:hover {
	cursor: pointer;
	margin: 2rem 29rem 2rem 29rem;
	width: 12rem;
	height: 7rem;
	text-align: center;
	font-size: 3rem;
	font-weight: 700;
	line-height: 1.2575;
	color: #f6f6f6;
	font-family: Pretendard, 'Source Sans Pro';
	white-space: nowrap;
	display: flex;
	align-items: center;
	justify-content: center;
	border: solid 0.1rem #64a246;
	box-sizing: border-box;
	background-color: #5C913B;
	border-radius: 1rem;
	flex-shrink: 0;
}
</style>
<script>
	document.addEventListener('keydown', onEnter);
	document.addEventListener('click', function(event) {
		if (event.target.matches('.btnOk')) {
			hideModal();
		}
	});
	document.addEventListener('click', function(event) {
		if (event.target.matches('.btnOk_myproject')) {
			hideModal();
			location.href = '/myPageFarmer';
		}
	});
	/* document.addEventListener('keydown', onEnter);
	window.onload = function() {
		document.querySelector('.btnOk').addEventListener('click', hideModal);
	};
	 */
	function onEnter() {
		var keyCode = window.event.keyCode;
		if (keyCode == 13
				&& window.getComputedStyle(document.querySelector('.modal')).display != 'none') {
			// 모달이 떠있다면, 먼저 모달을 닫고 함수를 종료
			document.querySelector('.modal').style.display = 'none';
			event.preventDefault(); // 이벤트 전파 방지
			return;
		}
	}
	function hideModal() {
		document.querySelector('.modal').style.display = 'none';
		//location.reload(true); => 경매시 체크해봐야함.
	}
	function showModal(title, result) {
		 $(".btnOk_myproject").addClass('hidden');
		$(".alertTitle").text(title);
		$(".alertContent").html(result);
		document.querySelector('.modal').style.display = 'flex';
	}

	function showModal_success(title, result) {
		 $(".btnOk_myproject").addClass('hidden');
		$(".alertTitle").text(title);
		$(".alertContent").html(result);
		if (!result) {
			document.querySelector('.alertTitle').style.margin = '6rem 0rem 7rem 0rem';
		}
		document.querySelector('.modal').style.display = 'flex';
	}
	function showModal_myproject(title, result) {
		 $(".btnOk").addClass('hidden');
		$(".alertTitle").text(title);
		$(".alertContent").html(result);
		if (!result) {
			document.querySelector('.alertTitle').style.margin = '6rem 0rem 7rem 0rem';
		}
		document.querySelector('.modal').style.display = 'flex';
	}
</script>
<div class="modal" id="basicModal">
	<div class="modal_body">
		<img class="modalExclamationMark"
			src="${cpath }/assets/Exclamation mark.png">
		<p class="alertTitle"></p>
		<p class="alertContent"></p>
		<button class="btnOk">확인</button>
		<button class="btnOk_myproject">확인</button>
	</div>
</div>