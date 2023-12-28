<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${cpath}/styles/userChatting.css" />


<div class="Content">
	<div class="content_tit">쪽지함</div>
	<div class="content_detailAll">
		<div class="content_detail_top">
			<div class="content_detail_top_left">
				<div class="top_left_one">모든 메시지</div>
				<div class="top_left_two">읽지 않은 메시지</div>
			</div>
			<div class="content_detail_top_right">
				<div class="farmer_Img">
					<img src="${cpath}/assets/-1uw.png" />
				</div>
				<div class="trp_Text">
					<div class="profile_Big_Text">전화수</div>
					<div class="profile_Small_Text">쌀쌀 보리쌀</div>
				</div>
			</div>
		</div>


		<!-- detailAll -->
		<div class="detailAll">
			<div class="detailAll_left">
				<div class="detail_left">
					<div class="farmer_Img">
						<img src="${cpath}/assets/-1uw.png" />
					</div>
					<div class="chatUser">
						<!-- 메시지 목록 div -->
						<div class="left_Big">
							<div class="profile_Big_Text">rlarla</div>
							<div class="left_new_Img">
								<img src="${cpath}/assets/-1uw.png" />
							</div>
						</div>
						<div class="profile_Small_Text">행복 농장</div>
						<!-- // 메시지 목록 div  -->
					</div>
				</div>
			</div>
			<div class="detailAll_right">
				<div class="chatdate">
					<div class="dateText">2023년 12월 09일</div>
				</div>
				<div class="myChatAll">
					<div class="myChat_message">
						<div class="message_background">
							<div id="list"></div>
						</div>
					</div>
				</div>

				<div class="yourChatAll">
					<div class="yourChat">
						<div class="yourprofileImg">
							<img src="${cpath}/assets/-1uw.png" />
						</div>
						<div class="yourName">파머 김지원</div>
						<div class="yourTime">오전 7:45</div>
					</div>
					<div class="yourChat_message">
						<div class="your_message_background">
							<div id="list2"></div>
						</div>
					</div>
				</div>

				<div class="InputMessage_background">
					<input class="InputMessageText" type="text" name="msg" id="msg"
						placeholder="메시지를 작성하세요.">
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var farmername = "${farmername}";
	var sender = "${farmer_serial_num}"
	var url = "ws://localhost:9090/chatserver";

	console.log("Farmername:", farmername);
	let ws = new WebSocket(url);

	$(document).ready(function() {
		connect();
	});

	function connect() {
		ws.onopen = function(evt) {
			ws.send(farmername);
			$('#msg').attr('disabled', false);
			$('#msg').focus();
		};

		ws.onmessage = function(evt) {
			let fullMessage = evt.data;
			let splitMessage = fullMessage.split('#');
			let user = splitMessage[0].split(': ')[1]; // ':' 이후의 문자를 가져옵니다.
			let txt = splitMessage[1];
			console.log("user", user);
			console.log("txt", txt);

			if (txt) { // txt가 있을 때만 'print' 또는 'printOther' 함수를 호출
				if (user === farmername) {
					print(farmername, txt); // 본인 대화창에
				} else { 
					printOther(user, txt); // 다른 사람 대화창에
				}
			}


			$('#list').scrollTop($('#list').prop('scrollHeight'));
			$('#list2').scrollTop($('#list2').prop('scrollHeight'));
		};

		ws.onclose = function(evt) {
			console.log('소켓이 닫힙니다.');
		};

		ws.onerror = function(evt) {
			console.log(evt.data);
		};
	}

	// 메시지 전송 및 아이디
	function print(user, txt) {
		console.log('Message sender: 프린터');
		let temp = '';
		temp += '<div class="message_container">';
		temp += '<span class="timeSpan">' + new Date().toLocaleTimeString()
				+ '</span>  ';
		temp += '<div class="message_background">';
		temp += '<div class="message">'
		temp += txt;
		temp += '</div>';
		temp += '</div>';
		temp += '</div>';
		$('#list').append(temp);
	}

	function printOther(user, txt) {
		console.log('Message sender: 리시버');
		let temp = '';
		temp += '<div class="yourChat_message">';
		temp += '<span class="timeSpan">' + new Date().toLocaleTimeString()
				+ '</span>  ';
		temp += '<div class="your_message_background">';
		temp += '<div class="your_message">' + txt
				+ '</div>';
		temp += '</div>';
		temp += '</div>';
		$('#list2').append(temp);
	}

	$('#msg').keydown(function() {
		if (event.keyCode == 13) { //엔터키
			ws.send(farmername + '#' + $(this).val()); //서버에게만 메시지를 보냅니다.

			$('#msg').val('');
			$('#msg').focus();
		}
	});
</script>