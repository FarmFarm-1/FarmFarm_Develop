package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.User_cartVO;
import com.farmfarm.model.AuctionService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	AuctionService auctionService;
	
	@ResponseBody
	@PostMapping("/addcart")
	public void addcart(User_cartVO user_cartVO) {
		auctionService.addMyCart(user_cartVO);	
	}
	
	@ResponseBody
	@PostMapping("/deletecart")
	public void deletecart(User_cartVO user_cartVO) {
		auctionService.deletecart(user_cartVO);
	}
	
	@ResponseBody
	@PostMapping("/reloadCart")
	public String reloadCart(String product_serial_num) {
		return Integer.toString(auctionService.bookmarkCnt(product_serial_num));
	}
	@ResponseBody
	@PostMapping("/pointCheck")
	public String beforeAuctionCfrm(int inputNum, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		int user_point = auctionService.pointCheck(user_serial_num);
		if(user_point >= inputNum) {
			return "able";
		} else {
			return "disable";
		}
	}
	
	
}
