<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.modal {
	z-index: 1;
	position: absolute;
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
	position: absolute;
	top: 50%;
	width: 700px;
	height: 500px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateY(-50%);
}

.modal_body .alertTitle {
	margin: 10rem 0rem 6.2rem 0.4rem;
	text-align: center;
	font-size: 3.7rem;
	font-weight: 700;
	line-height: 1.2575;
	letter-spacing: 0.25rem;
	color: #2d2d2d;
	font-family: Pretendard, 'Source Sans Pro';
	white-space: nowrap;
	flex-shrink: 0;
}

.modal_body .alertContent {
	margin-bottom: 8.6rem;
	text-align: center;
	font-size: 2.4rem;
	font-weight: 400;
	line-height: 1.2575;
	color: #2d2d2d;
	font-family: Pretendard, 'Source Sans Pro';
	flex-shrink: 0;
}

.modal_body .btnOk {
	cursor: pointer;
	margin: 0rem 0rem 0rem 24.5rem;
	width: 20rem;
	height: 8.2572rem;
	text-align: center;
	font-size: 3.8rem;
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
	border-radius: 0.5rem;
	flex-shrink: 0;
}
</style>
<script>
	window.onload = function() {
		document.querySelector('.btnOk').addEventListener('click', hideModal);
	};
	function hideModal() {
		document.querySelector('.modal').style.display = 'none';
		location.reload(true);
	}
	
	function showModal(title,result) {
		$(".alertTitle").text(title);
		$(".alertContent").text(result);
		document.querySelector('.modal').style.display = 'flex';
	}
</script>
<div class="modal" id="basicModal">
	<div class="modal_body">
		<p class="alertTitle"></p>
		<p class="alertContent"></p>
		<button class="btnOk">확인</button>
	</div>
</div>
