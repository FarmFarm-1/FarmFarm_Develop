package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

	@GetMapping("/")
	public String showmain(HttpSession session) {
		//session.setAttribute("serial_num", "us1010101010");
		//session.setAttribute("serial_num", "FA1010101010");
		session.removeAttribute("headerSelect");
		return "loginIndex";
	}


	@GetMapping("/login")
	public String showLogin() {
		return "login/login";
	}	
	
	@GetMapping("/signup")
	public String showSignUpIndex() {
		return "signUp/signupIndex";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("serial_num");
		return "loginIndex";
	}

	/*아래는 헤더용 매핑입니다.*/
	// 메인 페이지
	@GetMapping("/main")
	public String showMain(HttpSession session) {
		session.removeAttribute("headerSelect");
		return "loginIndex";
	}

	// 펀딩 페이지
	@GetMapping("/funding")
	public String showFunding(HttpSession session) {
		session.setAttribute("headerSelect", "funding");
		return "/";
	}

	// 경매 페이지
	@GetMapping("/auction")
	public String showAuction(HttpSession session) {
		session.setAttribute("headerSelect", "auction");
		return "/";
	}
	
	@GetMapping("/myPageFarmer")
	public String showMyFarmFarmer(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		session.removeAttribute("MyFarmer");
		return "myPage/Farmer/menubar_farmer";
	}
	
	
	// 쪽지함 페이지
	@GetMapping("/messageBox")
	public String showMessageBox(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}

	// 마이프로젝트 페이지
	@GetMapping("/makeProject")
	public String showMakeProject(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		session.setAttribute("MyFarmer", "makeProject");
		return "myPage/Farmer/menubar_farmer";
	}
	
	@GetMapping("/regPro")
	public String regPro() {
		return "myPage/Farmer/regProduct";
	}

	// 포인트 충전 페이지
	@GetMapping("/chargePoints")
	public String showChargePoints(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}


	
	
}
