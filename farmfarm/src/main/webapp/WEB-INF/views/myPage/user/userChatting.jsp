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
							<div class="profile_Big_Text">파머 김지원</div>
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
				<div class="chatArea">
					<!-- 새로운 div를 추가하였습니다. -->
					<div class="chatdate">
						<div class="dateText">2023년 12월 09일</div>
					</div>
					<div class="myChatAll">
						<div class="myChat_message">
							<div class="message_background">
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
				<!-- chatArea div를 닫았습니다. -->

				<div class="InputMessage_background">
					<input class="InputMessageText" type="text" name="msg" id="msg"
						placeholder="메시지를 작성하세요.">
				</div>
			</div>
		</div>
	</div>
</div>

<script>
    var username = "${username}";
    var url = "ws://localhost:9090/chatserver";
    var lastSender = null;
    let ws = new WebSocket(url);

    $(document).ready(function() {
        connect();
    });

    function connect() {
        ws.onopen = function() {
            ws.send(username);
            $('#msg').attr('disabled', false);
            $('#msg').focus();
        };

        ws.onmessage = function(evt) {
            let fullMessage = evt.data;
            let splitMessage = fullMessage.split('#');
            let user = splitMessage[0].split(': ')[1];
            let txt = splitMessage[1];

            if (txt) {
                if (user === username) {
                    print(username, txt);
                } else {
                    printOther(user, txt);
                }
            }
        };

        ws.onclose = function() {
            console.log('소켓이 닫힙니다.');
        };

        ws.onerror = function(evt) {
            console.log(evt.data);
        };
    }

    function print(user, txt) {
        let temp = '';
        temp += '<div class="message_container">';
        temp += '<span class="timeSpan">' + new Date().toLocaleTimeString([], {
            hour : '2-digit',
            minute : '2-digit'
        }) + '</span>  ';
        temp += '<div class="message_background">';
        temp += '<div class="message">'
        temp += txt;
        temp += '</div>';
        temp += '</div>';
        temp += '</div>';
        $('#chat').append(temp);
        setTimeout(function() {
            $('#chat').scrollTop($('#chat').prop('scrollHeight'));
        }, 0);
        lastSender = 'supporter';
    }

    function printOther(user, txt) {
        let temp = '';
        temp += '<div class="yourChat_message">';
        temp += '<div class="your_message_background">';
        temp += '<div class="your_message">' + txt + '</div>';
        temp += '</div>';
        temp += '</div>';

        if (lastSender !== 'farmer') {
            temp = '<div class="yourChatAll">'
                    + '<div class="yourChat">'
                    + '<div class="yourprofileImg"><img src="${cpath}/assets/-1uw.png" /></div>'
                    + '<div class="yourName">' + user + '</div>'
                    + '<span class="timeSpan">'
                    + new Date().toLocaleTimeString([], {
                        hour : '2-digit',
                        minute : '2-digit'
                    }) + '</span>  ' + '</div>' + temp;
        }

        $('#chat').append(temp);
        setTimeout(function() {
            $('#chat').scrollTop($('#chat').prop('scrollHeight'));
        }, 0);
        lastSender = 'farmer';
    }

    $('#msg').keydown(function() {
        if (event.keyCode == 13) {
            ws.send(username + '#' + $(this).val());
            $('#msg').val('');
            $('#msg').focus();
        }
    });
</script>



