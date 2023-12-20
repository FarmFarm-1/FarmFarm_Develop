package com.farmfarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingDetailVO;
import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.model.MyPageUserService;

@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {
	
	@Autowired
	MyPageUserService service;

	@GetMapping("/myFundingList")
	public String showMyFundingList(HttpSession session, Model model) {
		
		String user_serial_num = (String) session.getAttribute("serial_num"); //session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		
		List<MyPageUserFundingVO> myFundingList = service.myPageFundingList(user_serial_num); //내가 펀딩한 리스트 가져오기
		System.out.println(myFundingList);
		
		model.addAttribute("myFundingList", myFundingList);
		
		return "myPage/user/myFundingList";
	}
	
	@PostMapping("/myFundingListShowMore")
	public String showMyFundingListShowMore(String product_serial_num,Model model) {
		System.out.println(product_serial_num);
		List<MyPageUserFundingDetailVO> fundingDetail=service.myPageFundingListDetail(product_serial_num);
		System.out.println(fundingDetail);
		model.addAttribute("fundingDetail",fundingDetail);
		
		if(fundingDetail.size()!=0) {
			model.addAttribute("status",fundingDetail.get(0).getCultivate_status());
		}
		
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
		List<MyPageUserCartFundingVO> myCartAllList = service.myPageCartAllList(user_serial_num); //내가 찜한 리스트 모두 가져오기
		System.out.println(myCartAllList);
		model.addAttribute("myCartAllList", myCartAllList);
		return "myPage/user/myCartList";
	}

}
