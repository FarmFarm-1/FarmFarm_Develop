package com.farmfarm.controller;

import java.util.HashMap;
import java.util.List;

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

import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.dto.User_account_historyVO;
import com.farmfarm.model.MyPageService;
import com.farmfarm.model.MyPageUserService;

@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {
	
	Logger logger = LoggerFactory.getLogger(MypageUserController.class);
	
	@Autowired
	MyPageUserService service;
	
	@Autowired
	MyPageService myPageService;
	
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
	
	@GetMapping("/accountRegister")
	public String accountRegister(HttpSession session, Model model) {
		if(((String)session.getAttribute("serial_num")).substring(0,2).equals("us")) {
			HashMap<String, Object> data = myPageService.accountExistence(session);
			String account_holder = (String)data.get("account_holder");
			User_account_historyVO vo = (User_account_historyVO)data.get("account_info");
			if(vo != null) {
				model.addAttribute("account_holder", account_holder);
				model.addAttribute("account_bank",vo.getUser_bank());
				model.addAttribute("account_num", vo.getUser_account());;
				return "myPage/accountShow";
			} else {
				return "myPage/accountRegister";
			}
		}
		return "/";
		
	}
	
	@PostMapping("/verifyAndRegAccount")
	@ResponseBody
	public String verifyAndRegAccount(@RequestParam HashMap<String, String> data, HttpSession session) {
		String returnMessage = myPageService.verifyAndRegAccount(data, session);
		logger.warn(returnMessage);
		if(returnMessage.equals("AccountRegisterSuccess")) {
			return "success";
		} else {
			return "fail";
		}
	}
}
