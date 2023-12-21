<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${cpath}/styles/JHMESSAGE.css" />

<div class="Content">
	<div class="content_tit">쪽지함</div>
	<div class="content_detailAll">
		<div class="content_detail_top">
			<div class="content_detail_top_left">
				<div class="top_left_one">모든 메시지</div>
				<div class="top_left_two">읽지 않은 메시지</div>
			</div>
			<div class="content_detail_top_right">
				<div class="top_right_farmer_Img">
					<img src="" />
				</div>
				<div class="top_right_Big_Text">파머 이긴다.</div>
				<div class="top_right_Small_Text">쌀쌀 보리쌀</div>
			</div>
		</div>
		<!-- detailAll -->
		<div class="detailAll">
			<div class="detailAll_left">
				<div class="detail_left">
					<div class="left_farmer_Img">
						<img src="${cpath}/assets/-1uw.png" />
					</div>
					<div class="chatUser">
						<div class="left_Big">
							<div class="left_Big_Text">파머 데이빗</div>
							<div class="left_new_Img">
								<img src="${cpath}/assets/-1uw.png" />
							</div>
						</div>
						<div class="left_Small_Text">행복 농장</div>
					</div>
				</div>
			</div>
			<div class="detailAll_right">
				<div class="chatdate">2023년 12월 09일</div>
				<div class="myChat">
					<div class="Time">오전 7:45</div>
					<div class="myName">팜쪽이</div>
					<div class="profileImg">
						<img src="" />
					</div>
				</div>
				<div class="myChat_message">
					<div class="message_background">
						<div class="message">안녕하세요. 문의드립니다. 당신은 천사인가요?</div>
					</div>
				</div>

				<div class="yourChat_message">
					<div class="your_message_background">
						<div class="your_message">네 저는 천사에요.</div>
					</div>
				</div>

				<div class="InputMessage_background">
					<div class="InputMessageText">메시지를 작성하세요.</div>
					<div class="EnterBtn">
						<img src="" />
					</div>
				</div>
			</div>
		</div>
		<!-- //detailAll -->
	</div>
</div>