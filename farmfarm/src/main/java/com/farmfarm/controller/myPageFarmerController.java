package com.farmfarm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.farmfarm.model.FarmersService;

@Controller
@RequestMapping("/myPageFarmer")
public class myPageFarmerController {
	
	@Autowired
	FarmersService fService;
	
	@RequestMapping(value = "/regFarm", method = RequestMethod.GET)
	public String regFarm() {
		return "myPage/Farmer/regFarm";
	}
	
	
	@RequestMapping(value = "/regProduct", method = RequestMethod.GET)
	public String findUser(HttpServletRequest request, HttpSession session) {
		return "myPage/Farmer/regProduct";
	}
	
	
	
}
