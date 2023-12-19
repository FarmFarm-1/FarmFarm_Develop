package com.farmfarm.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.Farmer_account_historyVO;
import com.farmfarm.dto.User_account_historyVO;
import com.farmfarm.model.FarmersService;
import com.farmfarm.model.MyPageService;

@Controller
@RequestMapping("/myPageFarmer")
public class myPageFarmerController {
	
	@Autowired
	FarmersService fService;
	
	@Autowired
	MyPageService myPageService;
	
	Logger logger = LoggerFactory.getLogger(myPageFarmerController.class);
	
	@RequestMapping(value = "/regFarm", method = RequestMethod.GET)
	public String regFarm() {
		return "myPage/Farmer/regFarm";
	}
	
	
	@RequestMapping(value = "/regProduct", method = RequestMethod.GET)
	public String findUser(HttpServletRequest request, HttpSession session) {
		session.setAttribute("curFind", "user");
		return "myPage/Farmer/regProduct";
	}
	
	@GetMapping("/accountRegister")
	public String accountRegister(HttpSession session, Model model) {
		if(((String)session.getAttribute("serial_num")).substring(0,2).equals("FA")) {
			HashMap<String, Object> data = myPageService.accountExistence(session);
			String account_holder = (String)data.get("account_holder");
			Farmer_account_historyVO vo = (Farmer_account_historyVO)data.get("account_info");
			if(vo != null) {
				model.addAttribute("account_holder", account_holder);
				model.addAttribute("account_bank",vo.getFarmer_bank());
				model.addAttribute("account_num", vo.getFarmer_account());
				return "myPage/accountShow";
			} else {
				return "myPage/accountRegister";
			}
		} else {
			return "/";
		}
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
