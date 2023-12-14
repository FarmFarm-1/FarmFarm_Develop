package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.User_cartVO;
import com.farmfarm.model.FundingDetailService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	FundingDetailService fundingService;

	@ResponseBody
	@PostMapping("/addcart")
	public void addcart(User_cartVO user_cartVO) {
		fundingService.addMyCart(user_cartVO);
		System.out.println(user_cartVO);
	}

	@ResponseBody
	@PostMapping("/deletecart")
	public void deletecart(User_cartVO user_cartVO) {
		fundingService.deletecart(user_cartVO);
	}

	@ResponseBody
	@PostMapping("/reloadCart")
	public String reloadCart(String product_serial_num) {
		return Integer.toString(fundingService.bookmarkCnt(product_serial_num));
	}

	@PostMapping("/pointCheck")
	public String beforeAuctionCfrm(int result, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		int user_point = fundingService.pointCheck(user_serial_num);
		System.out.println("유저 포인트 : "+user_point);
		System.out.println("입력한 값: " +result);
		
		if(user_point >= result) {
			return "able";
		} else {
			return "disable";
		}
	}
}
