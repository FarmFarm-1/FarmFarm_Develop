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
								<div class="left_new_Img">
									<img src="" />
								</div>
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
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
    $(".profile_Big_Text2").click(function(){
        var id = $(this).attr('id'); // 채팅방의 id를 가져옴.
        $.ajax({
            url : "${cpath}/myPageFarmer/chatting",
            method : "POST",
            data : {
                "chatusernum" : id 
            },
            success: function(data) {
                $('#content').html(data); // 채팅 영역의 내용을 AJAX로부터 받아온 데이터로 변경
            }
        });
    });
});


</script>

