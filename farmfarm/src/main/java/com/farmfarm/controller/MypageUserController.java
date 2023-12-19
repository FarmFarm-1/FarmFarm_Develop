package com.farmfarm.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.model.MyPageUserService;
import com.farmfarm.model.UserNavCntService;

@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {

	@Autowired
	MyPageUserService service;

	@Autowired
	UserNavCntService UserNavCntService;

	@GetMapping(value = "/navBarCnt")
	@ResponseBody
	public HashMap<String, Object> navBarCnt(HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		String user_serial_num = (String) session.getAttribute("serial_num");
		map = UserNavCntService.getUserInfo(user_serial_num);
		System.out.println(map);
		return map;
	}

	@GetMapping("/showMore")
	public String showMore() {
		return "myPage/user/showMore";
	}

	@GetMapping("/myFundingList")
	public String showMyFundingList(HttpSession session, Model model) {

		String user_serial_num = (String) session.getAttribute("serial_num"); // session�뿉 ���옣�맂 user_serial_num
																				// 媛��졇�삤湲�
		System.out.println(user_serial_num);

		List<MyPageUserFundingVO> myFundingList = service.myPageFundingList(user_serial_num); // �궡媛� ���뵫�븳 由ъ뒪�듃
																								// 媛��졇�삤湲�
		System.out.println(myFundingList);

		model.addAttribute("myFundingList", myFundingList);

		return "myPage/user/myFundingList";
	}

	@GetMapping("/myFundingListShowMore")
	public String showMyFundingListShowMore() {
		return "myPage/user/myFundingListShowMore";
	}

	@GetMapping("/myAuctionList")
	public String showMyAuctionList(HttpSession session, Model model) {

		String user_serial_num = (String) session.getAttribute("serial_num"); // session�뿉 ���옣�맂 user_serial_num
																				// 媛��졇�삤湲�
		System.out.println(user_serial_num);
		List<MyPageUserAuctionVO> myAuctionList = service.myPageAuctionList(user_serial_num); // �궡媛� 寃쎈ℓ�븳 由ъ뒪�듃
																								// 媛��졇�삤湲�
		System.out.println(myAuctionList);
		model.addAttribute("myAuctionList", myAuctionList);
		return "myPage/user/myAuctionList";
	}

	@GetMapping("/myCartList")
	public String showMyCartList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); // session�뿉 ���옣�맂 user_serial_num
																				// 媛��졇�삤湲�
		System.out.println(user_serial_num);
		List<MyPageUserCartFundingVO> myCartFundingList = service.myPageCartFundingList(user_serial_num); // �궡媛� 李쒗븳
																											// ���뵫
																											// 由ъ뒪�듃
																											// 媛��졇�삤湲�
		System.out.println(myCartFundingList);
		model.addAttribute("myCartFundingList", myCartFundingList);
		return "myPage/user/myCartList";
	}

}
