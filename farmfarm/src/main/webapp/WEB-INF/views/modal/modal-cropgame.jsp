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
	font-family: 'Pretendard';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
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

.modal_cropgame {
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

.modal_body_cropgame {
	position: fixed;
	top: 50%;
	width: 790px;
	height: 1080px;
	padding-top: 80px;
	text-align: center;
	background-color: rgb(230, 177, 67);
	border-radius: 10px;
	transform: translateY(-50%);
}

.btnOk_cropgame {
	cursor: pointer;
	margin-top: 180px;
	width: 7rem;
	height: 7rem;
	text-align: center;
	font-size: 3rem;
	font-weight: 700;
	line-height: 1.2575;
	color: #f6f6f6;
	font-family: Pretendard, 'Source Sans Pro';
	white-space: nowrap;
	box-sizing: border-box;
	background-color: red;
	border-radius: 1rem;
	position: sticky;
    margin-left: 86rem;
    margin-top: 0rem;
}

.btnOk_cropgame:hover {
	cursor: pointer;
}

.hidden_cropgame {
	display: none !important;
}
</style>
<script>
	document.addEventListener('keydown', onEnter_cropgame);
	document.addEventListener('click', function(event) {
		if (event.target.matches('.btnOk_cropgame')) {
			hideModal_cropgame();
		}
	});
	function onEnter_cropgame() {
		var keyCode_cropgame = window.event.keyCode;
		if (keyCode_cropgame == 13
				&& window.getComputedStyle(document
						.querySelector('.modal_cropgame')).display != 'none') {
			// 모달이 떠있다면, 먼저 모달을 닫고 함수를 종료
			document.querySelector('.modal_cropgame').style.display = 'none';
			event.preventDefault(); // 이벤트 전파 방지
			return;
		}
	}

	function hideModal_cropgame() {
		document.querySelector('.modal_cropgame').style.display = 'none';
	}

	function showModal_cropgame() {
		$(".btnOk_cropgame").removeClass('hidden_cropgame');
		document.querySelector('.modal_cropgame').style.display = 'flex';
	}
</script>
<div class="modal_cropgame">
	<iframe class="modal_body_cropgame" id="modal_body_cropgame_import"
		src="http://localhost:5000/"></iframe>
	<button class="btnOk_cropgame">X</button>
</div>