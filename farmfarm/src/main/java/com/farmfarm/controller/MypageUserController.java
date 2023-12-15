package com.farmfarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.model.MyPageUserService;

@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {
	
	@Autowired
	MyPageUserService service;
	
	@GetMapping("/donutProgressBar")
	public String showProgressBar() {
		return "myPage/user/donutProgressBar";
	}
	
	@GetMapping("/showMore")
	public String showMore() {
		return "myPage/user/showMore";
	}

	/*
	 * @GetMapping("/myFundingList") public String showMyFundingList() { return
	 * "myPage/user/myFundingList"; }
	 */

	@GetMapping("/myFundingList")
	public String showMyFundingList(HttpSession session, Model model) {
		
		String user_serial_num = (String) session.getAttribute("serial_num");
		System.out.println(user_serial_num);
		List<MyPageUserFundingVO> myFundingList = service.myPageFundingList(user_serial_num);
		System.out.println(myFundingList);
		model.addAttribute("myFundingList", myFundingList);
		
		/* int result = service.myFundingRate(); */
		
		return "myPage/user/myFundingList";
	}
}
