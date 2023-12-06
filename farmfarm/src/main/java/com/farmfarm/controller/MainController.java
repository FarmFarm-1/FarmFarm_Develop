package com.farmfarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String showmain() {
		return "loginIndex";
	}
	
	@GetMapping("/signup.do")
	public String showSignUp1() {
		return "signUp/signup1";
	}
	
	@GetMapping("/signup2.do")
	public String showSignUp2() {
		return "signUp/signup21";
	}
	
	@GetMapping("/signup3.do")
	public String showSignUp3() {
		return "signUp/signup31";
	}
}
