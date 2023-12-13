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
	
	// �α��� ������
		@GetMapping("/login.do")
		public String showLogin() {
			return "login/login";
		}

		// ���
		@GetMapping("/header.do")
		public String showHeader(HttpSession session) {
			//session.setAttribute("serial_num", "us1010101010");
			//session.setAttribute("serial_num", "FA1010101010");
			session.removeAttribute("headerSelect");
			return "header";
		}

		// ���� ������
		@GetMapping("/main.do")
		public String showMain(HttpSession session) {
			session.removeAttribute("headerSelect");
			return "main";
		}

		// �ݵ� ������
		@GetMapping("/funding.do")
		public String showFunding(HttpSession session) {
			session.setAttribute("headerSelect", "funding");
			return "funding";
		}

		// ��� ������
		@GetMapping("/auction.do")
		public String showAuction(HttpSession session) {
			session.setAttribute("headerSelect", "auction");
			return "auction";
		}

		// ������ ������
		@GetMapping("/myfarm.do")
		public String showMyFarm(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "myFarm";
		}

		// ������ ������
		@GetMapping("/messageBox.do")
		public String showMessageBox(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "messageBox";
		}

		// ����������Ʈ ������
		@GetMapping("/makeProject.do")
		public String showMakeProject(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "makeProject";
		}

		// ����Ʈ ���� ������
		@GetMapping("/chargePoints.do")
		public String showChargePoints(HttpSession session) {
			session.setAttribute("headerSelect", "myFarm");
			return "chargePoints";
		}

		// ������ȣ ���
		@GetMapping("/cerNumModal.do")
		public String cerNumModal() {
			return "signUp/validationModal";
		}

		// ȸ������ ������
		@GetMapping("/signup.do")
		public String showSignUpIndex() {
			return "signUp/signupIndex";
		}

		// ȸ������ ������ ajax
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
