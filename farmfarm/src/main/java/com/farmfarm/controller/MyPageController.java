package com.farmfarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.farmfarm.dto.User_cartVO;
import com.farmfarm.model.ProductService;

@RestController
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	ProductService productService;
	
	
	@PostMapping("/addcart")
	public void addcart(User_cartVO user_cartVO) {
		int result = productService.addMyCart(user_cartVO);
		if(result == 1) {
			System.out.println("�߰� �Ϸ�");
		}
	}
	@PostMapping("/deletecart")
	public void deletecart(User_cartVO user_cartVO) {
		int result = productService.deletecart(user_cartVO);
		if(result == 1) {
			System.out.println("���� �Ϸ�");
		}
	}
	
	@PostMapping("/reloadCart")
	public String reloadCart(String product_serial_num) {
		return Integer.toString(productService.bookmarkCnt(product_serial_num));
	}
	
	
	@PostMapping("/pointCheck")
	public String beforeAuctionCfrm(int inputNum, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		int user_point = productService.pointCheck(user_serial_num);
		if(user_point >= inputNum) {
			return "able";
		} else {
			return "disable";
		}
	}
	
		
}
