package com.farmfarm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartVO;
import com.farmfarm.dto.MyPageUserFundingDetailVO;
import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.model.MyPageService;
import com.farmfarm.model.MyPageUserService;
import com.farmfarm.model.UserNavCntService;
import com.farmfarm.model.UsersService;
import com.farmfarm.model.pwdSha256;



@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {

	@Autowired
	MyPageUserService service;

	@Autowired
	UserNavCntService UserNavCntService;

	@Autowired
	MyPageService myPageService;

	@Autowired
	UsersService userService;

	Logger logger = LoggerFactory.getLogger(MypageUserController.class);

	@GetMapping(value = "/navBarCnt")
	@ResponseBody
	public HashMap<String, Object> navBarCnt(HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		String user_serial_num = (String) session.getAttribute("serial_num");
		map = UserNavCntService.getUserInfo(user_serial_num);
		System.out.println(map);
		return map;
	}
	
	@GetMapping("/chatting")
	public String Chatting() {
		return "myPage/user/JHMESSAGE";
	}

	

	@GetMapping("/farmMoneyCharge")
	public String showChargePoints() {
		return "myPage/user/farmMoneyCharge";
	}

	@PostMapping("/farmMoneyChargeCallAPI")
	@ResponseBody
	public HashMap<String, String> farmMoneyChargeCallAPI(Model model, HttpSession session) {
		HashMap<String, String> data = myPageService.farmMoneyChargeCallAPI(session);
		return data;
	}

	// 재호
	@GetMapping("/usedfarmList")
	public String showfarmList(Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> farmList = (List<Map<String, Object>>) service.usedfarmList(user_serial_num);
		model.addAttribute("farmList", farmList);
		return "myPage/user/usedfarmmoney";
	}

	@PostMapping("/searchDate")
	public String showSearchDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> showSearchDate = (List<Map<String, Object>>) service.showSearchDate(user_serial_num,
				startDate, endDate);
		model.addAttribute("showSearchDate", showSearchDate);
		return "myPage/user/usedfarmmoney_Ajax";
	}

	@GetMapping("/depositList")
	public String showdepositList(Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> depositList = (List<Map<String, Object>>) service.depositList(user_serial_num);
		model.addAttribute("depositList", depositList);
		System.out.println(depositList);
		return "myPage/user/depositList";
	}

	@GetMapping("/InputPW")
	public String passwdchangeForm() {
		return "myPage/user/checkANDchange";
	}
	
	@ResponseBody
	@PostMapping("/passwdchange") 
	public String passwdchange(HttpSession session,String originalPass, String newPasswd) throws Exception { 
			String user_serial_num = (String) session.getAttribute("serial_num"); 
			String user_passwd = userService.pwCheck(user_serial_num); 
			String encrytPw = pwdSha256.encrypt(originalPass); 
			String message = "";
			
			System.out.println(originalPass);
			System.out.println(newPasswd);
			System.out.println(user_serial_num);
			System.out.println(user_passwd);
			
			if (user_passwd.equals(encrytPw)) {
			  String encrytNewPw = pwdSha256.encrypt(newPasswd); 
			  session.setAttribute("user_pw", encrytNewPw);
			  userService.changePw(user_serial_num, encrytNewPw); 
			  message = "1";
			  } else { 
				  message ="0"; } 
			System.out.println(message); 
			return message; 
			}
	// 재호
	
	
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
		model.addAttribute("product_serial_num",product_serial_num);
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
		List<MyPageUserCartVO> myCartFundingList = service.myPageCartFundingList(user_serial_num); //내가 찜한 펀딩 리스트 모두 가져오기
		System.out.println(myCartFundingList);
		model.addAttribute("myCartFundingList", myCartFundingList);
		return "myPage/user/myCartList";
	}

	@GetMapping("/myCartFundingList")
	public String showMyCartFundingList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); //session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserCartVO> myCartFundingList = service.myPageCartFundingList(user_serial_num); //내가 찜한 펀딩 리스트 모두 가져오기
		System.out.println(myCartFundingList);
		model.addAttribute("myCartFundingList", myCartFundingList);
		return "myPage/user/myCartFundingList";
	}
	
	@GetMapping("/myCartAuctionList")
	public String showMyCartAuctionList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); //session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserCartVO> myCartAuctionList = service.myPageCartAuctionList(user_serial_num); //내가 찜한 경매 리스트 모두 가져오기
		System.out.println(myCartAuctionList);
		model.addAttribute("myCartAuctionList", myCartAuctionList);
		return "myPage/user/myCartAuctionList";
	}
	
}



