package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.ProductService;

@Controller
@RequestMapping("/mypage")
public class FarmerMyPageController {

	@Autowired
	ProductService productService;
	
	
	@GetMapping("/projectList")
	public String showFundingList(HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		return "mypage/menubar_farmer";
	}

	
}
