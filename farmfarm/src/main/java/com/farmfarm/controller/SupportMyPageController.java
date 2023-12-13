package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.ProductService;

@Controller
@RequestMapping("/mypage")
public class SupportMyPageController {

	@Autowired
	ProductService productService;
	
	
	@GetMapping("/fundingList")
	public String showFundingList(HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		return "mypage/menubar_supporter";
	}

	
}
