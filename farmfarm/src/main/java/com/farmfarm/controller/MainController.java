package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String showmain() {
		return "mainIndex";
	}
	
	// 로그인 페이지
		@GetMapping("/login.do")
		public String showLogin() {
			return "login/login";
		}

		// 헤더
		@GetMapping("/header.do")
		public String showHeader(HttpSession session) {
			//session.setAttribute("serial_num", "us1010101010");
			//session.setAttribute("serial_num", "FA1010101010");
			session.removeAttribute("headerSelect");
			return "header";
		}

		// 메인 페이지
		@GetMapping("/main.do")
		public String showMain(HttpSession session) {
			session.removeAttribute("headerSelect");
			return "main";
		}

		// 펀딩 페이지
		@GetMapping("/funding.do")
		public String showFunding(HttpSession session) {
			session.setAttribute("headerSelect", "funding");
			return "funding";
		}

		// 경매 페이지
		@GetMapping("/auction.do")
		public String showAuction(HttpSession session) {
			session.setAttribute("headerSelect", "auction");
			return "auction";
		}

		// 마이팜 페이지
		@GetMapping("/myfarm.do")
		public String showMyFarm(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "myFarm";
		}

		// 쪽지함 페이지
		@GetMapping("/messageBox.do")
		public String showMessageBox(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "messageBox";
		}

		// 마이프로젝트 페이지
		@GetMapping("/makeProject.do")
		public String showMakeProject(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "makeProject";
		}

		// 포인트 충전 페이지
		@GetMapping("/chargePoints.do")
		public String showChargePoints(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "chargePoints";
		}

		// 인증번호 모달
		@GetMapping("/cerNumModal.do")
		public String cerNumModal() {
			return "signUp/validationModal";
		}

		// 회원가입 페이지
		@GetMapping("/signup.do")
		public String showSignUpIndex() {
			return "signUp/signupIndex";
		}

		// 회원가입 페이지 ajax
		@GetMapping("/s_signup1.do")
		public String showSSignup1() {
			return "signUp/s_signup1";
		}

		@GetMapping("/s_signup2.do")
		public String showSSignup2() {
			return "signUp/s_signup2";
		}

		@GetMapping("/f_signup1.do")
		public String showFSignUp1() {
			return "signUp/f_signup1";
		}

		@GetMapping("/f_signup2.do")
		public String showFSignUp2() {
			return "signUp/f_signup2";
		}
	
}
