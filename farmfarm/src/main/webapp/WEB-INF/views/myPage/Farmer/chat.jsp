<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${cpath}/styles/userChatting.css" />
<div class="Content" id="content">
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
					<div class="profile_Big_Text">${username}</div>
				</div>
			</div>
		</div>

		<!-- detailAll -->
		<div class="detailAll">
			<div class="detailAll_left">
				<c:forEach var="chatroom" items="${chkroom_idList}">
					<div class="detail_left">
						<div class="farmer_Img">
							<img src="${cpath}/assets/-1uw.png" />
						</div>
						<div class="chatUser">
							<div class="left_Big">
								<div class="profile_Big_Text2" id="${chatroom.chat_user}">${chatroom.user_name}</div>
								<div class="left_new_Img"
									<c:if test="${chatroom.unReadMessage == 0}">style="display: none;"</c:if>>
									${chatroom.unReadMessage}</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="detailAll_right">
				<!-- chatArea -->
				<div class="chatArea">
					<!-- chatInner -->
					<div class="chatInner">
						<!-- 						<div class="chatdate">
							<div class="dateText"></div>
						</div> -->
						<div class="myChatAll">
							<div class="myChat_message">
								<div>
									<div id="chat"></div>
								</div>
							</div>
						</div>

						<div class="yourChatAll">
							<div class="yourChat_message">
								<div class="your_message_background">
									<div id="chat"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- //chatInner -->
				</div>
				<!-- //chatArea -->
				<!-- chatArea div를 닫았습니다. -->
				<div class="InputMessage_background">
					<input class="InputMessageText" type="text" name="msg" id="msg"
						placeholder="메시지를 작성하세요.">
					<button id="btn"></button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var ws = null;
	var lastSender = null; // 이전 메시지의 sender를 저장할 변수
	var lastSentDate = null; // 이전 메시지의 sentdate를 저장할 변수
	var usernum = "${user_serial_num}";
	var username = "${username}";
	var farmername = "${farmer_name}";
	var farmernum = "${farmer_serial_num}";
	var chkroomid = "${chkroom_id}";

	function initWebsocket(usernum, username, farmernum, farmername, chkroomid) {
		if (ws !== null) {
			ws.onmessage = null; // 웹소켓 메시지 수신 핸들러 초기화
			ws.close();
			ws = null;
		}

		var encodedUsernum = encodeURIComponent(usernum);
		var encodedFarmernum = encodeURIComponent(farmernum);
		var encodedChkroomid = encodeURIComponent(chkroomid);

		var url = "ws://" + location.host + "/chatserver?user_serial_num="
				+ encodedUsernum + "&farmer_serial_num=" + encodedFarmernum
				+ "&chkroom_id=" + encodedChkroomid;
		ws = new WebSocket(url);

		ws.onmessage = handleOnMessage;

		ws.onopen = function() {
			$('#msg').attr('disabled', false);
		};

		ws.onclose = function() {
			if (ws !== null && ws.readyState !== WebSocket.CLOSED) {
				console.log('소켓이 닫힙니다.');
			} else {
				console.log('소켓이 이미 닫혀 있습니다.');
			}
		};

		ws.onerror = function(evt) {
			console.log(evt.data);
		};
	}

	function handleOnMessage(evt) {
		console.log('onmessage 실행');
		let fullMessage = evt.data;
		console.log("원본 메시지: ", fullMessage); // 원본 메시지 확인

		let sentdate;
		if (fullMessage.includes('sentdate')) {
			let parsedMessage = JSON.parse(fullMessage);
			sentdate = parsedMessage['sentdate'];
		}

		// sentdate가 이전 메시지의 sentdate와 다른 경우에만 출력
		if (lastSentDate !== sentdate) {
			printDate(sentdate);
			lastSentDate = sentdate;
		}

		let sender, txt, messagetime;
		if (fullMessage.includes('sender_serial_num')) {
			let parsedMessage = JSON.parse(fullMessage);
			sender = parsedMessage['sender_serial_num'];
			txt = parsedMessage['content'];
			messagetime = parsedMessage['messagetime'];
		}

		console.log("파싱된 sender: ", sender); // 파싱된 sender 확인
		console.log("파싱된 txt: ", txt); // 파싱된 txt 확인
		console.log("파싱된 messagetime: ", messagetime); // 파싱된 messagetime 확인

		if (txt) {
			if (sender === farmernum) {
				print(farmername, txt, messagetime);
			} else {
				printOther(username, txt, messagetime);
			}
		}
	}

	function printDate(sentdate) {
		let temp = '';
		temp += '<div class="dateText">' + sentdate + '</div>'; // sentdate 출력
		$('#chat').append(temp);
	}

	function print(farmername, txt, messagetime) {
		console.log('print 실행');
		let temp = '';
		temp += '<div class="message_container">';
		temp += '<span class="timeSpan1">' + messagetime + '</span>';
		temp += '<div class="message_background">';
		temp += '<div class="message">'
		temp += txt;
		temp += '</div>';
		temp += '</div>';
		temp += '</div>';
		$('#chat').append(temp);

		let elements = document.querySelectorAll(".message_container");
		let lastElement = elements[elements.length - 1];
		lastElement.scrollIntoView({
			behavior : "smooth"
		});

		lastSender = 'supporter';
	}

	function printOther(username, txt, messagetime) {
		console.log('printOther 실행');
		let temp = '';
		temp += '<div class="yourChat_message">';
		temp += '<div class="your_message_background">';
		temp += '<div class="your_message">' + txt + '</div>';
		temp += '<span class="timeSpan2">' + messagetime + '</span>';
		temp += '</div>';
		temp += '</div>';

		if (lastSender !== 'farmer') {
			temp = '<div class="yourChatAll">'
					+ '<div class="yourChat">'
					+ '<div class="yourprofileImg"><img src="${cpath}/assets/-1uw.png" /></div>'
					+ '<div class="yourName">' + username + '</div>' + '</div>'
					+ temp;
		}

		$('#chat').append(temp);

		let elements = document.querySelectorAll(".yourChat_message");
		let lastElement = elements[elements.length - 1];
		lastElement.scrollIntoView({
			behavior : "smooth"
		});

		lastSender = 'farmer';
	}

	$('#msg').keydown(function() {
		if (event.keyCode == 13 && ws.readyState === WebSocket.OPEN) {
			ws.send($(this).val());
			$('#msg').val('');
		}
	});

	// 버튼을 클릭하면 메시지를 전송하는 이벤트
	$('#btn').click(function() {
		if (ws.readyState === WebSocket.OPEN) {
			ws.send($('#msg').val());
			$('#msg').val('');
		}
	});

	window.onbeforeunload = function() {
		if (ws !== null) {
			ws.close();
			ws = null;
		}
	};

	$(document).ready(
			function() {
				initWebsocket(usernum, username, farmernum, farmername,
						chkroomid);

				$(".profile_Big_Text2").click(
						function() {
							var id = $(this).attr('id');
							if (ws !== null) {
								ws.onmessage = null; // 웹소켓 메시지 수신 핸들러 초기화
								ws.close();
								ws = null;
							}

							$('#chat').empty(); // 채팅 내용 초기화

							$.ajax({
								url : "${cpath}/myPageFarmer/chatting",
								method : "POST",
								data : {
									"chatusernum" : id
								},
								success : function(data) {
									usernum = "${user_serial_num}";
									username = "${username}";
									farmernum = "${farmer_serial_num}";
									farmernum = "${farmer_serial_num}";
									chkroomid = "${chkroom_id}";
									$('#content').html(data);

									initWebsocket(usernum, username, farmernum,
											farmername, chkroomid); // 새로운 웹소켓 연결
								}
							});
						});
			});
</script>
