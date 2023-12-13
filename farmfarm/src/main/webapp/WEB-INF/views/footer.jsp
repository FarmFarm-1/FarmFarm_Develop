<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="cpath" />

<link rel="stylesheet" href="${cpath }/styles/footer.css" />

<footer class="footer">  
	<div class="line">
		<!-- footer_center -->
		<div class="footer_center">
			<!-- farm_noti -->
			<div class="farm_noti">
				<div class="left">
					<div class="logo">
						<div>
							<div class="img_wrap">
								<img src="${cpath }/assets/logo.png" />
							</div>
							팜팜
						</div>
						<div class="logo_icon">
							<div class="icon_circle">C</div>
							<div class="icon_name">팜팜 INC.</div>
						</div>
					</div>
					<div class="title">투자위험고지</div>
					<p>
						투자는 원금 손실과 유동성 및 현금성에 대한 투자위험을 가지고 있습니다.<br />투자 전에 투자위험고지를 꼭
						확인해주세요.<br /><br />(주)팜팜은 중개업(온라인소액투자중개 및 통신판매중개)를 영위하는 플랫폼
						제공자로 자금을 모집하는 당사자가 아닙니다.<br />따라서 투자손실의 위험을 보전하거나 리워드 제공을 보장해
						드리지 않으며 이에 대한 법적인 책임을 지지 않습니다.
					</p>
				</div>
				<div class="right">
					<div class="title">ABOUT FARMFARM</div>
					<ul class="abt_farm">
						<li>
							<a href="#">팜팜이란?</a>
						</li>
						<li>
							<a href="#">새소식</a>
						</li>
						<li>
							<a href="#">커뮤니티파트너</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- //farm_noti -->
		</div>
		<!-- //footer_center -->
	</div>
	<div class="footer_center">
		<div class="copyright">
			<p>
				<span>팜팜(주)</span>
				<span>대표이사 김지원</span>
				<span>사업자등록번호 258-01-10034</span>
				<span>통신판매업신고번호 2023-서울서북C-1153</span>
				<span>서울특별시 마포구 월드컵북로 4길 77 신한DS 금융 SW아카데미 4반</span>
			</p>
			<span>이메일 상담 info@farmfarm.kr</span><span>유선상담 1667-1003</span>
		</div>
	</div>
</footer>
	