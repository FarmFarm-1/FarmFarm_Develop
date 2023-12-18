package com.farmfarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.model.MyPageUserService;

@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {
	
	@Autowired
	MyPageUserService service;
	
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
		
		String user_serial_num = (String) session.getAttribute("serial_num"); //session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserFundingVO> myFundingList = service.myPageFundingList(user_serial_num); //내가 펀딩한 리스트 가져오기
		System.out.println(myFundingList);
		model.addAttribute("myFundingList", myFundingList);
		
		/* int result = service.myFundingRate(); */
		
		return "myPage/user/myFundingList";
	}
	
	@GetMapping("/myFundingListShowMore")
	public String showMyFundingListShowMore() {
		return "myPage/user/myFundingListShowMore";
	}
	

	@GetMapping("/myAuctionList")
	public String showMyAuctionList(HttpSession session, Model model) {
		
		String user_serial_num = (String) session.getAttribute("serial_num"); //session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserAuctionVO> myAuctionList = service.myPageAuctionList(user_serial_num); //내가 경매한 리스트 가져오기
		System.out.println(myAuctionList);
		model.addAttribute("myAuctionList", myAuctionList);
		return "myPage/user/myAuctionList";
	}

	
	@GetMapping("/myCartList")
	public String showMyCartList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); //session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserCartFundingVO> myCartFundingList = service.myPageCartFundingList(user_serial_num); //내가 찜한 펀딩 리스트 가져오기
		System.out.println(myCartFundingList);
		model.addAttribute("myCartFundingList", myCartFundingList);
		return "myPage/user/myCartList";
	}

}
