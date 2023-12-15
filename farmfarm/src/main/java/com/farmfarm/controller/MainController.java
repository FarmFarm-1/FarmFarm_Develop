package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String showmain(HttpSession session) {
		// session.setAttribute("serial_num", "us1010101010");
		// session.setAttribute("serial_num", "FA1010101010");
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

	/* �븘�옒�뒗 �뿤�뜑�슜 留ㅽ븨�엯�땲�떎. */
	// 硫붿씤 �럹�씠吏�
	@GetMapping("/main")
	public String showMain(HttpSession session) {
		session.removeAttribute("headerSelect");
		return "loginIndex";
	}

	// ���뵫 �럹�씠吏�
	@GetMapping("/funding")
	public String showFunding(HttpSession session) {
		session.setAttribute("headerSelect", "funding");
		return "/";
	}

	// 寃쎈ℓ �럹�씠吏�
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

	@GetMapping("/myPageUser")
	public String showMyPageUser(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "myPage/user/menubar_supporter";
	}

	// 履쎌��븿 �럹�씠吏�
	@GetMapping("/messageBox")
	public String showMessageBox(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}

	// 留덉씠�봽濡쒖젥�듃 �럹�씠吏�
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

	// �룷�씤�듃 異⑹쟾 �럹�씠吏�
	@GetMapping("/chargePoints")
	public String showChargePoints(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}

}
