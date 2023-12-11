package com.farmfarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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


}
