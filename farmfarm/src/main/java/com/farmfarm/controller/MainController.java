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
	
	
}
