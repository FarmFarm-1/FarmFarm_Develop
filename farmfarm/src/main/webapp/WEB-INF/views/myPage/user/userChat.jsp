<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${cpath}/styles/userChat.css" />

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
						<div class="left_Big">
							<div class="profile_Big_Text">파머 김지원</div>
							<div class="left_new_Img">
								<img src="${cpath}/assets/-1uw.png" />
							</div>
						</div>
						<div class="profile_Small_Text">행복 농장</div>
					</div>
				</div>
			</div>
			<div class="detailAll_right">
				<div class="chatdate">
					<div class="dateText">2023년 12월 09일</div>
				</div>
				<div class="myChatAll">
					<div class="myChat">
						<div class="Time">오전 7:45</div>
						<div class="myName">전화수</div>
						<div class="profileImg">
							<img src="${cpath}/assets/-1uw.png" />
						</div>
					</div>
					<div class="myChat_message">
						<div class="message_background">
							<div class="message">안녕하세요. 궁금한게 있어요. 당신은 천사인가요?</div>
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
							<div class="your_message">네 저는 천사에요.</div>
						</div>
					</div>
				</div>

				<div class="InputMessage_background">
					<input class="InputMessageText" type="text" placeholder="메시지를 작성하세요.">
					<div class="EnterBtn">
						<button>전송</button>
					</div>
				</div>
			</div>
		</div>
		<!-- //detailAll -->
	</div>
</div>