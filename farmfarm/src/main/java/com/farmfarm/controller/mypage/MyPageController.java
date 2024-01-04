package com.farmfarm.controller.mypage;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.Farmer_account_historyVO;
import com.farmfarm.dto.User_account_historyVO;
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
	
	@ResponseBody
	@PostMapping("/chargePointCfrm")
	public ResponseEntity<Integer> chargePointCfrm(int paid_amount, HttpSession session) {
		int result = myPageService.chargePointCfrm(paid_amount,session);
		if(result == 1) {
			return ResponseEntity.ok(result);	
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
		}
	}
	
	
	@GetMapping("/accountRegister")
	public String accountRegister(HttpSession session, Model model) {
		if (((String) session.getAttribute("serial_num")).substring(0, 2).equals("us")) {
			HashMap<String, Object> data = myPageService.accountExistence(session);
			String account_holder = (String) data.get("account_holder");
			User_account_historyVO vo = (User_account_historyVO) data.get("account_info");
			if (vo != null) {
				model.addAttribute("account_holder", account_holder);
				model.addAttribute("account_bank", vo.getUser_bank());
				model.addAttribute("account_num", vo.getUser_account());
				return "myPage/accountShow";
			} else {
				return "myPage/accountRegister";
			}
		} else if(((String) session.getAttribute("serial_num")).substring(0, 2).equals("FA")) {
			HashMap<String, Object> data = myPageService.accountExistence(session);
			String account_holder = (String) data.get("account_holder");
			Farmer_account_historyVO vo = (Farmer_account_historyVO) data.get("account_info");
			if (vo != null) {
				model.addAttribute("account_holder", account_holder);
				model.addAttribute("account_bank", vo.getFarmer_bank());
				model.addAttribute("account_num", vo.getFarmer_account());
				return "myPage/accountShow";
			} else {
				return "myPage/accountRegister";
			}
		}
		return "/login";
	}

	@PostMapping("/verifyAndRegAccount")
	@ResponseBody
	public String verifyAndRegAccount(@RequestParam HashMap<String, String> data, HttpSession session) {
		String returnMessage = myPageService.verifyAndRegAccount(data, session);
		System.out.println(returnMessage);
		if (returnMessage.equals("UserAccountRegisterSuccess")) {
			return "UserSuccess";
		} else if(returnMessage.equals("UserAccountRegisterFail")) {
			return "UserFail";
		} else if(returnMessage.equals("FarmerAccountRegisterSuccess")) {
			return "FarmerSuccess";
		} else if(returnMessage.equals("FarmerAccountRegisterFail") || returnMessage.equals("FarmerNotCoincide")) {
			return "FarmerFail";
		} else if(returnMessage.equals("UserNotCoincide")) {
			return "UserNotCoincide";
		} else if (returnMessage.equals("FarmerNotCoincide")) {
			return "FarmerNotCoincide";
		} else {
			return "fail";
		}
	}
	
	@PostMapping("/changeAccount")
	@ResponseBody
	public String changeAccount(HttpSession session) {
		
		return null;
	}
	
	
}