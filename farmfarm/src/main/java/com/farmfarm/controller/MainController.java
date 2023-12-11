package com.farmfarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String showmain() {
		return "loginIndex";
	}
	
	@GetMapping("/login.do")
	public String showLogin() {
		return "login/login";
	}
	
	@GetMapping("/signup.do")
	public String showSignUpIndex() {
		return "signUp/signupIndex";
	}
	
	@GetMapping("/s_signup1.do")
	public String showSSignup1() {
		return "signUp/s_signup1";
	}
	
	@GetMapping("/s_signup2.do")
	public String showSSignup2() {
		return "signUp/s_signup2";
	}
	
	/*
	 * @GetMapping("/s_signup3.do") public String showSignUp3() { return
	 * "signUp/s_signup3"; }
	 */
	
	/*
	 * @PostMapping("/ssignup.do") public String showSignUpPost3() { return
	 * "signUp/s_signup3"; }
	 */
	
	/*
	 * @PostMapping("/s_signup3Post.do") public String showSignUp3Post() { return
	 * "signUp/s_signup3"; }
	 */
	
	@GetMapping("/f_signup1.do")
	public String showFSignUp1() {
		return "signUp/f_signup1";
	}
	
	@GetMapping("/f_signup2.do")
	public String showFSignUp2() {
		return "signUp/f_signup2";
	}
	
	@GetMapping("/f_signup3.do")
	public String showFSignUp3() {
		return "signUp/f_signup3";
	}
	
	@GetMapping("/signup_modal.do")
	public String showModal() {
		return "signUp/signupModal";
	}
}
