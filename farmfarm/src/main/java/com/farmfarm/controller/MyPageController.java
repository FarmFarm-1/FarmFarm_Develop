package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.User_cartVO;
import com.farmfarm.model.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	MyPageService myPageService;

	@ResponseBody
	@PostMapping("/addcart")
	public void addcart(User_cartVO user_cartVO) {
		myPageService.addMyCart(user_cartVO);	
	}
	
	@ResponseBody
	@PostMapping("/deletecart")
	public void deletecart(User_cartVO user_cartVO) {
		myPageService.deletecart(user_cartVO);
	}
	
	@ResponseBody
	@PostMapping("/reloadCart")
	public String reloadCart(String product_serial_num) {
		return Integer.toString(myPageService.bookmarkCnt(product_serial_num));
	}
	@ResponseBody
	@PostMapping("/pointCheck")
	public String beforePurchaseProcessCfrm(int inputNum, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		int user_point = myPageService.pointCheck(user_serial_num);
		if(user_point >= inputNum) {
			return "able";
		} else {
			return "disable";
		}
	}
}